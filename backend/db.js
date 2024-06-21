const firebase = require("firebase-admin");

// const firebaseConfig = {
//   apiKey: "AIzaSyBzbhDPjGN4eUhaW-edVBYKdMtRzHPgbXw",
//   authDomain: "portaldev-14a99.firebaseapp.com",
//   projectId: "portaldev-14a99",
//   storageBucket: "portaldev-14a99.appspot.com",
//   messagingSenderId: "856895878058",
//   appId: "1:856895878058:web:170bcbf42dcd3670fe71d3",
//   measurementId: "G-EQXC0STZ7V",
// };

// var admin = require("firebase-admin");

var serviceAccount = require("./portaldev-14a99-firebase-adminsdk-a31b8-15d064252b.json");

firebase.initializeApp({
  credential: firebase.credential.cert(serviceAccount),
  databaseURL: "https://portaldev-14a99.firebaseio.com",
  storageBucket: "gs://portaldev-14a99.appspot.com",
});

const db = firebase.firestore();
db.settings({ ignoreUndefinedProperties: true });

module.exports = db;
