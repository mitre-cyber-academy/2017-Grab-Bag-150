//Deletes grids from memory
ds_grid_destroy(global.state);
ds_grid_destroy(global.key);
ds_grid_destroy(global.mul2);
ds_grid_destroy(global.mul3);
ds_grid_destroy(global.mul9);
ds_grid_destroy(global.mul11);
ds_grid_destroy(global.mul13);
ds_grid_destroy(global.mul14);
ds_grid_destroy(global.fsb);
ds_grid_destroy(global.rsb);
ds_grid_destroy(global.rcon);
ds_grid_destroy(global.iv);
ds_grid_destroy(global.ivtemp);
return 1;

