const { Router } = require("express");
const { check_user, signupUser } = require("../controllers/user_controller");
const router = Router();

router.get("/tata", check_user);
router.post("/signup", signupUser); // Route for user signup

router.get("/hello", (req, res) => {
  res.send("Hello, World!");
});

module.exports = router;
