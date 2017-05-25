
    
   var buffer = argument[ 0 ];
   temp = buffer_read( buffer , buffer_string );
   
   posAt = string_pos("x",temp)
   
   var output = "";
   var done = 0;
   for(i = 0; i < 10; i+=1)
   {
    if(done == 0 && (posAt+i < string_length(temp)) )
    {
    char = string_char_at(temp,posAt+i);
    show_message(char)
    if(char != '"')
    {output =char}
    else
    {done = 1;}
    output = string_digits(output)
    output = real(output)
    }
   }
   show_message(output)
   //global.numOfPlayers
