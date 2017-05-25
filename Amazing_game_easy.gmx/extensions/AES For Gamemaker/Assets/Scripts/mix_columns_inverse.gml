//Inverses all columns of state grid

//14 11 13 09
//09 14 11 13
//13 09 14 11
//11 13 09 14

for (xx = 0; xx < global.keySize; xx += 1)
{
    //Get column values
    a0 = ds_grid_get(global.state,xx,0);
    a1 = ds_grid_get(global.state,xx,1);
    a2 = ds_grid_get(global.state,xx,2);
    a3 = ds_grid_get(global.state,xx,3);
    //Calc column values
    r0 = mul14_calc(a0)  ^mul11_calc(a1)^mul13_calc(a2) ^mul9_calc(a3);
    r1 = mul9_calc(a0)   ^mul14_calc(a1)^mul11_calc(a2) ^mul13_calc(a3);
    r2 = mul13_calc(a0)  ^mul9_calc(a1) ^mul14_calc(a2) ^mul11_calc(a3);
    r3 = mul11_calc(a0)  ^mul13_calc(a1)^mul9_calc(a2)  ^mul14_calc(a3);
    //Set column values
    ds_grid_set(global.state,xx,0,r0);
    ds_grid_set(global.state,xx,1,r1);
    ds_grid_set(global.state,xx,2,r2);
    ds_grid_set(global.state,xx,3,r3);
}
return 1;

