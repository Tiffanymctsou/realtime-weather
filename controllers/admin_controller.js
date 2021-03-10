const Admin = require('../models/admin_model');

const generateAuth = async (req, res) => {
    const front = 4;
    const back = 5;
    const chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    let key = '';
    for (let i = 0; i < front; i++) {
        const index = Math.floor((Math.random() * chars.length));
        key = key + chars[index];
    }
    key = key + '-' + Date.now() + '-';
    for (let i = 0; i < back; i++) {
        const index = Math.floor((Math.random() * chars.length));
        key = key + chars[index];
    }
    const data = {
        key: key
    };
    const result = await Admin.generateAuth(data);
    if (result.error) {
        console.log(result.error);
        res.status(500).send('Server Error!');
    }
    if (result.message === 'activated.') {
        res.status(200).send(key);
        return;
    }
};

module.exports = {
    generateAuth
};