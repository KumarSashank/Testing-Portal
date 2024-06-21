const { Router } = require("express");
const router = Router();

const {
  getStates,
  getDistrcits,
  addTrainingCentre,
  getAllTrainingCentres,
  updateTrainingCentre,
} = require("../controllers/training_centre_controller");

router.post("/getStates", getStates);
router.post("/getDistrcits", getDistrcits);
router.post("/addTrainingCentre", addTrainingCentre);
router.post("/getAllTrainingCentres", getAllTrainingCentres);
router.post("/updateTrainingCentre", updateTrainingCentre);

module.exports = router;
