//init(128/192/256)

//Tables
mul2_table();
mul3_table();
mul9_table();
mul11_table();
mul13_table();
mul14_table();
forward_sbox_table();
reverse_sbox_table();
rcon_table();
//Set variables
switch (argument0) 
{
    case 128: {a = 10; b = 4; break;}
    case 192: {a = 12; b = 6; break;}
    case 256: {a = 14; b = 8; break;}
}
global.rounds = a;
global.keySize = b;
global.stateWidth = 4;
global.stateHeight = 4;
global.key = ds_grid_create((global.rounds+1)*global.stateWidth,global.stateHeight);
global.state = ds_grid_create(global.stateWidth,global.stateHeight);
global.iv = ds_grid_create(16,16);
global.ivtemp = ds_grid_create(16,16);
return 1;

