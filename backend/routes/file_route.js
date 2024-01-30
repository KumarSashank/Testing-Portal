const { Router } = require("express");
const router = Router();
const multer = require("multer");
const fs = require("fs");
// const app = express();
const upload = multer({ dest: "uploads/" });
const { uploadController } = require("../controllers/file_controller");

router.post("/upload", upload.single("csvFile"), uploadController);

module.exports = router;
