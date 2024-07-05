extends Node

func save_game():
	var save_file = FileAccess.open('user://savegame.save', FileAccess.WRITE)
	var save_nodes = get_tree().get_nodes_in_group('Persist')
	
	for node in save_nodes:
		
		if node.scene_file_path.is_empty():
			print("Node not in scene, so nothing to save here")
			continue
		
		if !node.has_method('save'):
			print("Node does not have a save method, so skipping this node")
			continue
		
		var node_data = node.call('save')
		
		var json_string = JSON.stringify(node_data)
		
		save_file.store_line(json_string)
