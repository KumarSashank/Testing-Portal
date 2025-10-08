const jwt = require("jsonwebtoken");

const JWT_SECRET = "Kumar Sashank is the Backend Developer.";

const authenticateToken = (req, res, next) => {
  const authHeader = req.headers["authorization"];
  const token = authHeader && authHeader.split(" ")[1];

  if (token == null) return res.sendStatus(401); // if there's no token

  jwt.verify(token, JWT_SECRET, (err, user) => {
    if (err) return res.sendStatus(403); // if the token is invalid
    req.user = user;
    next();
  });
};

module.exports = { authenticateToken };
