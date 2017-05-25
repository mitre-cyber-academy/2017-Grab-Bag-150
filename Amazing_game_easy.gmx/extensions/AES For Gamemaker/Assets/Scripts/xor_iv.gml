//Xors iv grid with state grid
for (xx = 0; xx < global.stateWidth; xx += 1)
{
    for (yy = 0; yy < global.stateHeight; yy += 1)
    {
        ds_grid_set(global.state,xx,yy,ds_grid_get(global.state,xx,yy)^ds_grid_get(global.iv,xx,yy));
    }
}
return 1;

