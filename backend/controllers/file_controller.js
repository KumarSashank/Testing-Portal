`use strict`;

const db = require("../db");
const firebase = require("firebase-admin");
// const admin = require("firebase-admin");

const firestore = db;

module.exports.uploadController = async (req, res) => {
  try {
    // Access uploaded file
    const file = req.file;
    if (!file) {
      return res.status(400).send("No file uploaded.");
    }

    // Process uploaded file, save to database, etc.
    // For example, you can save the file data to the database using dbModule
    // Assuming dbModule has a method saveFile to save file data to the database

    res.send("File uploaded successfully.");
  } catch (error) {
    console.error("Error uploading file:", error);
    res.status(500).send("Internal Server Error");
  }
};
