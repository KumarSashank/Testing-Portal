const { Router } = require("express");
const {
  check_user,
  signupUser,
  signinUser,
} = require("../controllers/user_controller");
const router = Router();

router.get("/tata", check_user);
router.post("/signup", signupUser); // Route for user signup
router.post("/signin/:role", signinUser); // Route for user signin with role parameter

router.get("/hello", (req, res) => {
  res.send("Hello, World!");
});

module.exports = router;
