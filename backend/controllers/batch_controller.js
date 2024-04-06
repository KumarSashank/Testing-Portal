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
    return res.status(200).json(question_papers);
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
