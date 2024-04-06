const { Router } = require("express");
const {
  getQPlist,
  assignQPtoBatch,
  getBatchList,
} = require("../controllers/batch_controller");
const router = Router();

// router.post("/create_qps", createQPS);
// router.post("/create_nos", createNOS);
router.get("/getQPlist", getQPlist);
router.post("/assignQPtoBatch", assignQPtoBatch);
router.get("/getBatchList", getBatchList);

// router.post("/signup", signupUser); // Route for user signup
// router.post("/signin/:role", signinUser); // Route for user sign in with role parameter
// router.post("/createSSC", createSSC); // Route for creating SSC

router.get("/hello", (req, res) => {
  res.send("Hello, World!");
});

module.exports = router;
