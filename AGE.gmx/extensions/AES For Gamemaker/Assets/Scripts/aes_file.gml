//aes_file(filepath,key,iv,keyIsHex,ivIsHex,encrypt/decrypt,ebc/cbc)
//argument0 = filepath          (string)
//argument1 = key               (string)
//argument2 = iv                (string)
//argument3 = keyIsHex          (binary)
//argument4 = ivIsHex           (binary)
//argument5 = encrypt/decrypt   (binary)
//argument6 = ebc/cbc           (binary)

iv = argument2;
if (argument6==1)
{
    if (argument4==0)
    {
        string_to_iv(iv); //Input argument to iv grid
    }
    else
    {
        hex_to_iv(iv); //Input argument to iv grid
    }
}

if (argument3==0) {string_to_key(argument1);} else {hex_to_key(argument1);} //Input argument to key grid

key_expansion(); //Expand key

//Encrypt/decrypt
pfile = file_bin_open(argument0,2); //Opens file to apply padding
//Check size and apply padding
s = 0;
size = file_bin_size(pfile);
if (size mod 16 != 0)
{
    pad = 0;
    do {pad+=1} until ((pad+size) mod 16 == 0)
    do
    {
        file_bin_seek(pfile,size+s); //Seek next position
        file_bin_write_byte(pfile,ord("0")); //Add "0" as padding
        s += 1;
    } until (s == pad)
    
}
file_bin_close(pfile); //Close file

ofile = file_bin_open(argument0,0); //Opens file to read
sfile = file_bin_open(argument0,1); //Opens file to write
p = 0; //Set file variable position
file_bin_seek(ofile,p); //Set read file position
file_bin_seek(sfile,p); //Set write file position
while (file_bin_position(sfile)<file_bin_size(ofile)) //Main file loop
{
    file_bin_seek(ofile,p); //Set read file position
    file_bin_seek(sfile,p); //Set write file position
    file_to_state(ofile,p); //Set state
    if (argument6==1 && argument5==0) {xor_iv();} //Xor iv grid with state grid
    if (argument6==1 && argument5==1) {state_to_iv_temp();} //Transfer state grid to ivtemp grid
    if (argument5==0) {aes_encrypt();} else {aes_decrypt();} //Encrypt or decrypt state
    if (argument6==1 && argument5==1) {xor_iv();iv_temp_to_iv();} //Xor iv grid with state grid, then transfer ivtemp grid to iv grid
    state_to_file(sfile,p); //Write state values to file
    p += 16; //Move forward 16 bytes
    if (argument6==1 && argument5==0) {state_to_iv();} //Save state grid to iv grid
}
file_bin_close(sfile); //Close file
file_bin_close(ofile); //Close file
return 1;

