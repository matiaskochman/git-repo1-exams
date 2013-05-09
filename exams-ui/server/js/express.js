var express = require('express'),
    app = express(),
    less = require('less'),
    lessParser = new(less.Parser)({
        paths: [GLOBAL.basedir + '/server/less'],
        filename: 'style.less'
    }),
    fs = require('fs');

app.configure(function () {
    app.use(express.logger({ format: ':method :url' }));
    app.use(express.errorHandler({ dumpExceptions:true, showStack:true }));
    app.use(express.bodyParser());

    /*app.set('view engine', 'haml');
    app.engine('haml', require('jade').__express);*/

    /*if(GLOBAL.dev) {
        app.use(express.static(GLOBAL.basedir + '/client'));
    } else {
        app.use(express.static(GLOBAL.basedir + '/dist'));
    }*/
    app.use(express.static(GLOBAL.basedir + '/client'));

    app.get('/', function (req, res) {
        res.redirect('/login.html');
    });

    app.get('/index.html', function (req, res) {
        res.set('Content-Type', 'text/html');
        res.send(fs.readFileSync(GLOBAL.basedir + '/client/html/index.html', 'utf8'));
    });

    app.get('/css/main.css', function (req, res) {
        lessParser.parse(fs.readFileSync(GLOBAL.basedir + '/server/less/main.less', 'utf8'), function(err, tree) {
            res.set('Content-Type', 'text/css');
            if(err) {
                console.error(err);
                res.status(500).send();
            } else {
                res.send(tree.toCSS({
                    compress: false,
                    yuicompress: false
                }));
            }
        });
    });

    app.get('/css/login.css', function (req, res) {
        lessParser.parse(fs.readFileSync(GLOBAL.basedir + '/server/less/login.less', 'utf8'), function(err, tree) {
            res.set('Content-Type', 'text/css');
            if(err) {
                console.error(err);
                res.status(500).send();
            } else {
                res.send(tree.toCSS({
                    compress: false,
                    yuicompress: false
                }));
            }
        });
    });

    app.get('/login.html', function (req, res) {
        res.set('Content-Type', 'text/html');
        res.send(fs.readFileSync(GLOBAL.basedir + '/client/html/login.html', 'utf8'));
    });

    app.post('/login', function (req, res) {
        GLOBAL.log('login request');
        res.set('Content-Type', 'text/plain');
        res.charset = 'utf-8';

        var notAcceptable = function (msg) {
            GLOBAL.log(msg);
            res.status(406);
            res.send(msg);
        };

        if (req.get('Content-Type').indexOf('application/json') === -1) {
            notAcceptable('Content-Type must be application/json');
        } else {
            try {
                if (!req.body) {
                    notAcceptable('no body in request');
                } else if (!req.body.login || req.body.login.length === 0) {
                    notAcceptable('login is mandatory');
                } else if (!req.body.password || req.body.password.length === 0) {
                    notAcceptable('password is mandatory');
                } else {
                    res.status(200);
                    res.send('login success');
                }
            } catch (e) {
                notAcceptable('cannot parse your data to JSON\n' + e);
            }
        }
    });

});

GLOBAL.http.server = require('http').createServer(app).listen(GLOBAL.http.port);
