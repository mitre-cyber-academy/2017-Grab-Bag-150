//Init
add_round_key(0);
//Main loop
for (i = 1; i < global.rounds; i += 1;)
{
    sub_bytes();
    shift_rows_left();
    mix_columns();
    add_round_key(i);
}
//Final round
sub_bytes();
shift_rows_left();
add_round_key(global.rounds);
return 1;

