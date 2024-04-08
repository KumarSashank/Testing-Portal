const { Router } = require("express");
const {
  createQPS,
  createNOS,
  getSSC,
  getAllSSC,
  getAllQPS,
} = require("../controllers/ssc_controller");
const router = Router();

router.post("/create_qps", createQPS);
router.post("/create_nos", createNOS);
router.get("/getSSC", getSSC);
router.get("/getAllSSC", getAllSSC);
router.get("/getAllQPS", getAllQPS);

// router.post("/signup", signupUser); // Route for user signup
// router.post("/signin/:role", signinUser); // Route for user sign in with role parameter
// router.post("/createSSC", createSSC); // Route for creating SSC

router.get("/hello", (req, res) => {
  res.send("Hello, World!");
});

module.exports = router;
