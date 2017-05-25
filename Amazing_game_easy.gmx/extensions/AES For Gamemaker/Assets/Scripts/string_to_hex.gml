//Converts string to hex
hx = "";
str = argument0;
for (i = 0; i < string_length(argument0); i += 1)
{
    tmpstr = ord(string_copy(str,i+1,1));
    hx += dec_to_hex(tmpstr);
}
return hx;

