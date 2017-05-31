//Converts a decimal to a hex string
//Script by http://www.gmlscripts.com/
{
    var dec, hex, h, byte, hi, lo;
    dec = argument0;
    hex = ""
    if (dec==0) return "00";
    h = "0123456789ABCDEF";
    while (dec) {
        byte = dec & 255;
        hi = string_char_at(h, byte div 16 + 1);
        lo = string_char_at(h, byte mod 16 + 1);
        hex = hi + lo + hex;
        dec = dec >> 8;
    }
    return hex;
}

