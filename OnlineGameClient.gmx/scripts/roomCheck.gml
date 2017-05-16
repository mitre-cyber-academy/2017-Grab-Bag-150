///roomCheck(room from server)
var tempRoom = argument0
         if(tempRoom != global.CurrentRoom){
             global.CurrentRoom = tempRoom;
             if(global.CurrentRoom == "1"){room_goto(room_1); }
             if(global.CurrentRoom == "2"){room_goto(room_2); }
             if(global.CurrentRoom == "3"){room_goto(room_3); }
             if(global.CurrentRoom == "4"){room_goto(room_4); }
             x = xstart;
             y = ystart;
         }
