//Inverse substitutes all bytes in state grid
for (xx = 0; xx < global.stateWidth; xx += 1)
{
    for (yy = 0; yy < global.stateHeight; yy += 1)
    {
        ds_grid_set(global.state,xx,yy,sbox_inverse_calc(ds_grid_get(global.state,xx,yy)));
    }
}
return 1;

