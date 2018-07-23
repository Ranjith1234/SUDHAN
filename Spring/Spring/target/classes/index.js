var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);
var sockets = {};
var people = {};

app.get('/', function(req, res){
  res.sendFile(__dirname + '/index.html');
});

io.on('connection', function(socket){
  socket.on('disconnect', function(){
    console.log(people[socket.id].name+' disconnected');
    delete people[socket.id];
    delete sockets[socket.id];
    io.emit('update-people', people);
  });

  socket.on('send message', function(data){
    var msgData = {msg: data.msg, from: people[socket.id].name}
    sockets[data.toUser].emit('new message',msgData);
    //io.emit('send message', msg);
  });

  socket.on('nickname', function(name){
     sockets[socket.id] = socket;
     var client = {name: name, clientId: socket.id};
     people[socket.id] = client;
     console.log(name+" is online");
     io.emit('update-people', people);
  });
});

http.listen(3000, function(){
  console.log('listening on *:3000');
});



