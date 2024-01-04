const { Router } = require("express");
const { createQPS } = require("../controllers/ssc_controller");
const router = Router();

router.post("/create_qps", createQPS);
// router.post("/signup", signupUser); // Route for user signup
// router.post("/signin/:role", signinUser); // Route for user signin with role parameter
// router.post("/createSSC", createSSC); // Route for creating SSC

router.get("/hello", (req, res) => {
  res.send("Hello, World!");
});

module.exports = router;
