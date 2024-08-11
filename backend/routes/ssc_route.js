const { Router } = require("express");
const {
  createQPS,
  createNOS,
  getSSC,
  getAllSSC,
  getAllQPS,
  getNOSList,
  assignNOStoQPS,
  assignedNOS,
  NOSPage,
  unassignNOStoQPS,
  SSCpage,
  editSSClogins,
} = require("../controllers/ssc_controller");
const router = Router();

router.post("/create_qps", createQPS);
router.post("/create_nos", createNOS);
router.post("/getSSC", getSSC);
router.get("/getAllSSC", getAllSSC);
router.post("/getAllQPS", getAllQPS);
router.post("/getNOSList", getNOSList);
router.post("/assignNOStoQPS", assignNOStoQPS);
router.post("/assignedNOS", assignedNOS);
router.post("/unassignNOStoQPS", unassignNOStoQPS);
router.post("/NOSPage", NOSPage);
router.post("/SSCpage", SSCpage);
router.post("/editSSClogins", editSSClogins);

// router.post("/signup", signupUser); // Route for user signup
// router.post("/signin/:role", signinUser); // Route for user sign in with role parameter
// router.post("/createSSC", createSSC); // Route for creating SSC

router.get("/hello", (req, res) => {
  res.send("Hello, World!");
});

module.exports = router;
