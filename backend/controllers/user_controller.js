`use strict`;

const db = require("../db");
// const db = require("../db");
const firebase = require("firebase");

const firestore = db.firestore();

// module.exports.getAllBuses = async (req, res) => {
//   console.log("checking from console");
//   res.send("checking");
// };

module.exports.check_user = async (req, res) => {
  console.log("checking from console");
  console.log(db);
  res.send("hola");
};

module.exports.signupUser = async (req, res) => {
  console.log("signup");
  const { email, password, role, username, adminId } = req.body; // Add 'username' to the destructuring

  if (adminId == "ZVbVLz0Jwqhmt13yivVHWhILdbN2") {
    try {
      // Create a new user in Firebase Authentication
      const userCredential = await firebase
        .auth()
        .createUserWithEmailAndPassword(email, password);
      const user = userCredential.user;

      // Save the user details to Firestore
      await firestore.collection("users").doc(user.uid).set({
        email: user.email,
        createdAt: new Date(),
        role: role,
        userId: user.uid,
        username: username, // Add 'username' to the document
      });

      res.send("User signed up successfully!");
    } catch (error) {
      console.error("Error signing up user:", error);
      res.status(500).send("An error occurred while signing up user.");
    }
  } else {
    res.send("Only Admin can create user");
  }
};
