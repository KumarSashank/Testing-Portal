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
  const nameWithDate = generateNameWithDate(QPS);
  const workbook = readExcelFile(file);
  const data = extractDataFromWorkbook(workbook);

  await uploadQuestionPaperData(nameWithDate, SSC, data);

  const url = await uploadFileToStorage(file);
  const questionPaperRef = await getQuestionPaperReference(SSC, QPS);

  const questionsCollectionPath = await createQuestionPaperDocument(
    nameWithDate,
    file.originalname,
    url,
    questionPaperRef,
    SSC,
    QPS
  );

  return {
    url: url,
    filename: file.originalname,
    SSC: SSC,
    QPS: QPS,
    path: questionsCollectionPath,
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

    const qpsRef = firestore.collection("question_papers").doc(nameWithDate);
    for (const question of data) {
      await qpsRef.collection("questions").add(question);
      console.log("Question uploaded successfully:", question.Question);
    }
  } catch (error) {
    console.error("Error uploading question:", error);
    throw error;
  }
}

async function uploadFileToStorage(file) {
  const bucket = firebase.storage().bucket();
  const destinationPath = "Question_Papers/" + file.originalname;
  await bucket.upload(file.path, { destination: destinationPath });
  const [url] = await bucket.file(destinationPath).getSignedUrl({
    action: "read",
    expires: "03-09-2491",
  });
  return url;
}

async function getQuestionPaperReference(SSC, QPS) {
  const sscDoc = await firestore.collection("SSC").doc(SSC).get();
  return sscDoc.ref.collection("QPS").doc(QPS).ref;
}

async function createQuestionPaperDocument(
  nameWithDate,
  filename,
  url,
  questionPaperRef,
  SSC,
  QPS
) {
  try {
    const sscDoc = await firestore.collection("SSC").doc(SSC).get();
    const qpsDoc = await sscDoc.ref.collection("QPS").doc(QPS).get();

    //Need to check the question was already uploaded or not
    const questionsCollectionPath = `question_papers/${nameWithDate}/questions`;

    await qpsDoc.ref.collection("questionpapers").doc(nameWithDate).set({
      createdAt: new Date(),
      filename: filename,
      url: url,
      path: questionsCollectionPath,
    });

    // Return the path to the questions collection
    return questionsCollectionPath;
  } catch (error) {
    console.error("Error creating question paper document:", error);
    throw error;
  }
}

module.exports.uploadController = async (req, res) => {
  try {
    const file = req.file;
    if (!file) {
      return res.status(400).send("No file uploaded.");
    }

    const { SSC, QPS } = req.body;
    console.log(SSC);
    console.log(QPS);

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
