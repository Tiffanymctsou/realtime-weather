module.exports = {
    "env": {
        "browser": true,
        "es2021": true,
        "node": true
    },
    "extends": "eslint:recommended",
    "parserOptions": {
        "ecmaVersion": 12
    },
    "rules": {
        semi: ['warn', 'always'],
        'semi-style': ['warn', 'last'],
        indent: ['warn', 4]
    }
};
