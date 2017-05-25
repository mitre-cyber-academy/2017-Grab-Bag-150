//Init
add_round_key(global.rounds);
shift_rows_right();
sub_bytes_inverse();

//Main loop
for (i = global.rounds-1; i > 0; i -= 1;)
{
    add_round_key(i);
    mix_columns_inverse();
    shift_rows_right();
    sub_bytes_inverse();
}

//Final round
add_round_key(0);
return 1;

