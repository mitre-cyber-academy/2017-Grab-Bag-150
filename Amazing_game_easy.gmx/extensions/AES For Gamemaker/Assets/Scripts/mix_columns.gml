//Mixes all columns of state grid

//02 03 01 01
//01 02 03 01
//01 01 02 03
//03 01 01 02

for (xx = 0; xx < global.keySize; xx += 1)
{
    //Get column values
    a0 = ds_grid_get(global.state,xx,0);
    a1 = ds_grid_get(global.state,xx,1);
    a2 = ds_grid_get(global.state,xx,2);
    a3 = ds_grid_get(global.state,xx,3);
    //Calc column values
    r0 = mul2_calc(a0)  ^mul3_calc(a1)  ^a2             ^a3;
    r1 = a0             ^mul2_calc(a1)  ^mul3_calc(a2)  ^a3;
    r2 = a0             ^a1             ^mul2_calc(a2)  ^mul3_calc(a3);
    r3 = mul3_calc(a0)  ^a1             ^a2             ^mul2_calc(a3);
    //Set column values
    ds_grid_set(global.state,xx,0,r0);
    ds_grid_set(global.state,xx,1,r1);
    ds_grid_set(global.state,xx,2,r2);
    ds_grid_set(global.state,xx,3,r3);
}
return 1;

