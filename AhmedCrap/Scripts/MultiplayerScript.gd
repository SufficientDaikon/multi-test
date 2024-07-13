extends Node2D
 
var lobby_id = 0
@onready var ms = $MultiplayerSpawner
var peer = SteamMultiplayerPeer.new()

func _ready():
	ms.spawn_function = spawn_level
 
func spawn_level(data):
	var level = (load(data) as PackedScene).instantiate()
	return level


func _on_host_pressed():
	peer.create_lobby(SteamMultiplayerPeer.LOBBY_TYPE_PUBLIC)
	multiplayer.multiplayer_peer = peer
	ms.spawn("res://AhmedCrap/Scenes/level_1.tscn")
 
 
 
func _on_join_pressed():
	peer.create_client("localhost", 135)
	multiplayer.multiplayer_peer = peer
