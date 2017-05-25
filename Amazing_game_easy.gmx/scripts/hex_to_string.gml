//Converts hex string to ascii string
if (string_length(argument0) mod 2 != 0) {show_error("Hex string in 'hex_to_string' not correct length",0);return "";}
str = "";
hex = argument0;
for (i = 0; i < string_length(argument0); i += 2)
{
    tmphex = string_copy(hex,i+1,2);
    str += chr(hex_to_dec(tmphex));
}
return str;

