const router = require('express').Router();
const wrapAsync = require('../util/util');

const { generateAuth } = require('../controllers/admin_controller');

router.route('/admin/auth').post(wrapAsync(generateAuth));

module.exports = router;