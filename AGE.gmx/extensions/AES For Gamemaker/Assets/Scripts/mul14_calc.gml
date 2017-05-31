//Multiplies byte by 14
var f,h,hex,result,x1,y1,b1,b2;
hex = dec_to_hex(argument0);
h = "0123456789ABCDEF";
b1 = string_copy(hex,1,1);
b2 = string_copy(hex,2,1);
x1 = string_pos(b2,h);
y1 = string_pos(b1,h);
result = ds_grid_get(global.mul14,x1-1,y1-1);
result2 = hex_to_dec(result);
return result2;

