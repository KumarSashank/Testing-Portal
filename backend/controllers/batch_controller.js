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

module.exports.getBatchList = async (req, res) => {
  const { SSC, QPS } = req.body;
  console.log("SSC:", SSC, "QPS:", QPS);

  try {
    const qpsRef = firestore
      .collection("SSC")
      .doc(SSC)
      .collection("QPS")
      .doc(QPS);
    const data = await qpsRef.get();

    if (!data.exists) {
      return res.status(404).send("QPS document not found");
    }

    const batches = data.data().batches;
    // const batches = ["B10", "B14"];

    // Fetch the data for every batch listed in the batches array
    let batchesData = [];
    for (const batchId of batches) {
      console.log(batchId);
      console.log(typeof batchId);
      const batchRef = await db.collection("Batches").doc(batchId);
      const batchDoc = await batchRef.get();
      console.log(batchDoc.data());
      if (batchDoc.exists) {
        batchesData.push(batchDoc.data());
      } else {
        console.log(`Batch ID ${batchId} not found`);
      }
    }
    return res.status(200).json(batchesData);
  } catch (e) {
    console.error("Error fetching batch list:", e);
    res.status(500).send("Internal Server Error");
  }
};
