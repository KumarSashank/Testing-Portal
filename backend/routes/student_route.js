const { Router } = require("express");
const {
  studentLogin,
  getQuestionPaper,
  submitTest,
  processResult,
  processResult2,
} = require("../controllers/student_controller");
const router = Router();

// router.get("/tata", check_user);
router.post("/studentLogin", studentLogin); // Route for user signup
router.post("/getQuestions", getQuestionPaper);
router.post("/submitTest", submitTest);
router.post("/processResult", processResult);
router.post("/processResult2", processResult2);

router.get("/hello", (req, res) => {
  res.send("Hello, World!");
});

module.exports = router;
