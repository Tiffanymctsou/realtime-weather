const jwt = require("jsonwebtoken");
const secret = process.env.JWT_SECRET;
const expire = process.env.TOKEN_EXPIRE;

const generateAuth = async (req, res) => {
    const key = "Bearer " + jwt.sign({ time: Date.now() }, secret, { expiresIn: expire });
    res.status(200).send(key);
};

module.exports = {
    generateAuth
};