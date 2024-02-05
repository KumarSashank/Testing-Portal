`use strict`;

const db = require("../db");
const firebase = require("firebase-admin");

const firestore = db;

module.exports.createQPS = async (req, res) => {
  console.log("create QPS");
  const { SSC_code, adminId, QPS_name } = req.body;

  if (adminId == "ZVbVLz0Jwqhmt13yivVHWhILdbN2") {
    try {
      // Find the document named with SSC_code
      const sscDoc = await firestore.collection("SSC").doc(SSC_code).get();

      console.log(sscDoc);

      // Add a subcollection QPS
      await sscDoc.ref.collection("QPS").doc(QPS_name).set({
        createdAt: new Date(),
        QPS_name: QPS_name,
      });

      res.send("QPS created successfully!");
    } catch (error) {
      console.error("Error creating QPS:", error);
      res.status(500).send("An error occurred while creating QPS.");
    }
  } else {
    res.send("Only Admin can create QPS");
  }
};

module.exports.createNOS = async (req, res) => {
  console.log("create NOS");
  const { SSC_code, adminId, QPS_name, NOS_name } = req.body;

  if (adminId == "ZVbVLz0Jwqhmt13yivVHWhILdbN2") {
    try {
      // Find the document named with SSC_code
      const sscDoc = await firestore.collection("SSC").doc(SSC_code).get();
      const qpsDoc = await sscDoc.ref.collection("QPS").doc(QPS_name).get();

      console.log(qpsDoc);

      // Add a subcollection NOS
      await qpsDoc.ref.collection("NOS").doc(NOS_name).set({
        createdAt: new Date(),
        NOS_name: NOS_name,
      });

      res.send("NOS created successfully!");
    } catch (error) {
      console.error("Error creating NOS:", error);
      res.status(500).send("An error occurred while creating NOS.");
    }
  } else {
    res.send("Only Admin can create NOS");
  }
};

module.exports.getSSC = async (req, res) => {
  const { SSC_code } = req.body;
  try {
    const sscDoc = await firestore.collection("SSC").doc(SSC_code).get();
    res.send(sscDoc.data());
  } catch (error) {
    console.error("Error getting SSC:", error);
    res.status(500).send("An error occurred while getting SSC.");
  }
};

module.exports.getAllSSC = async (req, res) => {
  try {
    const sscDoc = await firestore.collection("SSC").get();
    let ssc = [];
    sscDoc.forEach((doc) => {
      ssc.push(doc.data().Skill_council_name);
    });
    res.send(ssc);
  } catch (error) {
    console.error("Error getting SSC:", error);
    res.status(500).send("An error occurred while getting SSC.");
  }
};
