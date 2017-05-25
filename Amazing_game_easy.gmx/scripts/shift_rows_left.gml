//shifts 2nd row 1 bit, 3rd row 2 bits, and 4th row 3 bits

//get values
for (xx = 0; xx < global.stateHeight; xx += 1;)
{
    a[xx] = ds_grid_get(global.state,xx,1); //second row
    b[xx] = ds_grid_get(global.state,xx,2); //third row
    c[xx] = ds_grid_get(global.state,xx,3); //fourth row
}

//set values
for (xx = 0; xx < global.stateHeight; xx += 1)
{
    aa = (xx+1) mod global.stateWidth;
    bb = (xx+2) mod global.stateWidth;
    cc = (xx+3) mod global.stateWidth;
    ds_grid_set(global.state,xx,1,a[aa]); //second row
    ds_grid_set(global.state,xx,2,b[bb]); //third row
    ds_grid_set(global.state,xx,3,c[cc]); //fourth row
}
return 1;

