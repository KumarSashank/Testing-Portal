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

      // Here you would continue with your authentication logic
      // For example, checking the password against what's stored in Firestore
      // This is commented out as it depends on your specific Firestore structure

      // Assuming authentication is successful
      return res
        .status(200)
        .json({
          message: "Login successful",
          batchID: batchID,
          qps: qps,
          studentNumber: studentNumber,
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
