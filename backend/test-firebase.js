const firebase = require("firebase-admin");

// Test Firebase connection with detailed debugging
async function testFirebaseConnection() {
  try {
    console.log("🔧 Testing Firebase connection...");
    
    // Load service account from JSON file directly
    const serviceAccount = require("./portaldev-14a99-firebase-adminsdk-a31b8-23042b117d.json");
    
    console.log("📋 Service Account Details:");
    console.log("  Project ID:", serviceAccount.project_id);
    console.log("  Client Email:", serviceAccount.client_email);
    console.log("  Private Key ID:", serviceAccount.private_key_id);
    console.log("  Type:", serviceAccount.type);
    
    // Initialize Firebase
    firebase.initializeApp({
      credential: firebase.credential.cert(serviceAccount),
      projectId: serviceAccount.project_id,
      databaseURL: "https://portaldev-14a99.firebaseio.com",
      storageBucket: "gs://portaldev-14a99.appspot.com",
    });
    
    console.log("✅ Firebase initialized successfully");
    
    // Test Firestore connection
    const db = firebase.firestore();
    console.log("🔍 Testing Firestore connection...");
    
    // Try to read a simple document
    const testDoc = await db.collection("users").doc("Admin").get();
    
    if (testDoc.exists) {
      console.log("✅ Firestore connection successful!");
      console.log("📄 Admin document found:", testDoc.data());
    } else {
      console.log("⚠️  Admin document not found, but connection works");
    }
    
    // Test authentication
    console.log("🔐 Testing authentication...");
    const auth = firebase.auth();
    console.log("✅ Auth service initialized");
    
    // List users (this requires admin permissions)
    try {
      const listUsersResult = await auth.listUsers(1);
      console.log("✅ Auth permissions verified");
    } catch (authError) {
      console.log("⚠️  Auth permissions issue:", authError.message);
    }
    
  } catch (error) {
    console.error("❌ Firebase connection failed:");
    console.error("Error Code:", error.code);
    console.error("Error Message:", error.message);
    console.error("Full Error:", error);
    
    // Provide specific troubleshooting steps
    if (error.code === 16) {
      console.log("\n🔧 Troubleshooting Steps for UNAUTHENTICATED error:");
      console.log("1. Check if the service account key is valid");
      console.log("2. Verify the project ID matches: portaldev-14a99");
      console.log("3. Ensure the service account has proper permissions");
      console.log("4. Check if the Firebase project is active");
      console.log("5. Verify billing is enabled on the project");
    }
  }
}

// Run the test
testFirebaseConnection().then(() => {
  console.log("\n🏁 Test completed");
  process.exit(0);
}).catch((error) => {
  console.error("💥 Test failed:", error);
  process.exit(1);
});
