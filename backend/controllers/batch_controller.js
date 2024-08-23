`use strict`;

const db = require("../db");
const firebase = require("firebase-admin");

const firestore = db;

// Getting the total no of questions to display as list in portal
module.exports.getQPlist = async (req, res) => {
  const { QPS } = req.body;
  try {
    const qpRef = firestore.collection("question_papers").doc(QPS);
    //run a firebase query to get all the question papers

    const data = await qpRef.get();

    const question_papers = data.data().question_papers;
    console.log(question_papers);
    return res.status(200).json({ question_papers_count: question_papers });
  } catch (err) {
    console.log(err);
    res.status(500).send("Internal Server Error");
  }
};

// Assigning question paper to batch/students
module.exports.assignQPtoBatch = async (req, res) => {
  const { batchid, QPS, qpNo } = req.body;
  try {
    const batchRef = firestore.collection("Batches").doc(batchid);

    //set the values for batchRef
    batchRef.set({
      QPS: QPS,
      qpNo: qpNo,
    });
    return res.status(200).json("Question paper assigned successfully");
  } catch (err) {
    console.log(err);
    res.status(500).send("Internal Server Error");
  }
};

module.exports.getBatches = async (req, res) => {
  const { SSC, QPS } = req.body;
  console.log("SSC:", SSC, "QPS:", QPS);

  try {
    // Assuming you still need to verify the existence of the QPS document in SSC/QPS
    const qpsRef = firestore
      .collection("SSC")
      .doc(SSC)
      .collection("QPS")
      .doc(QPS);
    const data = await qpsRef.get();

    if (!data.exists) {
      return res.status(404).send("QPS document not found");
    }

    // Query the Batches collection for documents where the QPS field matches the QPS value from the request
    const batchesQuerySnapshot = await db
      .collection("Batches")
      .where("QPS", "==", QPS)
      .get();

    if (batchesQuerySnapshot.empty) {
      return res.status(404).send("No batches found for the given QPS");
    }

    let batchesData = [];
    batchesQuerySnapshot.forEach((doc) => {
      console.log(doc.id, "=>", doc.data());
      // Add the batch ID to the document data
      batchesData.push({ ...doc.data(), batchId: doc.id });
    });

    return res.status(200).json(batchesData);
  } catch (e) {
    console.error("Error fetching batch list:", e);
    res.status(500).send("Internal Server Error");
  }
};

module.exports.getBatchList = async (req, res) => {
  //get the list of batches for specific qps
  const { SSC, QPS } = req.body;
  try {
    const qpsRef = firestore
      .collection("SSC")
      .doc(SSC)
      .collection("QPS")
      .doc(QPS);
    const data = await qpsRef.get();
    const batches = data.data().batches;

    return res.status(200).json(batches);
  } catch (e) {
    console.log(e);
    res.status(500).send("Internal Server Error");
  }
};

module.exports.getStudentCredentials = async (req, res) => {
  const { batchId } = req.body;
  console.log("Batch id : ", batchId);
  try {
    const batchRef = firestore
      .collection("Batches")
      .doc(batchId)
      .collection("students")
      .get();
    const data = await batchRef;

    //get the documents data in object array
    let batchData = [];
    data.forEach((doc) => {
      //push the doc id and DOB from doc data
      batchData.push({
        Name: doc.data().Name,
        ID: doc.id,
        DOB: doc.data().DOB,
      });
    });
    return res.status(200).json(batchData);
  } catch (e) {
    console.log(e);
    res.status(500).send("Internal Server Error");
  }
};
