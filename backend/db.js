const firebase = require("firebase-admin");

let serviceAccount;

// Debug logging (remove in production)
if (process.env.NODE_ENV !== 'production') {
  console.log('NODE_ENV:', process.env.NODE_ENV);
  console.log('VERCEL:', process.env.VERCEL);
  console.log('FIREBASE_SERVICE_ACCOUNT_BASE64 exists:', !!process.env.FIREBASE_SERVICE_ACCOUNT_BASE64);
}

// Check if we're in production (Vercel sets VERCEL=1)
const isProduction = process.env.NODE_ENV === 'production' || process.env.VERCEL === '1';

if (isProduction) {
  // Production: Use Base64 encoded service account from environment variable
  const base64ServiceAccount = process.env.FIREBASE_SERVICE_ACCOUNT_BASE64;
  if (!base64ServiceAccount) {
    console.error('Environment variables available:', Object.keys(process.env).filter(key => key.includes('FIREBASE')));
    throw new Error('FIREBASE_SERVICE_ACCOUNT_BASE64 environment variable is required in production');
  }
  
  // Decode Base64 to JSON
  const serviceAccountJson = Buffer.from(base64ServiceAccount, 'base64').toString('utf8');
  serviceAccount = JSON.parse(serviceAccountJson);
  console.log('✅ Successfully loaded service account from environment variable');
} else {
  // Development: Try to use environment variable first, then fallback to local file
  const base64ServiceAccount = process.env.FIREBASE_SERVICE_ACCOUNT_BASE64;
  
  if (base64ServiceAccount) {
    // Use environment variable if available
    const serviceAccountJson = Buffer.from(base64ServiceAccount, 'base64').toString('utf8');
    serviceAccount = JSON.parse(serviceAccountJson);
    console.log('✅ Successfully loaded service account from environment variable (development)');
  } else {
    // Try local file as fallback
    try {
      serviceAccount = require("./portaldev-14a99-firebase-adminsdk-a31b8-23042b117d.json");
      console.log('✅ Successfully loaded service account from local file');
    } catch (error) {
      console.error('❌ Failed to load local service account file:', error.message);
      console.error('💡 Tip: Set FIREBASE_SERVICE_ACCOUNT_BASE64 environment variable or add the JSON file');
      throw new Error('Service account not found. Please set FIREBASE_SERVICE_ACCOUNT_BASE64 environment variable or add the JSON file.');
    }
  }
}

firebase.initializeApp({
  credential: firebase.credential.cert(serviceAccount),
  databaseURL: "https://portaldev-14a99.firebaseio.com",
  storageBucket: "gs://portaldev-14a99.appspot.com",
});

const db = firebase.firestore();
db.settings({ ignoreUndefinedProperties: true });

module.exports = db;
