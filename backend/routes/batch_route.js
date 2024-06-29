const { Router } = require("express");
const {
  getQPlist,
  assignQPtoBatch,
  getBatchList,
  getBatches,
} = require("../controllers/batch_controller");
const router = Router();

// router.post("/create_qps", createQPS);
// router.post("/create_nos", createNOS);
router.post("/getQPlist", getQPlist);
router.post("/assignQPtoBatch", assignQPtoBatch);
router.post("/getBatchList", getBatchList);
router.post("/getBatches", getBatches);

// router.post("/signup", signupUser); // Route for user signup
// router.post("/signin/:role", signinUser); // Route for user sign in with role parameter
// router.post("/createSSC", createSSC); // Route for creating SSC

router.get("/hello", (req, res) => {
  res.send("Hello, World!");
});

module.exports = router;
