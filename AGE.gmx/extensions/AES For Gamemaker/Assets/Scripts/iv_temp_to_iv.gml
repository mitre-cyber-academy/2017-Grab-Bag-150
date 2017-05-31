//Transfers ivtemp grid to iv grid
for (xx = 0; xx < global.stateWidth; xx += 1)
{
    for (yy = 0; yy < global.stateHeight; yy += 1)
    {
        ds_grid_set(global.iv,xx,yy,ds_grid_get(global.ivtemp,xx,yy));
    }
}
return 1;

