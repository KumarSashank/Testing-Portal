`use strict`;

const db = require("../db");
const firebase = require("firebase-admin");
const xlsx = require("xlsx");
// const admin = require("firebase-admin");

const firestore = db;

module.exports.uploadController = async (req, res) => {
  try {
    // Access uploaded file
    const file = req.file;
    if (!file) {
      return res.status(400).send("No file uploaded.");
    }

    // try {
    //   const workbook = xlsx.read(file.buffer, { type: "buffer" });
    //   console.log(workbook);
    //   if (!workbook.SheetNames || workbook.SheetNames.length === 0) {
    //     throw new Error("No sheets found in the workbook.");
    //   }

    //   // Assuming the XLS file contains only one worksheet
    //   const worksheet = workbook.Sheets[workbook.SheetNames[1]];

    //   // Convert the worksheet to a JSON object
    //   const jsonData = xlsx.utils.sheet_to_json(worksheet);

    //   // Process the JSON data
    //   console.log(jsonData);
    // } catch (error) {
    //   console.error("Error uploading file:", error);
    //   res.status(500).send("Internal Server Error");
    // }

    const { SSC, QPS } = req.body;
    console.log(SSC);
    console.log(QPS);

    const bucket = firebase.storage().bucket();
    const destinationPath = "Question_Papers/" + file.originalname; // Set your destination path here
    await bucket.upload(file.path, { destination: destinationPath });

    // Get the download URL for the uploaded file
    const [url] = await bucket.file(destinationPath).getSignedUrl({
      action: "read",
      expires: "03-09-2491", // Adjust the expiration date as needed
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

    // Construct JSON response
    const responseJson = {
      url: url,
      filename: file.originalname,
      SSC: SSC,
      QPS: QPS,
    };

    // Return the URL as the response
    return res.status(200).send(responseJson);

    // async function uploadFileToStorage(localFilePath, destinationPath) {
    //   try {
    //     const bucket = firebase.storage().bucket();
    //     await bucket.upload(localFilePath, {
    //       destination: destinationPath,
    //     });
    //     console.log("File uploaded successfully!");
    //   } catch (error) {
    //     console.error("Error uploading file:", error);
    //   }
    // }

    // const localFilePath =
    //   "/Users/kumarsashank/Github/Testing-Portal/backend/controllers/data.csv";
    // const destinationPath = "Question_Papers/data.csv";

    // uploadFileToStorage(localFilePath, destinationPath);

    // Process uploaded file, save to database, etc.
    // try {
    //   // Upload file to Firebase Storage
    //   const bucket = firebase.storage().bucket();
    //   const fileUpload = bucket.file(file.originalname);
    //   const fileStream = fileUpload.createWriteStream({
    //     metadata: {
    //       contentType: file.mimetype,
    //     },
    //   });

    //   fileStream.on("error", (error) => {
    //     console.error("Error uploading file to Firebase Storage:", error);
    //     res.status(500).send("Error uploading file to Firebase Storage");
    //   });

    //   fileStream.on("finish", async () => {
    //     try {
    //       // Get the uploaded file link
    //       const [url] = await fileUpload.getSignedUrl({
    //         action: "read",
    //         expires: "01-01-3000",
    //       });

    //       // Get the current date
    //       const currentDate = new Date();

    //       // Format the date as needed (e.g., YYYY-MM-DD)
    //       const formattedDate = currentDate.toISOString().split("T")[0]; // Get date in YYYY-MM-DD format

    //       // Combine the name with the formatted date
    //       const nameWithDate = QPS + "-" + formattedDate;

    //       // Store the link in a Firestore collection
    //       const sscDoc = await firestore.collection("SSC").doc(SSC).get();
    //       const qpsDoc = await sscDoc.ref.collection("QPS").doc(QPS).get();

    //       //Need to check the question was already uploaded or not

    //       await qpsDoc.ref.collection("questionpapers").doc(nameWithDate).set({
    //         createdAt: new Date(),
    //         filename: file.originalname,
    //         url: url,
    //       });

    //       res.send("File uploaded successfully to Firebase Storage.");
    //     } catch (error) {
    //       console.error("Error storing file link in Firestore:", error);
    //       res.status(500).send("Error storing file link in Firestore");
    //     }
    //   });

    //   fileStream.end(file.buffer);

    //   //get the uploaded file link
    // } catch (error) {
    //   console.error("Error uploading file:", error);
    //   res.status(500).send("Internal Server Error");
    // }
    // For example, you can save the file data to the database using dbModule
    // Assuming dbModule has a method saveFile to save file data to the database

    // res.send("File uploaded successfully.");
  } catch (error) {
    console.error("Error uploading file:", error);
    res.status(500).send("Internal Server Error");
  }
};
