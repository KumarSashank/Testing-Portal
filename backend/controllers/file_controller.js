`use strict`;

const db = require("../db");
const firebase = require("firebase-admin");
const xlsx = require("xlsx");
const fs = require("fs");
const util = require("util");
const unlinkAsync = util.promisify(fs.unlink);
// const admin = require("firebase-admin");

const firestore = db;

async function uploadQuestionPapers(file, SSC, QPS) {
  //generating a name for question paper by adding date to QPS
  // const nameWithDate = generateNameWithDate(QPS);

  //extracting data from excel file
  const workbook = readExcelFile(file);
  const data = extractDataFromWorkbook(workbook);

  //Getting QP count from uploading question paper data
  const QPS_paper_count = await uploadQuestionPaperData2(QPS, SSC, data); //uploading data to firestore

  const filename = QPS + "-" + QPS_paper_count;
  const url = await uploadFileToStorage(file, "Question_Papers", filename);
  // const questionPaperRef = await getQuestionPaperReference(SSC, QPS);

  // const questionsCollectionPath = await createQuestionPaperDocument(
  //   QPS,
  //   file.originalname,
  //   url,
  //   SSC,
  //   QPS
  // );

  return {
    url: url,
    filename: file.originalname,
    SSC: SSC,
    QPS: QPS,
  };
}

function generateNameWithDate(QPS) {
  const currentDate = new Date();
  const formattedDate = currentDate.toISOString().split("T")[0];
  return QPS + "-" + formattedDate;
}

function readExcelFile(file) {
  return xlsx.readFile(file.path);
}

function extractDataFromWorkbook(workbook) {
  const sheetName = workbook.SheetNames[0];
  const worksheet = workbook.Sheets[sheetName];
  return xlsx.utils.sheet_to_json(worksheet);
}

async function uploadQuestionPaperData(nameWithDate, SSC, data) {
  try {
    await firestore.collection("question_papers").doc(nameWithDate).set({
      updatedAt: new Date(),
      ssc: SSC,
      qps: nameWithDate,
    });

    //getting ref of question paper
    const qpsRef = firestore.collection("question_papers").doc(nameWithDate);

    //adding questions from data(object array)
    for (const question of data) {
      await qpsRef.collection("questions").add(question);
      console.log("Question uploaded successfully:", question.Question);
    }
  } catch (error) {
    console.error("Error uploading question:", error);
    throw error;
  }
}

//checking gpt
async function uploadQuestionPaperData2(QPS, SSC, data) {
  try {
    // Reference to the document
    const qpsRef = firestore.collection("question_papers").doc(QPS);
    let isNewDocument = false; // Flag to check if the document is newly created

    // Attempt to get the document
    const doc = await qpsRef.get();
    console.log(doc);

    if (!doc.exists) {
      // Document does not exist, so create it and initialize the 'papers' collection if needed
      await qpsRef.set({
        updatedAt: new Date(),
        ssc: SSC,
        qps: QPS,
        question_papers: 0,
      });
      console.log("Document created with initial data:", QPS);
      isNewDocument = true;
    } else {
      console.log(
        "Document exists, navigating to 'papers' subcollection:",
        QPS
      );
    }

    // Reference to the 'papers' subcollection within the document
    const papersRef = qpsRef.collection("papers");

    //get the question_papers value from QPS doc field
    const QPS_paper_doc = await firestore
      .collection("question_papers")
      .doc(QPS)
      .get();

    //Getting the total papers count
    console.log(QPS_paper_doc.data().question_papers);
    const paperNumber = QPS_paper_doc.data().question_papers;
    let newpaper = paperNumber + 1;

    //adding total questions count in field
    await papersRef
      .doc(newpaper.toString())
      .set({ "Total questions": data.length });

    // Get the reference to the questions subcollection
    const questionsRef = papersRef
      .doc(newpaper.toString())
      .collection("questions");

    let itemId = 1; // Start with an ID of 1

    // Add each question to the 'questions' subcollection
    for (const question of data) {
      await questionsRef.doc(itemId.toString()).set(question); // Convert itemId to a string
      console.log("Question uploaded successfully:", question.Question);
      itemId++; // Increment the itemId for the next document
    }

    //updating question paper count
    await qpsRef.update({ question_papers: newpaper });
    QPS_paper_count = newpaper;

    console.log("Count Updated", newpaper);

    return newpaper;
  } catch (error) {
    console.error("Error in operation:", error);
    throw error;
  }
}

async function uploadStudentsData(batchid, data, QPS) {
  try {
    const batchname = batchid + QPS;
    const batchref = await firestore.collection("Batches").doc(batchid);
    var num = 1;
    for (const student of data) {
      studentid = batchname + num++;
      const studentRef = await batchref.collection("students").doc(studentid);
      await studentRef.set(student);
      console.log("Student uploaded successfully:", student.Name);
    }
  } catch (err) {
    console.error("Error uploading student:", error);
    throw error;
  }
}

async function uploadFileToStorage(file, folder, filename) {
  //uploading file to firebase storage
  const bucket = firebase.storage().bucket();
  const destinationPath = folder + "/" + filename;
  await bucket.upload(file.path, { destination: destinationPath });
  const [url] = await bucket.file(destinationPath).getSignedUrl({
    action: "read",
    expires: "03-09-2491",
  });
  return url;
}

// async function getQuestionPaperReference(SSC, QPS) {
//   const sscDoc = await firestore.collection("SSC").doc(SSC).get();
//   return sscDoc.ref.collection("QPS").doc(QPS).ref;
// }

// async function createQuestionPaperDocument(
//   nameWithDate,
//   filename,
//   url,
//   questionPaperRef,
//   SSC,
//   QPS
// ) {
//   try {
//     const sscDoc = await firestore.collection("SSC").doc(SSC).get();
//     const qpsDoc = await sscDoc.ref.collection("QPS").doc(QPS).get();

//     //Need to check the question was already uploaded or not
//     const questionsCollectionPath = `question_papers/${nameWithDate}/questions`;

//     await qpsDoc.ref.collection("questionpapers").doc(nameWithDate).set({
//       createdAt: new Date(),
//       filename: filename,
//       url: url,
//       path: questionsCollectionPath,
//     });

//     // Return the path to the questions collection
//     return questionsCollectionPath;
//   } catch (error) {
//     console.error("Error creating question paper document:", error);
//     throw error;
//   }
// }

module.exports.uploadController = async (req, res) => {
  try {
    const file = req.file;
    //checking whether file is uploaded to server or not
    if (!file) {
      return res.status(400).send("No file uploaded.");
    }

    const { SSC, QPS } = req.body;
    console.log(SSC);
    console.log(QPS);

    //calling uploadquestionpapers function
    const responseJson = await uploadQuestionPapers(file, SSC, QPS);

    // Delete the uploaded file after the total process completed
    await unlinkAsync(file.path);
    console.log("Uploaded file deleted successfully.");

    return res.status(200).json(responseJson);
  } catch (error) {
    console.error("Error uploading file:", error);
    res.status(500).send("Internal Server Error");
  }
};

module.exports.createBatch = async (req, res) => {
  try {
    const file = req.file;
    if (!file) {
      return res.status(400).send("No file uploaded.");
    }

    const { SSC, QPS, qpNo } = req.body;
    //taking remaining data like test center
    const {
      batchName,
      batchSize,
      project,
      trainingCentre,
      state,
      spocContactNo,
      centerAddress,
      assessmentStartDate,
      assessmentEndDate,
      loginRestrictCount,
      modeOfAssessment,
      centerId,
      district,
      spocEmailId,
      tpName,
      startTime,
      endTime,
    } = req.body;

    const batchdata = {
      batchName,
      batchSize,
      project,
      trainingCentre,
      state,
      spocContactNo,
      centerAddress,
      assessmentStartDate,
      assessmentEndDate,
      loginRestrictCount,
      modeOfAssessment,
      centerId,
      district,
      spocEmailId,
      tpName,
      startTime,
      endTime,
      QPS,
      qpNo,
    };

    if (!batchName || !trainingCentre) {
      return res.status(400).send({ message: "Required fields are missing" });
    }
    const workbook = readExcelFile(file);
    const data = extractDataFromWorkbook(workbook);

    const batchdoc = await firestore
      .collection("metaData")
      .doc("batches")
      .get();
    var lastbatchNum = batchdoc.data().LastBatchNum;
    console.log(lastbatchNum);

    var batchid = "B" + ++lastbatchNum;
    console.log(batchid);

    console.log(lastbatchNum);

    const filename = batchid + ".xlsx";

    const url = await uploadFileToStorage(file, "students_list", filename);

    await uploadStudentsData(batchid, data, QPS);

    //adding batch data
    const batchRef = firestore.collection("Batches").doc(batchid);
    //set the values for batchRef
    batchRef.set(batchdata);

    //updating the latest batch count
    await firestore
      .collection("metaData")
      .doc("batches")
      .update({ LastBatchNum: lastbatchNum });

    //adding this batch id in QPS data
    try {
      // Get a reference to the document
      const batchRef = firestore
        .collection("SSC")
        .doc(SSC)
        .collection("QPS")
        .doc(QPS);

      // Update the document
      await batchRef.update({
        batches: firebase.firestore.FieldValue.arrayUnion(batchid),
      });

      // Respond with success
    } catch (error) {
      console.error("Error adding batchID to the array:", error);
    }

    // Delete the uploaded file after the total process completed
    await unlinkAsync(file.path);
    console.log("Uploaded file deleted successfully.");

    return res.status(200).json({ Batch_id: batchid });
  } catch (error) {
    console.error("Error uploading file:", error);
    res.status(500).send("Internal Server Error");
  }
};
