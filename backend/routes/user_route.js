const { Router } = require("express");
const router = Router();

// const { createstudent } = require("../controllers/user_controller");
// const { getAllBuses } = require("../controllers/user_controller"); // Adjust the path accordingly
const { check_user } = require("../controllers/user_controller");

router.get("/tata", check_user);

// router.get("/users", createstudent);

// router.get('/buses/:id',getBus);
// router.get('/buses/:id/stops',getBusStops);
// router.get('/getFare',getFare);

router.get("/hello", (req, res) => {
  res.send("Hello, World!");
});

module.exports = router;
