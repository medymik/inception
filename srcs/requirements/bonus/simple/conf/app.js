var basePath = __dirname;
var http = require('http');
var fs = require('fs');
var path = require('path');

http.createServer(function(req, res) {
    var stream = fs.createReadStream(path.join(__dirname, 'index.html'));
    stream.on('error', function() {
        res.writeHead(404);
        res.end();
    });
    stream.pipe(res);
}).listen(process.env.PORT);