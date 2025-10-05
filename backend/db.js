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
  
  // Decode Base64 to JSON with error handling
  try {
    const serviceAccountJson = Buffer.from(base64ServiceAccount, 'base64').toString('utf8');
    serviceAccount = JSON.parse(serviceAccountJson);
  } catch (error) {
    console.error('❌ Failed to decode Base64 service account:', error.message);
    console.error('Base64 length:', base64ServiceAccount.length);
    console.error('First 100 chars:', base64ServiceAccount.substring(0, 100));
    throw new Error('Invalid Base64 service account format');
  }
  
  // Debug: Check if all required fields are present
  const requiredFields = ['type', 'project_id', 'private_key', 'client_email'];
  const missingFields = requiredFields.filter(field => !serviceAccount[field]);
  if (missingFields.length > 0) {
    console.error('❌ Missing required fields in service account:', missingFields);
    console.error('Service account keys:', Object.keys(serviceAccount));
  } else {
    console.log('✅ Successfully loaded service account from environment variable');
    console.log('Service account:', serviceAccount);
    console.log('Service account project_id:', serviceAccount.project_id);
    console.log('Service account client_email:', serviceAccount.client_email);
  }
} else {
  // Development: Try to use environment variable first, then fallback to local file
  const base64ServiceAccount = process.env.FIREBASE_SERVICE_ACCOUNT_BASE64;
  
  if (base64ServiceAccount) {
    // Use environment variable if available
    try {
      const serviceAccountJson = Buffer.from(base64ServiceAccount, 'base64').toString('utf8');
      serviceAccount = JSON.parse(serviceAccountJson);
    } catch (error) {
      console.error('❌ Failed to decode Base64 service account:', error.message);
      console.error('Base64 length:', base64ServiceAccount.length);
      console.error('First 100 chars:', base64ServiceAccount.substring(0, 100));
      throw new Error('Invalid Base64 service account format');
    }
    
    // Debug: Check if all required fields are present
    const requiredFields = ['type', 'project_id', 'private_key', 'client_email'];
    const missingFields = requiredFields.filter(field => !serviceAccount[field]);
    if (missingFields.length > 0) {
      console.error('❌ Missing required fields in service account:', missingFields);
      console.error('Service account keys:', Object.keys(serviceAccount));
    } else {
      console.log('✅ Successfully loaded service account from environment variable (development)');
      console.log('Service account project_id:', serviceAccount.project_id);
      console.log('Service account client_email:', serviceAccount.client_email);
    }
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
