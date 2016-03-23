// 1. Create an express object as the express object
var app = require('express')();

// 2. Create a web server
var server = require('http').Server(app);
 
// 2.1 Create a socket.io object on the server
var io = require('socket.io')(server);

// 3. Set listen port
server.listen(1152);

// 4. Set route
app.get('/', function(request, response) {
	response.sendFile(__dirname + '/index.html');
});

// 5. Listen for the client connection
io.on('connection', function(socket) {
	console.log('Accept a connection');
	socket.on('chat.message', function(message) {
		console.log('New message: ' + message);
		io.emit('chat.message', message);
	});

	socket.on('disconnect', function() {
		// Broadcast this event to each connected client
		io.emit('chat.message', 'A user has disconnected');
	});	
});