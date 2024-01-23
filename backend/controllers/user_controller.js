`use strict`;

const db = require("../db");
const firebase = require("firebase");

const firestore = db.firestore();

module.exports.check_user = async (req, res) => {
  console.log("checking from console");
  console.log(db);
  res.send("hola");
};

module.exports.signupUser = async (req, res) => {
  console.log("signup");
  const { email, password, role, username, adminId } = req.body;

  if (adminId == "ZVbVLz0Jwqhmt13yivVHWhILdbN2") {
    try {
      const userCredential = await firebase
        .auth()
        .createUserWithEmailAndPassword(email, password);
      const user = userCredential.user;

      await firestore.collection("users").doc(user.uid).set({
        email: user.email,
        createdAt: new Date(),
        role: role,
        userId: user.uid,
        username: username,
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

module.exports.createSSC = async (req, res) => {
  console.log("create SSC");
  const { email, password, username, adminId, Skill_council_name, SSC_code } =
    req.body;

  if (adminId == "ZVbVLz0Jwqhmt13yivVHWhILdbN2") {
    try {
      const userCredential = await firebase
        .auth()
        .createUserWithEmailAndPassword(email, password);
      const user = userCredential.user;

      await firestore.collection("SSC").doc(SSC_code).set({
        email: user.email,
        createdAt: new Date(),
        role: "SSC",
        userId: user.uid,
        username: username,
        password: password,
        Skill_council_name: Skill_council_name,
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

module.exports.signinUser = async (req, res) => {
  console.log("signin");
  const { email, password } = req.body;
  const { role } = req.params; // Take role parameter from the route

  try {
    const userCredential = await firebase
      .auth()
      .signInWithEmailAndPassword(email, password);
    const user = userCredential.user;

    const userData = await firestore.collection("users").doc(user.uid).get();
    const userDataObj = userData.data();

    const userRole = userDataObj.role; // Get the role value from userDataObj

    if (role == userRole) {
      res.send("User signed in");
    } else {
      res.send(
        `You are trying to sign in with role ${role}, but your role is ${userRole}`
      );
    }
  } catch (error) {
    console.error("Error signing in user:", error);
    res.status(500).send("An error occurred while signing in user.");
  }
};

module.exports.getsectors = async (req, res) => {
  console.log("sectors json list");

  try {
    const sscSnapshot = await firestore.collection("SSC").get();
    const sscNames = sscSnapshot.docs.map((doc) => doc.id);

    const sectors = [];
    const qps = [];

    for (const sscName of sscNames) {
      const qpsSnapshot = await firestore
        .collection("SSC")
        .doc(sscName)
        .collection("QPS")
        .get();
      const qpsNames = qpsSnapshot.docs.map((doc) => doc.id);

      for (const qpsName of qpsNames) {
        const nosSnapshot = await firestore
          .collection("SSC")
          .doc(sscName)
          .collection("QPS")
          .doc(qpsName)
          .collection("NOS")
          .get();
        const nosNames = nosSnapshot.docs.map((doc) => doc.id);
        console.log(nosNames);

        qps.push({
          QPS: qpsName,
          NOS: nosNames,
        });
      }
      sectors.push({
        SSC: sscName,
        QPS: qps,
      });
    }

    res.json({ sectors });
  } catch (error) {
    console.error(
      "Error retrieving SSC collection names and QPS names:",
      error
    );
    res
      .status(500)
      .send(
        "An error occurred while retrieving SSC collection names and QPS names."
      );
  }
};
