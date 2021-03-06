extends EditorPlugin
tool

var editor_interface: EditorInterface = null

var singleton_table = [
	{"singleton_name":"MocapManager", "singleton_path":"res://addons/sar1_mocap_manager/sar1_mocap_manager.gd"},
]

func _init() -> void:
	print("Initialising MocapManager plugin")


func _notification(p_notification: int):
	match p_notification:
		NOTIFICATION_PREDELETE:
			print("Destroying MocapManager plugin")


func get_name() -> String:
	return "Sar1MocapManager"


func _enter_tree() -> void:
	editor_interface = get_editor_interface()

	if ! Engine.is_editor_hint():
		for singleton in singleton_table:
			add_autoload_singleton(singleton["singleton_name"], singleton["singleton_path"])

func _exit_tree() -> void:
	if ! Engine.is_editor_hint():
		for singleton in singleton_table.invert():
			remove_autoload_singleton(singleton["singleton_name"])
