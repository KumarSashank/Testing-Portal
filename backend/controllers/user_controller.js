// const firebase = require("../db");
// `use strict`;

// const firebase = require("../db");
// const firestore = firebase.firestore();

// module.exports.getAllBuses = async (req, res) => {
//   console.log("checking from console");
//   res.send("checking");
// };

module.exports.check_user = async (req, res) => {
  console.log("checking from console");
  res.send("hola");
};

// `use strict`;

// const firestore = firebase.firestore();

module.exports.getAllBuses = async (req, res) => {
  console.log("checking from console");
  res.send("checking");
};

module.exports.check_user = async (req, res) => {
  console.log("checking from console");
  res.send("hola");
};

module.exports.createUser = async (req, res) => {
  try {
    const { email, password } = req.body;

    const userRecord = await firebase.auth().createUser({
      email,
      password,
    });

    res
      .status(200)
      .json({ message: "User created successfully", user: userRecord });
  } catch (error) {
    console.error("Error creating user:", error);
    res.status(500).json({ error: "Failed to create user" });
  }
};
