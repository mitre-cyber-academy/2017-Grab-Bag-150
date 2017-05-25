//
temp = string(argument0)
len = string_length(temp)
repeat(16-len)
{
temp+="n"
}

aes_string(temp,string(argument1),0,0,argument2)
encode = state_to_hex();

return encode;
