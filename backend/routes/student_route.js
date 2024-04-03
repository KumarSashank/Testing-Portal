const { Router } = require("express");
const {
  studentLogin,
  getQuestionPaper,
} = require("../controllers/student_controller");
const router = Router();

// router.get("/tata", check_user);
router.post("/studentLogin", studentLogin); // Route for user signup
router.get("/getQuestions", getQuestionPaper);

router.get("/hello", (req, res) => {
  res.send("Hello, World!");
});

module.exports = router;
