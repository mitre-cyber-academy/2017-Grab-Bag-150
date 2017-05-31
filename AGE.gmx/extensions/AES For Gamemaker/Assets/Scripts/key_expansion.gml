//Expands key
//128 = 16 byte key > 176 byte key
//192 = 24 byte key > 208 byte key
//256 = 32 byte key > 240 byte key
size = global.keySize;
for (sk = 0; sk < global.rounds; sk += 1)
{
    for (xx = 0; xx < global.keySize; xx += 1)
    {
        if (xx==0)
        {
            //bit shift left
            b0 = ds_grid_get(global.key,(sk+1)*size-1,1);
            b1 = ds_grid_get(global.key,(sk+1)*size-1,2);
            b2 = ds_grid_get(global.key,(sk+1)*size-1,3);
            b3 = ds_grid_get(global.key,(sk+1)*size-1,0);
            //sub
            b0 = sbox_calc(b0);
            b1 = sbox_calc(b1);
            b2 = sbox_calc(b2);
            b3 = sbox_calc(b3);
            //get value of previous 4 columns
            a0 = ds_grid_get(global.key,sk*size,0);
            a1 = ds_grid_get(global.key,sk*size,1);
            a2 = ds_grid_get(global.key,sk*size,2);
            a3 = ds_grid_get(global.key,sk*size,3);
            //rcon
            r0 = a0^b0^rcon_calc(sk);
            r1 = a1^b1^0;
            r2 = a2^b2^0;
            r3 = a3^b3^0;
            //set values
            ds_grid_set(global.key,(sk+1)*size,0,r0);
            ds_grid_set(global.key,(sk+1)*size,1,r1);
            ds_grid_set(global.key,(sk+1)*size,2,r2);
            ds_grid_set(global.key,(sk+1)*size,3,r3);
        }
        else
        {
            //get value of previous 4 columns
            a0 = ds_grid_get(global.key,sk*size+xx,0);
            a1 = ds_grid_get(global.key,sk*size+xx,1);
            a2 = ds_grid_get(global.key,sk*size+xx,2);
            a3 = ds_grid_get(global.key,sk*size+xx,3);
            //get value of previous column
            b0 = ds_grid_get(global.key,(sk+1)*size-1+xx,0);
            b1 = ds_grid_get(global.key,(sk+1)*size-1+xx,1);
            b2 = ds_grid_get(global.key,(sk+1)*size-1+xx,2);
            b3 = ds_grid_get(global.key,(sk+1)*size-1+xx,3);
            //xor
            if (global.rounds==14 && xx==4)
            {
                b0 = sbox_calc(b0);
                b1 = sbox_calc(b1);
                b2 = sbox_calc(b2);
                b3 = sbox_calc(b3);
            }
            r0 = a0^b0;
            r1 = a1^b1;
            r2 = a2^b2;
            r3 = a3^b3;
            //set values
            ds_grid_set(global.key,(sk+1)*size+xx,0,r0);
            ds_grid_set(global.key,(sk+1)*size+xx,1,r1);
            ds_grid_set(global.key,(sk+1)*size+xx,2,r2);
            ds_grid_set(global.key,(sk+1)*size+xx,3,r3);
        }
    }
}
return 1;

