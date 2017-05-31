//Converts string to iv grid
if (string_length(argument0)!=16) {show_error("String in 'string_to_iv' not correct length",0); return 0;}
str = argument0;
i = 1;
for (xx = 0; xx < global.stateWidth; xx += 1)
{
    for (yy = 0; yy < global.stateHeight; yy += 1)
    {
        ds_grid_set(global.iv,xx,yy,ord(string_copy(str,i,1)));
        i += 1;
    }
}
return 1;

