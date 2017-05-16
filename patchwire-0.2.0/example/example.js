var GMServer = require('../index.js').Server;
var ClientManager = require('../index.js').ClientManager;

function point_distance(x1,y1,x2,y2,cb) {
	var sum = (Math.pow((x2-x1),2))+(Math.pow((y2-y1),2))
	sum = Math.sqrt(sum)
	//console.log(sum)
	cb(sum)
}


function routeToRoom(tempX,tempY,roomTemp,cb) {
    var goodToGO = 0;

    if(roomTemp == 1) {point_distance(tempX,tempY,1900,700, function(idd) {distance = idd;}); if(distance < 40){goodToGO = 1;} }
	if(roomTemp == 2) {point_distance(tempX,tempY,1900,480, function(idd) {distance = idd;}); if(distance < 40){goodToGO = 1;} }
	if(roomTemp == 3) {point_distance(tempX,tempY,900,700, function(idd) {distance = idd;}); if(distance < 40){goodToGO = 1;} }
	
	cb(goodToGO);
}




var gameManager = new ClientManager();

gameManager.addCommandListener('main', function(client, data) {
    //console.log(client.clientId + ' says: ' + data.x);
    	var roomToSend = data.room;
		routeToRoom(data.x,data.y,roomToSend, function(id) {
   		 if(id != 0){roomToSend = ""+(parseInt(roomToSend, 10)+1);  }
		});
	client.send({command: 'main', players: gameManager.clients.length, room: roomToSend });


});


var server = new GMServer(function(client) {
  gameManager.addClient(client);
  console.info('Client Connected');


});

server.listen(6900, function() {
  console.info('Server is running');
});
