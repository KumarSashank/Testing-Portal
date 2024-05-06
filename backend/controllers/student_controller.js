`use strict`;

const db = require("../db");
const firebase = require("firebase-admin");

const firestore = db;

module.exports.studentLogin = async (req, res) => {
  const { studentID, password } = req.body;

  try {
    // Extracting parts from the student ID
    const matches = studentID.match(/^([A-Z]+\d+)([A-Z]+)(\d+)$/);

    if (matches) {
      const [_, batchID, qps, studentNumber] = matches;

      // Log the extracted parts
      console.log("Batch ID:", batchID); // Expected: B1999
      console.log("QPS:", qps); // Expected: UI
      console.log("Student Number:", studentNumber); // Expected: 101

      const qpRef = await firestore.collection("Batches").doc(batchID).get();
      if (!qpRef.exists) {
        return res.status(404).json({ error: "Batch not found" });
      }
      const qpNum = qpRef.data().qpNo;

      // Fetch the batch document from Firestore
      const batchRef = await firestore
        .collection("Batches")
        .doc(batchID)
        .collection("students")
        .doc(studentID)
        .get();

      if (!batchRef.exists) {
        return res.status(404).json({ error: "Batch not found" });
      }

      console.log(batchRef.data());

      //change string to integer
      const passCheck = parseInt(password, 10);
      if (passCheck !== batchRef.data().DOB) {
        return res.status(401).json({ error: "Invalid password" });
      }

      //fetch student details
      const studentDetails = batchRef.data();
      // Assuming authentication is successful
      return res.status(200).json({
        message: "Login successful",
        batchID: batchID,
        qps: qps,
        studentNumber: studentNumber,
        QPno: qpNum,
        studentDetails,
      });
    } else {
      console.error("Invalid student ID format");
      return res.status(400).json({ error: "Invalid student ID format" });
    }
  } catch (error) {
    console.error("Error accessing Firestore:", error);
    return res.status(500).json({ error: "Internal server error" });
  }
};

//retrieving the questions from the database
module.exports.getQuestionPaper = async (req, res) => {
  const { qps, QPno } = req.body;
  try {
    const questionsRef = await firestore
      .collection("question_papers")
      .doc(qps)
      .collection("papers")
      .doc(QPno)
      .collection("questions")
      .get();

    const questionsData = [];
    questionsRef.forEach((doc) => {
      const {
        ANS,
        Option1,
        Option2,
        Option3,
        Option4,
        QuestionTypeID,
        "s.no": sNo,
        PCIDsWithMarks,
        Question,
        Marks,
        QuestionLevelID,
      } = doc.data();
      questionsData.push({
        ANS,
        Option1,
        Option2,
        Option3,
        Option4,
        QuestionTypeID,
        "s.no": sNo,
        PCIDsWithMarks,
        Question,
        Marks,
        QuestionLevelID,
      });
    });

    return res.status(200).json(questionsData);
  } catch (error) {
    console.error("Error accessing Firestore:", error);
    return res.status(500).json({ error: "Internal server error" });
  }
};

//submitting test
module.exports.submitTest = async (req, res) => {
  const { options_selected, studentID, batchID } = req.body;

  console.log("Student ID:", studentID);
  console.log("Batch ID:", batchID);

  console.log("Options Selected:", options_selected);

  try {
    // Get a reference to the document
    const studentRef = firestore
      .collection("Batches")
      .doc(batchID)
      .collection("Results")
      .doc(studentID);

    // Set the data for the document including options_selected directly
    await studentRef.set({
      options_selected, // Store the entire options_selected object directly
      // Add any additional data you want to store for the student here
    });

    // No need to iterate through options_selected to create subcollection documents

    return res.status(200).json({ success: true });
  } catch (err) {
    console.error("Error submitting test:", err);
    return res.status(500).json({ error: "Internal server error" });
  }
};

//process result
module.exports.processResult = async (req, res) => {
  const { batchID } = req.body;
  const totalMarksMap = {}; // Object to store total marks for each student

  try {
    // Get a reference to the collection of student documents
    const studentsSnapshot = await firestore
      .collection("Batches")
      .doc(batchID)
      .collection("Results")
      .get();

    // Iterate through each student's document
    for (const studentDoc of studentsSnapshot.docs) {
      let totalMarks = 0;

      // Get a reference to the subcollection 'options_selected' for the current student
      const optionsSelectedRef = studentDoc.ref.collection("options_selected");

      // Iterate through each document in 'options_selected'
      const optionsSnapshot = await optionsSelectedRef.get();
      optionsSnapshot.forEach((optionDoc) => {
        const optionData = optionDoc.data();
        // Compare 'option_selected' with 'answer'
        if (optionData.option_selected === optionData.answer) {
          // Add marks to totalMarks if 'option_selected' matches 'answer'
          totalMarks += optionData.marks;
        }

        //pushing the student result to the database
        const resultRef = studentDoc.ref.set({ totalMarks: totalMarks });
      });

      // Store the total marks for the current student
      totalMarksMap[studentDoc.id] = totalMarks;
    }

    // Send the total marks map as response
    return res.status(200).json(totalMarksMap);
  } catch (error) {
    console.error("Error processing results:", error);
    return res.status(500).json({ error: "Internal server error" });
  }
};

module.exports.processResult2 = async (req, res) => {
  const { batchID } = req.body;
  console.log("Batch ID:", batchID);

  try {
    const batchRef = await firestore.collection("Batches").doc(batchID).get();
    if (!batchRef.exists) {
      return res.status(404).json({ error: "Batch not found" });
    }

    const qpNum = batchRef.data().qpNo;
    const QPS = batchRef.data().QPS;

    console.log("QP Number:", qpNum);
    console.log("QPS:", QPS);

    let questionsRef;

    //get the correct answers from the database
    try {
      questionsRef = await firestore
        .collection("question_papers")
        .doc(QPS)
        .collection("papers")
        .doc(qpNum.toString())
        .collection("questions")
        .get();
    } catch (error) {
      console.error("Error accessing Firestore:", error);
      return res.status(500).json({ error: "Internal server error" });
    }

    //storing the correct answers and it marks
    const answersAndMarks = {};
    questionsRef.forEach((doc) => {
      const questionData = doc.data();
      answersAndMarks[doc.id] = {
        answer: questionData.ANS,
        marks: questionData.Marks,
      };
    });

    console.log(answersAndMarks);

    // Prepare an object to store total marks for each student
    const totalMarksMap = {};

    // Get a reference to the collection of student documents
    const studentsSnapshot = await firestore
      .collection("Batches")
      .doc(batchID)
      .collection("Results")
      .get();

    // Process results for each student
    for (const studentDoc of studentsSnapshot.docs) {
      let totalMarks = 0;
      const optionsSelected = studentDoc.data().options_selected;

      // Calculate total marks based on the student's selected options
      for (const questionID in optionsSelected) {
        let correct = false;
        if (
          optionsSelected.hasOwnProperty(questionID) &&
          answersAndMarks.hasOwnProperty(questionID)
        ) {
          if (
            optionsSelected[questionID] === answersAndMarks[questionID].answer
          ) {
            correct = true;
            totalMarks += answersAndMarks[questionID].marks;
          }
        }
        console.log(
          "QP_no:",
          questionID,
          " :",
          optionsSelected[questionID],
          ":",
          answersAndMarks[questionID].answer,
          ":",
          answersAndMarks[questionID].marks,
          ":",
          correct ? "Correct" : "Incorrect"
        );
      }

      // Update the student's document with the total marks
      await studentDoc.ref.update({ totalMarks });

      // Store the total marks for the current student
      totalMarksMap[studentDoc.id] = totalMarks;
    }

    // Send the total marks map as response
    return res.status(200).json(totalMarksMap);
  } catch (error) {
    console.error("Error processing results:", error);
    return res.status(500).json({ error: "Internal server error" });
  }
};

module.exports.getResults = async (req, res) => {
  const { batchID } = req.body;

  try {
    const resultsRef = await firestore
      .collection("Batches")
      .doc(batchID)
      .collection("Results")
      .get();

    const resultsData = [];
    resultsRef.forEach((doc) => {
      const { totalMarks } = doc.data();
      resultsData.push({
        studentID: doc.id,
        totalMarks,
      });
    });

    return res.status(200).json(resultsData);
  } catch (error) {
    console.error("Error accessing Firestore:", error);
    return res.status(500).json({ error: "Internal server error" });
  }
};
