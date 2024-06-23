const { Router } = require("express");
const router = Router();

const {
  getStates,
  getDistricts,
  addTrainingCentre,
  getAllTrainingCentres,
  updateTrainingCentre,
} = require("../controllers/training_centre_controller");

router.post("/getStates", getStates);
router.post("/getDistricts", getDistricts);
router.post("/addTrainingCentre", addTrainingCentre);
router.post("/getAllTrainingCentres", getAllTrainingCentres);
router.post("/updateTrainingCentre", updateTrainingCentre);

module.exports = router;
