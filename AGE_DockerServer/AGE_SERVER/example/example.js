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

    /*tempX = decrypt(tempX);
    tempY = decrypt(tempY);
    tempX = tempX.replace(/n/g, '');
    tempY = tempY.replace(/n/g, '');*/

    if(roomTemp == 1) {point_distance(tempX,tempY,1900,700, function(idd) {distance = idd;}); if(distance < 40){goodToGO = 1;} }
	if(roomTemp == 2) {point_distance(tempX,tempY,1900,480, function(idd) {distance = idd;}); if(distance < 40){goodToGO = 2;} }
	if(roomTemp == 3) {point_distance(tempX,tempY,1013,190, function(idd) {distance = idd;}); if(distance < 40){goodToGO = 3;} 
									}
	
	cb(goodToGO);
}




var gameManager = new ClientManager();

gameManager.addCommandListener('main', function(client, data) {
    console.log(data);
    	var roomToSend = data.room;
    	//roomToSend = roomToSend.replace(/n/g, '');
		routeToRoom(data.x,data.y,roomToSend, function(id) {
   		 if(id != 0){roomToSend = ""+(parseInt(roomToSend, 10)+1);  }
   		 if(id == 3){	
   		 				      //client.send({command: 'Upflag', chunk1: vunk1, chunk2: vunk2, chunk3: vunk3,chunk4: vunk4 });  
   		 				      //console.log("Sending Flag to user")
   				       	}
		});
		//roomToSend = encrypt(roomToSend);
	client.send({command: 'main', players: gameManager.clients.length, room: roomToSend });

	


});

var crypto = require('crypto'),
    algorithm = 'aes-128-ecb', // 'aes-128-ctr'
    password =  new Buffer('3DF2104AB016B2DE') //


    //const ciphers = crypto.getCiphers();
	//console.log(ciphers);

function encrypt(text){
  var newtext = new Buffer.from(text,'ascii')
  var cipher = crypto.createCipheriv(algorithm,password,'')
  //cipher.setAutoPadding(false)
  var crypted = cipher.update(newtext,'ascii', 'hex')
  crypted += cipher.final('hex');
  return crypted;
}
 
function decrypt(text){
  var newtext = new Buffer.from(text,'hex')
  var decipher = crypto.createDecipheriv(algorithm,password,'')
  decipher.setAutoPadding(false)
  var dec = decipher.update(newtext,'hex', 'ascii')
  dec += decipher.final('ascii');
  //console.log(dec);
  return dec;
}




var server = new GMServer(function(client) {
  gameManager.addClient(client);
  console.info('Client Connected');
});



server.listen(6900, function() {
  console.info('Server is running');
});
