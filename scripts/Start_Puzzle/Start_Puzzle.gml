///@arg cell_size,cell_width,cell_height
var cell_size = argument0;
var cell_width = argument1;
var cell_height = argument2;

var start_pos = irandom_range((cell_width/2)-2, (cell_width/2)+2);

instance_create_layer(start_pos * cell_size, cell_height * cell_size, "Puzzle_Piece", obj_puzzle_player);
instance_create_layer(start_pos * cell_size, cell_height * cell_size, "Puzzle_Board", obj_starting_point);

instance_create_layer(irandom_range((cell_width/2)-3, (cell_width/2)+3) * cell_size, irandom_range(1, 2) * cell_size, "Puzzle_Board", obj_goal);

var firewall_quantity = irandom_range(1, 5);

for (var i = 0; i < firewall_quantity; i++) {
	var firewall_x_pos = irandom_range(1, cell_width) * cell_size;
	var firewall_y_pos = irandom_range(1, cell_height) * cell_size;
	
	if (!place_meeting(firewall_x_pos, firewall_y_pos, obj_puzzle_player) && !place_meeting(firewall_x_pos, firewall_y_pos, obj_goal)) {
		instance_create_layer(firewall_x_pos, firewall_y_pos, "Puzzle_Piece", obj_firewall);
	}
}