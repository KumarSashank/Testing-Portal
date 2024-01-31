`use strict`;

const db = require("../db");
const firebase = require("firebase-admin");
// const admin = require("firebase-admin");

const firestore = db;

module.exports.uploadController = async (req, res) => {
  try {
    // Access uploaded file
    const file = req.file;
    // if (!file) {
    //   return res.status(400).send("No file uploaded.");
    // }
    const { SSC, QPS } = req.body;
    console.log(SSC);
    console.log(QPS);
    // Process uploaded file, save to database, etc.
    try {
      // Upload file to Firebase Storage
      const bucket = firebase.storage().bucket();
      const fileUpload = bucket.file(file.originalname);
      const fileStream = fileUpload.createWriteStream({
        metadata: {
          contentType: file.mimetype,
        },
      });

      fileStream.on("error", (error) => {
        console.error("Error uploading file to Firebase Storage:", error);
        res.status(500).send("Error uploading file to Firebase Storage");
      });

      fileStream.on("finish", () => {
        res.send("File uploaded successfully to Firebase Storage.");
      });

      fileStream.end(file.buffer);
    } catch (error) {
      console.error("Error uploading file:", error);
      res.status(500).send("Internal Server Error");
    }
    // For example, you can save the file data to the database using dbModule
    // Assuming dbModule has a method saveFile to save file data to the database

    // res.send("File uploaded successfully.");
  } catch (error) {
    console.error("Error uploading file:", error);
    res.status(500).send("Internal Server Error");
  }
};
