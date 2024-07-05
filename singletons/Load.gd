extends Node


func load_game():
	if !FileAccess.file_exists('user://savegame.save'):
		return # no savegame file exists
	
	var save_nodes = get_tree().get_nodes_in_group('Persist')
	for node in save_nodes:
		node.queue_free()
	
	var save_game = FileAccess.open('user://savegame.save', FileAccess.READ)
	while save_game.get_position() < save_game.get_length():
		var json_string = save_game.get_line()
		
		var json = JSON.new()
		
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("Json parse error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue
		
		var node_data = json.get_data()
		
		var new_object = load(node_data["Filename"]).instantiate()
		new_object.name = node_data["Name"]
		get_node(node_data["Parent"]).add_child(new_object)
		new_object.setScore(node_data["Score"])
		
		
