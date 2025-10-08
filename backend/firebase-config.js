// Firebase configuration for both client and admin usage
const firebase = require("firebase-admin");

// Client-side Firebase config (for frontend)
const firebaseConfig = {
  apiKey: "AIzaSyBzbhDPjGN4eUhaW-edVBYKdMtRzHPgbXw",
  authDomain: "portaldev-14a99.firebaseapp.com",
  projectId: "portaldev-14a99",
  storageBucket: "portaldev-14a99.appspot.com",
  messagingSenderId: "856895878058",
  appId: "1:856895878058:web:170bcbf42dcd3670fe71d3",
  measurementId: "G-EQXC0STZ7V"
};

// JWT Secret from environment variable
const JWT_SECRET = process.env.JWT_SECRET || "Kumar Sashank is the Backend Developer.";

// Admin SDK configuration
let serviceAccount;

// Load service account from environment variable (Base64 encoded)
if (!process.env.FIREBASE_SERVICE_ACCOUNT_BASE64) {
  throw new Error('FIREBASE_SERVICE_ACCOUNT_BASE64 environment variable is required');
}

try {
  const base64Data = process.env.FIREBASE_SERVICE_ACCOUNT_BASE64;
  const jsonString = Buffer.from(base64Data, 'base64').toString('utf-8');
  serviceAccount = JSON.parse(jsonString);
  console.log('✅ Service account loaded from environment variable (Base64)');
  console.log('📋 Service Account Details:');
  console.log('  Project ID:', serviceAccount.project_id);
  console.log('  Client Email:', serviceAccount.client_email);
  console.log('  Private Key ID:', serviceAccount.private_key_id);
} catch (error) {
  console.error('❌ Failed to decode Base64 service account:', error.message);
  throw new Error('Invalid Base64 service account data');
}

// Initialize Firebase Admin SDK
firebase.initializeApp({
  credential: firebase.credential.cert(serviceAccount),
  projectId: firebaseConfig.projectId,
  databaseURL: `https://${firebaseConfig.projectId}.firebaseio.com`,
  storageBucket: firebaseConfig.storageBucket,
});

const db = firebase.firestore();
db.settings({ ignoreUndefinedProperties: true });

const auth = firebase.auth();
const storage = firebase.storage();

module.exports = {
  firebase,
  db,
  auth,
  storage,
  firebaseConfig,
  JWT_SECRET
};
