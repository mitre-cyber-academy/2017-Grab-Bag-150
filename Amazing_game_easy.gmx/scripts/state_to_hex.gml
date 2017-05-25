//Converts state grid to a hex string
str = "";
for (xx = 0; xx < global.stateWidth; xx += 1)
{
    for (yy = 0; yy < global.stateHeight; yy += 1)
    {
        str += dec_to_hex(ds_grid_get(global.state,xx,yy));
    }
}
return str;

