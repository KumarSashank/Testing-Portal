`use strict`;

const db = require("../db");
const firebase = require("firebase-admin");

const firestore = db;

module.exports.createQPS = async (req, res) => {
  console.log("create QPS");
  const { SSC_code, QPS_name, QPS_id } = req.body;

  try {
    // Find the document named with SSC_code
    const sscDoc = await firestore.collection("SSC").doc(SSC_code).get();

    console.log(sscDoc);

    // Add a subcollection QPS
    await sscDoc.ref.collection("QPS").doc(QPS_id).set({
      createdAt: new Date(),
      QPS_name: QPS_name,
      QPS_id: QPS_id,
    });

    res.send("QPS created successfully!");
  } catch (error) {
    console.error("Error creating QPS:", error);
    res.status(500).send("An error occurred while creating QPS.");
  }
};

module.exports.createNOS = async (req, res) => {
  console.log("create NOS");
  const { SSC_code, NOS_ID, NOS_name } = req.body;

  try {
    // Find the document named with SSC_code
    const sscDoc = await firestore.collection("SSC").doc(SSC_code).get();
    // const qpsDoc = await sscDoc.ref.collection("QPS").doc(QPS_name).get();

    console.log(sscDoc);

    // Add a subcollection NOS
    await sscDoc.ref.collection("NOS").doc(NOS_ID).set({
      createdAt: new Date(),
      NOS_name: NOS_name,
      NOS_ID: NOS_ID,
    });

    res.send("NOS created successfully!");
  } catch (error) {
    console.error("Error creating NOS:", error);
    res.status(500).send("An error occurred while creating NOS.");
  }
};

module.exports.getNOSList = async (req, res) => {
  const { SSC } = req.body;
  console.log("SSC: ", SSC);
  try {
    const sscDoc = await firestore.collection("SSC").doc(SSC).get();
    const nosDocs = await sscDoc.ref.collection("NOS").get();
    let nosArray = [];

    nosDocs.forEach((doc) => {
      const docData = doc.data();
      const nosObject = {
        code: doc.id,
        name: docData.NOS_name,
      };
      nosArray.push(nosObject);
    });

    res.status(200).json(nosArray); // Sending the array of objects as JSON
  } catch (error) {
    console.error("Error getting NOS:", error);
    res.status(500).send("An error occurred while getting NOS.");
  }
};

module.exports.assignedNOS = async (req, res) => {
  const { SSC, QPS } = req.body;
  try {
    const sscref = await firestore
      .collection("SSC")
      .doc(SSC)
      .collection("QPS")
      .doc(QPS)
      .get();

    const nosArray = sscref.data().NOS_array;

    res.status(200).json(nosArray); // Sending the array of objects as JSON
  } catch (error) {
    console.error("Error getting NOS:", error);
    res.status(500).send("An error occurred while getting NOS.");
  }
};

module.exports.NOSPage = async (req, res) => {
  //send the json response which contains the data of assigned nos from total nos list and remaining nos in another field
  const { SSC, QPS } = req.body;
  console.log("SSC : ", SSC);
  console.log("QPS : ", QPS);
  try {
    const sscref = await firestore
      .collection("SSC")
      .doc(SSC)
      .collection("QPS")
      .doc(QPS)
      .get();

    const nosArray = sscref.data().NOS_array;
    console.log("NOS_Array : ", nosArray);

    const sscDoc = await firestore.collection("SSC").doc(SSC).get();
    const nosDocs = await sscDoc.ref.collection("NOS").get();
    let nosList = [];

    nosDocs.forEach((doc) => {
      const docData = doc.data();
      const nosObject = {
        code: doc.id,
        name: docData.NOS_name,
      };
      nosList.push(nosObject);
    });
    console.log("NOS LIST: ", nosList);
    //assigned NOS
    const assignedNos = nosList.filter((nos) => {
      return nosArray.includes(nos.code);
    });
    console.log("ASSIGNED NOS: ", assignedNos);
    //unassigned NOS
    const UnAssignedNOSList = nosList.filter((nos) => {
      return !nosArray.includes(nos.code);
    });
    console.log("UnAssigned NOS : ", UnAssignedNOSList);

    const response = {
      AssignedNOS: assignedNos,
      UnAssignedNOSList: UnAssignedNOSList,
    };
    res.status(200).json(response); // Sending the array of objects as JSON
  } catch (error) {
    console.error("Error getting NOS:", error);
    res.status(500).send("An error occurred while getting NOS.");
  }
};
module.exports.assignNOStoQPS = async (req, res) => {
  const { SSC, QPS, NOS } = req.body;
  console.log("SSC: ", SSC);
  console.log("QPS: ", QPS);
  console.log("NOS: ", NOS);

  try {
    const sscref = await firestore
      .collection("SSC")
      .doc(SSC)
      .collection("QPS")
      .doc(QPS)
      .get();

    //by for loop, updated one by one from NOS_array
    for (let i = 0; i < NOS.length; i++) {
      await sscref.ref.update({
        //add NOS array to the doc(QPS) as field NOS_array
        NOS_array: firebase.firestore.FieldValue.arrayUnion(NOS[i]),
      });
      console.log(NOS[i], "Added");
    }
    console.log("NOS list added to QPS");
    res.status(200).json("NOS added to QPS");
  } catch (e) {
    console.log("Error assigning NOS to QPS", e);
    res.status(500).send("An error occurred while assigning NOS to QPS.");
  }
};

module.exports.unassignNOStoQPS = async (req, res) => {
  const { SSC, QPS, NOS } = req.body;
  console.log("SSC: ", SSC);
  console.log("QPS: ", QPS);
  console.log("NOS: ", NOS);

  try {
    const sscref = await firestore
      .collection("SSC")
      .doc(SSC)
      .collection("QPS")
      .doc(QPS)
      .get();

    //by for loop, updated one by one from NOS_array
    for (let i = 0; i < NOS.length; i++) {
      await sscref.ref.update({
        //remove NOS array to the doc(QPS) as field NOS_array
        NOS_array: firebase.firestore.FieldValue.arrayRemove(NOS[i]),
      });
      console.log(NOS[i], "Removed");
    }
    console.log("NOS list removed from QPS");
    res.status(200).json("Selected NOS's removed from QPS");
  } catch (e) {
    console.log("Error unassigning NOS to QPS", e);
    res.status(500).send("An error occurred while unassigning NOS to QPS.");
  }
};

module.exports.getSSC = async (req, res) => {
  const { SSC_code } = req.body;
  console.log("SSC_code: ", SSC_code);
  try {
    const sscDoc = await firestore.collection("SSC").doc(SSC_code).get();
    res.send(sscDoc.data());
  } catch (error) {
    console.error("Error getting SSC:", error);
    res.status(500).send("An error occurred while getting SSC.");
  }
};

module.exports.getAllSSC = async (req, res) => {
  try {
    const sscDocs = await firestore.collection("SSC").get();
    let sscArray = [];

    sscDocs.forEach((doc) => {
      const docData = doc.data();
      const sscObject = {
        code: doc.id,
        name: docData.Skill_council_name,
      };
      sscArray.push(sscObject);
    });

    res.status(200).json(sscArray); // Sending the array of objects as JSON
  } catch (error) {
    console.error("Error getting SSC:", error);
    res.status(500).send("An error occurred while getting SSC.");
  }
};

module.exports.getAllQPS = async (req, res) => {
  try {
    const { SSC } = req.body; // SSC is assumed to be the parent document ID

    // Reference to the subcollection
    const qpsCollectionRef = firestore
      .collection("SSC")
      .doc(SSC)
      .collection("QPS");

    // Get a snapshot of the QPS subcollection
    const snapshot = await qpsCollectionRef.get();

    if (snapshot.empty) {
      console.log("No matching documents.");
      return res.status(404).send("No QPS found");
    }

    let documentIds = [];
    snapshot.forEach((doc) => {
      const qps_obj = {
        code: doc.id,
        name: doc.data().QPS_name,
      };
      documentIds.push(qps_obj); // Collect each document's ID
    });

    console.log(documentIds); // Log the collected document IDs
    return res.status(200).json(documentIds); // Send the document IDs in the response
  } catch (error) {
    console.error("Error getting documents", error);
    return res.status(500).send(error.toString());
  }
};

module.exports.SSCpage = async (req, res) => {
  console.log("initiated");
  try {
    const sscDocs = await firestore.collection("SSC").get();
    let sscArray = [];

    sscDocs.forEach((doc) => {
      const docData = doc.data();
      const sscObject = {
        code: doc.id,
        name: docData.Skill_council_name,
        username: docData.username,
        password: docData.password,
      };
      sscArray.push(sscObject);
    });

    res.status(200).json(sscArray); // Sending the array of objects as JSON
  } catch (e) {
    console.log("Error getting SSC:", e);
    res.status(500).send("An error occurred while getting SSC.");
  }
};

module.exports.editSSClogins = async (req, res) => {
  const { SSC_code, username, password } = req.body;
  console.log("SSC_code: ", SSC_code);
  console.log("username: ", username);
  console.log("password : ", password);
  try {
    const sscDoc = await firestore.collection("SSC").doc(SSC_code).update({
      username: username,
      password: password,
    });
    res.send("SSC logins updated successfully!");
  } catch (error) {
    console.error("Error updating SSC logins:", error);
    res.status(500).send("An error occurred while updating SSC logins.");
  }
};

module.exports.dashboard = async (req, res) => {
  try {
    const SSC = await firestore.collection("SSC").get();
    //total count of the documents in SSC
    const totalSSC = SSC.size;
    console.log("SSC Count : ", totalSSC);
    //total count of Batches
    const batch = await firestore.collection("metaData").doc("batches").get();
    const totalBatches = batch.data().LastBatchNum;

    console.log("Batch Count : ", totalBatches);

    //write a query for collection group to get students count
    const studentcollectionRef = db.collectionGroup("students");
    const studentsnapshot = await studentcollectionRef.count().get();
    const studentCount = studentsnapshot.data().count;
    console.log("Student Count : ", studentCount);

    //send the response
    res.status(200).json({ totalSSC, totalBatches, studentCount });
  } catch (e) {
    console.log("Error in dashboard", e);
    res.status(500).send("An error occurred while getting dashboard data.");
  }
};
