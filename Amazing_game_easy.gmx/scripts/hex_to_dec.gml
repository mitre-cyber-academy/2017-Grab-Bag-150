//Converts a hex string to a decimal
//Script by http://www.gmlscripts.com/
{
    var hex, dec, h, p;
    hex = string_upper(string(argument0));
    if (hex=="00") {return 0;}
    dec = 0;
    h = "0123456789ABCDEF";
    for (p=1; p<=string_length(hex); p+=1) {
        dec = dec << 4 | (string_pos(string_char_at(hex, p), h) - 1);
    }
    return dec;
}

