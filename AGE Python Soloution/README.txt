Step 1) ensure you route IP's to simulate the server IP
Step 2) Run the python script, it emulates the server
Step 3) done...

if it doesn't work....
make sure the port is updated
sock.bind(('', 6900))


------how it works-----------

Python simulated server emulates real game server, when client connects to emualted server the server sends 
the command that makes the client go to room 4 which has the MCA key on it

