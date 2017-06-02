// Sends the most recently created net_data

// Encode the content to JSON
var contentToSend = json_encode(netCurrentData);
// Create the content buffer
var buffer = buffer_create( 1024 , buffer_fixed , 1 );//buffer_create(1, buffer_grow, 1);
buffer_seek(buffer, buffer_seek_start, 0);
buffer_write(buffer, buffer_string, contentToSend);

// Send the content
network_send_raw(netSock, buffer, buffer_get_size(buffer));

// Clean up
buffer_delete(buffer);
ds_map_destroy(netCurrentData);
