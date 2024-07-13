extends MultiplayerSpawner

@export var playerScene : PackedScene
var players = {}

func _ready():
	spawn_function = SpawnPlayer

	if is_multiplayer_authority():
		spawn(1)
		multiplayer.peer_connected.connect(spawn)
		multiplayer.peer_disconnected.connect(PlayerRemover)
		

func SpawnPlayer(data):
	var player = playerScene.instantiate()
	player.set_multiplayer_authority(data)
	players[data] = player
	return player
	
func PlayerRemover(data):
	players[data].queue_free()
	players.erase(data)
