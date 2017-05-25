//Writes raw bytes to state grid
//argument0 = binary file       (file id)
//argument1 = position          (decimal)
r = 0;
for (xx = 0; xx < global.stateWidth; xx += 1)
{
    for (yy = 0; yy < global.stateHeight; yy += 1)
    {
        file_bin_seek(argument0,argument1+r);
        b = file_bin_read_byte(argument0);
        ds_grid_set(global.state,xx,yy,b);
        r += 1;
    }
}
return 1;

