//Converts string to state grid
str = argument0;
if (string_length(str)!=16) {show_message("String in 'string_to_state' not correct length"); return 0;}
i = 1;
if (string_length(str)!=16) {return "";}
for (xx = 0; xx < global.stateWidth; xx += 1)
{
    for (yy = 0; yy < global.stateHeight; yy += 1)
    {
        ds_grid_set(global.state,xx,yy,ord(string_copy(str,i,1)));
        i += 1;
    }
}
return 1;

