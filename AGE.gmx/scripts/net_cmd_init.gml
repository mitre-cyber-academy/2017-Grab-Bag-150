// Initializes a command to send to the server.
// Follow calls to this script with net_cmd_add_data to add to the command payload
// arg0 - The name of the command to send

netCurrentData = ds_map_create();
ds_map_add(netCurrentData, 'command', argument0);
return netCurrentData;
