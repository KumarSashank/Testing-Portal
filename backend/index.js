const express = require("express");
const cors = require("cors");
const multer = require("multer");
const fs = require("fs");
const corsConfig = {
  origin: "*",
  credentials: true,
  methods: ["GET", "POST", "PUT", "DELETE", "OPTIONS"],
};

require("dotenv").config();

const app = express();
const upload = multer({ dest: "/tmp/" });

// app.post("/upload", upload.single("csvFile"), (req, res) => {
//   // Access uploaded file
//   const file = req.file;
//   if (!file) {
//     return res.status(400).send("No file uploaded.");
//   }

//   res.send("file uploaded");
// });

// Use cors middleware before defining routes
app.use(cors(corsConfig));
app.options("", cors(corsConfig));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const PORT = 8000;

// Define your routes after setting up middleware
const route = require("./routes/user_route");
const ssc_route = require("./routes/ssc_route");
const file_route = require("./routes/file_route");
const batch_route = require("./routes/batch_route");
const student_route = require("./routes/student_route");
const training_centre_route = require("./routes/training_centre");

app.use(student_route);
app.use(batch_route);
app.use(file_route);
app.use(route);
app.use(ssc_route);
app.use(training_centre_route);

app.listen(PORT, () => {
  console.log(`Listening on : ${PORT}`);
});
