const { Router } = require("express");
const router = Router();
const multer = require("multer");
const fs = require("fs");
// const app = express();
const upload = multer({ dest: "/tmp/" });
const {
  uploadController,
  createBatch,
  uploadQuestions,
} = require("../controllers/file_controller");

router.post("/uploadqp", upload.single("file"), uploadController);
router.post("/createBatch", upload.single("file"), createBatch);
router.post("/uploadQuestions", upload.single("file"), uploadQuestions);

module.exports = router;
