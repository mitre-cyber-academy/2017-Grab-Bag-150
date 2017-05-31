//Writes state grid values to file
//argument0 = binary file       (file id)
//argument1 = position          (decimal)
w = 0;
for (xx = 0; xx < global.stateWidth; xx += 1)
{
    for (yy = 0; yy < global.stateHeight; yy += 1)
    {
        b = ds_grid_get(global.state,xx,yy);
        file_bin_seek(argument0,argument1+w);
        file_bin_write_byte(argument0,b);
        w += 1;
    }
}
return 1;

