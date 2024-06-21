`use strict`;

const db = require("../db");
const firebase = require("firebase-admin");
const firestore = db;

module.exports.addTrainingCentre = async (req, res) => {
  try {
    const {
      centre_id,
      state,
      District,
      Parliamentary_Constituency,
      Centre_Address,
      Training_Partner,
      Status,
      Training_Center_Name,
      TP_SPOC_Name,
      TP_SPOC_Email,
      TP_SPOC_Contact_Number,
    } = req.body;

    if (!centre_id) {
      return res.status(400).send({ message: "centre_id is required" });
    }

    const data = {
      centre_id,
      state,
      District,
      Parliamentary_Constituency,
      Centre_Address,
      Training_Partner,
      Status,
      Training_Center_Name,
      TP_SPOC_Name,
      TP_SPOC_Email,
      TP_SPOC_Contact_Number,
    };

    await firestore.collection("training_centres").doc(centre_id).set(data);

    res.status(200).send({ message: "Training centre added successfully" });
  } catch (error) {
    console.error("Error adding training centre: ", error);
    res.status(500).send({ message: "Failed to add training centre", error });
  }
};

//update the training centre
module.exports.updateTrainingCentre = async (req, res) => {
  try {
    const {
      centre_id,
      state,
      District,
      Parliamentary_Constituency,
      Centre_Address,
      Training_Partner,
      Status,
      Training_Center_Name,
      TP_SPOC_Name,
      TP_SPOC_Email,
      TP_SPOC_Contact_Number,
    } = req.body;

    if (!centre_id) {
      return res.status(400).send({ message: "centre_id is required" });
    }

    const data = {
      centre_id,
      state,
      District,
      Parliamentary_Constituency,
      Centre_Address,
      Training_Partner,
      Status,
      Training_Center_Name,
      TP_SPOC_Name,
      TP_SPOC_Email,
      TP_SPOC_Contact_Number,
    };

    await firestore.collection("training_centres").doc(centre_id).update(data);

    res.status(200).send({ message: "Training centre updated successfully" });
  } catch (error) {
    console.error("Error updating training centre: ", error);
    res
      .status(500)
      .send({ message: "Failed to update training centre", error });
  }
};

module.exports.getAllTrainingCentres = async (req, res) => {
  try {
    const trainingCentres = [];
    const snapshot = await firestore.collection("training_centres").get();
    snapshot.forEach((doc) => {
      trainingCentres.push(doc.data());
    });
    res.status(200).send(trainingCentres);
  } catch (error) {
    console.error("Error fetching training centres: ", error);
    res
      .status(500)
      .send({ message: "Failed to fetch training centres", error });
  }
};

module.exports.getStates = async (req, res) => {
  //get the states list from states.json file
  const states = require("../json_data/states.json");
  res.status(200).json(states);
};

module.exports.getDistrcits = async (req, res) => {
  //get the districts list of all states from districts.json
  const districts = require("../json_data/districts.json");
  res.status(200).json(districts);
};
