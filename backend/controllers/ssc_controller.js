`use strict`;

const db = require("../db");
const firebase = require("firebase");

const firestore = db.firestore();

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
