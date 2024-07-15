`use strict`;

const db = require("../db");
const firebase = require("firebase-admin");
const fs = require("fs");
const { Storage } = require("@google-cloud/storage");
const storage = new Storage();
const util = require("util");
const unlinkAsync = util.promisify(fs.unlink);

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

      //check whether student is already submitted the test or not
      if (!batchRef.data().submitted) {
        return res.status(400).json({ error: "Test already submitted" });
      }
      //count the student login and store in db
      const count = batchRef.data().count;
      //if count variable is not there, add count variable with 1
      if (!count) {
        await batchRef.ref.update({ count: 1 });
      }
      //if count variable is there, update the count variable with 1
      else {
        await batchRef.ref.update({ count: count + 1 });
      }
      console.log("count", count);
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

    const studentRef2 = firestore
      .collection("Batches")
      .doc(batchID)
      .collection("students")
      .doc(studentID);
    await studentRef2.update({
      submitted: true,
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
    let cutoff;

    //get the correct answers from the database
    try {
      const QPref = await firestore
        .collection("question_papers")
        .doc(QPS)
        .collection("papers")
        .doc(qpNum.toString())
        .get();

      cutoff = QPref.data().cutoff;
      console.log("cutoff:", cutoff);

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

      let pass = false;
      if (totalMarks >= cutoff) {
        pass = true;
      }
      // Update the student's document with the total marks and pass
      await studentDoc.ref.update({
        totalMarks: totalMarks,
        pass: pass,
      });

      const result = {
        totalMarks: totalMarks,
        pass: pass,
      };

      // Store the total marks for the current student
      totalMarksMap[studentDoc.id] = result;
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
      const { totalMarks, pass } = doc.data();
      resultsData.push({
        studentID: doc.id,
        totalMarks,
        pass,
      });
    });

    return res.status(200).json(resultsData);
  } catch (error) {
    console.error("Error accessing Firestore:", error);
    return res.status(500).json({ error: "Internal server error" });
  }
};

module.exports.studentImgUpload = async (req, res) => {
  try {
    const file = req.file;
    //checking whether file is uploaded to server or not
    if (!file) {
      return res.status(400).send("No file uploaded.");
    }

    const { studentid, batchID } = req.body;

    //calling uploadquestionpapers function
    const responseJson = await uploadFileToStorage(file, batchID, studentid);

    // Delete the uploaded file after the total process completed
    await unlinkAsync(file.path);
    console.log("Uploaded file deleted successfully.");

    // store the link in student document
    const studentRef = firestore
      .collection("Batches")
      .doc(batchID)
      .collection("students")
      .doc(studentid);
    await studentRef.update({ imageLink: responseJson });

    return res.status(200).json(responseJson);
  } catch (error) {
    console.error("Error uploading file:", error);
    res.status(500).send("Internal Server Error");
  }
};

async function uploadFileToStorage(file, batchID, studentid) {
  try {
    const bucket = firebase.storage().bucket();
    const destinationPath = `Student_Images/${batchID}/${studentid + ".png"}`;

    // Uploading file to Firebase Storage
    await bucket.upload(file.path, { destination: destinationPath });

    // Make the file public
    await bucket.file(destinationPath).makePublic();

    // Construct the public URL
    const publicUrl = `https://storage.googleapis.com/${bucket.name}/${destinationPath}`;

    return publicUrl;
  } catch (error) {
    console.error("Error uploading file: ", error);
    throw error;
  }
}
