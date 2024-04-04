const { Router } = require("express");
const {
  studentLogin,
  getQuestionPaper,
  submitTest,
  processResult,
} = require("../controllers/student_controller");
const router = Router();

// router.get("/tata", check_user);
router.post("/studentLogin", studentLogin); // Route for user signup
router.get("/getQuestions", getQuestionPaper);
router.post("/submitTest", submitTest);
router.post("/processResult", processResult);

router.get("/hello", (req, res) => {
  res.send("Hello, World!");
});

module.exports = router;
