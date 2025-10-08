// Use the centralized Firebase configuration
const { db, firebaseConfig, JWT_SECRET } = require("./firebase-config");

// Export the database and other utilities
module.exports = db;

// Also export the config for other modules that might need it
module.exports.firebaseConfig = firebaseConfig;
module.exports.JWT_SECRET = JWT_SECRET;