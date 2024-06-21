const { Router } = require("express");
const multer = require("multer");
const upload = multer({ dest: "/tmp/" });
const {
  studentLogin,
  getQuestionPaper,
  submitTest,
  processResult,
  processResult2,
  getResults,
  studentImgUpload,
} = require("../controllers/student_controller");
const router = Router();

// router.get("/tata", check_user);
router.post("/studentLogin", studentLogin); // Route for user signup
router.post("/getQuestions", getQuestionPaper);
router.post("/submitTest", submitTest);
router.post("/processResult", processResult);
router.post("/processResult2", processResult2);
router.post("/getResults", getResults);
router.post("/studentImgUpload", upload.single("file"), studentImgUpload);

router.get("/hello", (req, res) => {
  res.send("Hello, World!");
});

module.exports = router;
