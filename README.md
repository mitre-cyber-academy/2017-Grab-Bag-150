# Online Game That Reaches Back To Server For Next Level (OGTRBTSFNL)

## How to Run Client

1. Run preInstal.sh this installs 32 bit libraries that the game needs
1. once it is complete the game will run automatically and should also be fully installed with a icon to re-run 

## How to Run Server
1. Configure nodeJS for your OS
1. run the server, it runs on port 6900

This is a online game with a Game Maker Studio client and a nodeJS server. To run it requires NodeJS and applications are included for windows and linux for testing

## How to solve ##
1. ensure you route IP's to simulate the server IP
1. Run the python script, it emulates the server
1. if you make a server be sure to emulate the protocol, this can be discovered with Wireshark
1. run the client and make sure it connects to your python server


------how it works-----------

Python simulated server emulates real game server, when client connects to emualted server the server sends 
the command that makes the client go to room 4 which has the MCA key on it


# Flag

flag is: MCA{MARIO_SUX!}


