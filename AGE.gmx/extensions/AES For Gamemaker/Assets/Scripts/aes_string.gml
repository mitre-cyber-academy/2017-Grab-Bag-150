//aes_string(state,key,stateIsHex,keyIsHex,encrypt/decrypt)
//argument0 = state                 (string)
//argument1 = key                   (string)
//argument2 = stateIsHex            (binary)
//argument3 = keyIsHex              (binary)
//argument4 = encrypt/decrypt       (binary)

if (argument2==0) {string_to_state(argument0);} else {hex_to_state(argument0);} //Input argument to state grid
if (argument3==0) {string_to_key(argument1);} else {hex_to_key(argument1);} //Input argument to key grid
key_expansion();
if (argument4==0){aes_encrypt();} else {aes_decrypt();} //Encrypt/decrypt state
return 1;

