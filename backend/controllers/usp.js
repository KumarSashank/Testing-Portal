module.exports.getreq = async (req, res) => {
  console.log("checking from console");
  res.send({
    operation_code: 1,
  });
};
