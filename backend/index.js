const express = require("express");
const cors = require("cors");
require("dotenv").config();

const app = express();

// Use cors middleware before defining routes
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const PORT = process.env.PORT || 8000;

// Define your routes after setting up middleware
const route = require("./routes/user_route");
const ssc_route = require("./routes/ssc_route");
app.use(route);
app.use(ssc_route);

app.listen(PORT, () => {
  console.log(`Listening on : ${PORT}`);
});
