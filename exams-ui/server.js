var fs = require('fs'),
    pkg = JSON.parse(fs.readFileSync(__dirname + '/package.json', 'utf8')),
    moment = require('moment');

GLOBAL.basedir = __dirname;
GLOBAL.dev = false;
GLOBAL.http = { port: 5000 };
GLOBAL.version = pkg.version;

process.argv.forEach(function (val, index, array) {
    if (val === 'dev') {
        console.log('dev mode');
        GLOBAL.dev = true;
        return;
    }
});

GLOBAL.log = function (msg) {
    console.log(moment().format('MMMM Do YYYY, h:mm:ss a') + ' # ' + msg);
};

require(__dirname + '/server/js/express');
