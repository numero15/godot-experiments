tool
extends EditorImportPlugin

var dialogues_directory = "res://text/dialogue assets"
var dialogue_sources_directory = "res://text/sources"

func _init():
	pass

func import(source_file, save_path, options, r_platform_variants, r_gen_files):
	if source_file.get_base_dir() != dialogue_sources_directory:
		return
	
	var file = File.new()
	var err = file.open(source_file, File.READ)
	if err != OK:
		return err
	
	var split = source_file.get_basename().split("/")
	var filename = split[split.size()-1]
	
	var text = file.get_as_text()
	var dict = parse_json(text)
	file.close()
	
	
	var dialogue = DDDialogue.new()
	dialogue.init(dict[0])
	
	var path = "%s/%s.%s" % [dialogues_directory, filename, get_save_extension()]
	var ret = ResourceSaver.save(path, dialogue)
	
	return ret

func get_importer_name():
	return "dd.dialogue"

func get_visible_name():
	return "Designed dialogue"

func get_recognized_extensions():
	return ["json"]

func get_save_extension():
	return "tres"

func get_resource_type():
	return "DDDialogue"

func get_import_options(preset):
	return []

func get_preset_count():
	return 0
