const firebase = require("firebase");

const firebaseConfig = {
  apiKey: "AIzaSyBzbhDPjGN4eUhaW-edVBYKdMtRzHPgbXw",
  authDomain: "portaldev-14a99.firebaseapp.com",
  projectId: "portaldev-14a99",
  storageBucket: "portaldev-14a99.appspot.com",
  messagingSenderId: "856895878058",
  appId: "1:856895878058:web:170bcbf42dcd3670fe71d3",
  measurementId: "G-EQXC0STZ7V",
};

const db = firebase.initializeApp(firebaseConfig);
module.exports = db;
