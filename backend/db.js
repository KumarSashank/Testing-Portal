const firebase = require("firebase-admin");

let serviceAccount;

if (process.env.NODE_ENV === 'production') {
  // Production: Use Base64 encoded service account from environment variable
  const base64ServiceAccount = process.env.FIREBASE_SERVICE_ACCOUNT_BASE64;
  if (!base64ServiceAccount) {
    throw new Error('FIREBASE_SERVICE_ACCOUNT_BASE64 environment variable is required in production');
  }
  
  // Decode Base64 to JSON
  const serviceAccountJson = Buffer.from(base64ServiceAccount, 'base64').toString('utf8');
  serviceAccount = JSON.parse(serviceAccountJson);
} 

firebase.initializeApp({
  credential: firebase.credential.cert(serviceAccount),
  databaseURL: "https://portaldev-14a99.firebaseio.com",
  storageBucket: "gs://portaldev-14a99.appspot.com",
});

const db = firebase.firestore();
db.settings({ ignoreUndefinedProperties: true });

module.exports = db;
