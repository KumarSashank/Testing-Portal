`use strict`;

const db = require("../db");
const firebase = require("firebase-admin");
// const admin = require("firebase-admin");

const firestore = db;
const { v4: uuidv4 } = require("uuid");

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
      const userCredential = await firebase.auth().createUser({
        email: email,
        password: password,
      });
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
  const { password, username, Skill_council_name, SSC_code } = req.body;

  try {
    // const userCredential = await firebase.auth().createUser({
    //   email: email,
    //   password: password,
    // });
    // const user = userCredential.user;
    // console.log(userCredential);
    await firestore.collection("SSC").doc(SSC_code).set({
      // email: email,
      createdAt: new Date(),
      role: "SSC",
      // username: username,
      // password: password,
      Skill_council_name: Skill_council_name,
      username: username,
      SSC_Code: SSC_code,
      password: password,
      questions_count: 0,
    });

    res.send("User signed up successfully!");
  } catch (error) {
    console.error("Error signing up user:", error);
    res.status(500).send("An error occurred while signing up user.");
  }
};

module.exports.signinUser = async (req, res) => {
  console.log("signin");
  const { email, password } = req.body;
  const { role } = req.params; // Take role parameter from the route

  try {
    // const userCredential = await firebase
    //   .auth()
    //   .signInWithEmailAndPassword(email, password);
    const userCredential = await firebase
      .auth()
      .signInWithEmailAndPassword(email, password);
    const user = userCredential.user;
    const token = await firebase.auth().createCustomToken(user.uid);

    const userData = await firestore.collection("users").doc(user.uid).get();
    const userDataObj = userData.data();

    const userRole = userDataObj.role; // Get the role value from userDataObj

    if (role == userRole) {
      res.send({ token });
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

module.exports.adminSignin = async (req, res) => {
  const { username, password } = req.body;

  try {
    // Query Firestore for the "Admin" document in the "users" collection
    const adminDoc = await firestore.collection("users").doc("Admin").get();

    // Check if the document exists
    if (adminDoc.exists) {
      const adminData = adminDoc.data();
      console.log(adminData);
      console.log(username);
      console.log(password);
      // Extract the fields from the document
      if (adminData.username == username && adminData.password == password) {
        // Create a session ID to represent this user's logged-in status
        const sessionId = uuidv4();
        // Store the session ID in the "sessions" collection
        await firestore.collection("sessions").doc(sessionId).set({
          username: adminData.username,
          createdAt: new Date(),
        });
        // Respond with the session ID
        res.send({ sessionId });
      } else {
        res.status(401).send("Incorrect username or password");
      }
    } else {
      res.status(404).send("Document 'Admin' not found");
    }
  } catch (error) {
    console.error("Error fetching document:", error);
    res.status(500).send("Failed to fetch document");
  }
};
