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
        .doc("B1UI1")
        .get();

      if (!batchRef.exists) {
        return res.status(404).json({ error: "Batch not found" });
      }

      console.log(batchRef.data());

      //authenticate with password
      if (password !== batchRef.data().DOB) {
        return res.status(401).json({ error: "Invalid password" });
      }

      // Assuming authentication is successful
      return res.status(200).json({
        message: "Login successful",
        batchID: batchID,
        qps: qps,
        studentNumber: studentNumber,
        QPno: qpNum,
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

  try {
    // Get a reference to the document
    const studentRef = firestore
      .collection("Batches")
      .doc(batchID)
      .collection("Results")
      .doc(studentID);

    // Set the data for the document
    await studentRef.set({
      // Add any data you want to store for the student
      // You may want to include additional fields here
    });

    // Create a reference to the subcollection
    const optionsSelectedRef = studentRef.collection("options_selected");

    // Iterate through options_selected and add documents to the subcollection
    for (const option of options_selected) {
      // Set the document ID based on option.question_num
      await optionsSelectedRef.doc(option.question_num.toString()).set(option);
    }

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
