//Converts state grid to a string
str = "";
for (xx = 0; xx < global.stateWidth; xx += 1)
{
    for (yy = 0; yy < global.stateHeight; yy += 1)
    {
        str += chr(ds_grid_get(global.state,xx,yy));
    }
}
return str;

