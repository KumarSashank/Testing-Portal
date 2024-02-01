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

      fileStream.on("finish", async () => {
        try {
          // Get the uploaded file link
          const [url] = await fileUpload.getSignedUrl({
            action: "read",
            expires: "01-01-3000",
          });

          // Get the current date
          const currentDate = new Date();

          // Format the date as needed (e.g., YYYY-MM-DD)
          const formattedDate = currentDate.toISOString().split("T")[0]; // Get date in YYYY-MM-DD format

          // Combine the name with the formatted date
          const nameWithDate = QPS + "-" + formattedDate;

          // Store the link in a Firestore collection
          const sscDoc = await firestore.collection("SSC").doc(SSC).get();
          const qpsDoc = await sscDoc.ref.collection("QPS").doc(QPS).get();

          //Need to check the question was already uploaded or not

          await qpsDoc.ref.collection("questionpapers").doc(nameWithDate).set({
            createdAt: new Date(),
            filename: file.originalname,
            url: url,
          });

          res.send("File uploaded successfully to Firebase Storage.");
        } catch (error) {
          console.error("Error storing file link in Firestore:", error);
          res.status(500).send("Error storing file link in Firestore");
        }
      });

      fileStream.end(file.buffer);

      //get the uploaded file link
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
