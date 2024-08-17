const { Router } = require("express");
const jwt = require("jsonwebtoken");
const router = Router();
const multer = require("multer");
const fs = require("fs");
// const express = require("express");
// const app = express();
const upload = multer({ dest: "/tmp/" });
const {
  uploadController,
  createBatch,
  uploadQuestions,
  generateQP,
  addQP,
  getQuestionsGroupCount,
  getQuestionBank,
  uploadQuestionImage,
  editQuestionQBank,
  editQuestionQP,
} = require("../controllers/file_controller");

// // Middleware to verify token
// const verifyToken = (req, res, next) => {
//   // Get token from the request header
//   const token = req.headers["authorization"];

//   if (!token) {
//     return res
//       .status(403)
//       .json({ error: "A token is required for authentication" });
//   }

//   try {
//     // Verify token
//     const decoded = jwt.verify(token, JWT_SECRET);
//     req.user = decoded;
//   } catch (err) {
//     return res.status(401).json({ error: "Invalid Token" });
//   }
//   return next();
// };

// Apply the middleware to routes that need authentication
// router.use("/api/protected", verifyToken);

router.post("/uploadqp", upload.single("file"), uploadController);
router.post("/createBatch", upload.single("file"), createBatch);
router.post("/uploadQuestions", upload.single("file"), uploadQuestions);
router.post("/generateQP", generateQP);
router.post("/addQP", addQP);
router.post("/getQuestionsGroupCount", getQuestionsGroupCount);
router.post("/getQuestionBank", getQuestionBank);
router.post("/uploadQuestionImage", upload.single("file"), uploadQuestionImage);
router.post("/editQuestionQBank", editQuestionQBank);
router.post("/editQuestionQP", editQuestionQP);

module.exports = router;
