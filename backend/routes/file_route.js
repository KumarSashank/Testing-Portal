const { Router } = require("express");
const router = Router();
const multer = require("multer");
const fs = require("fs");
// const app = express();
const upload = multer({ dest: "/tmp/" });
const {
  uploadController,
  uploadstud,
} = require("../controllers/file_controller");

router.post("/uploadqp", upload.single("file"), uploadController);
router.post("/uploadStudents", upload.single("file"), uploadstud);

module.exports = router;
