class_name Card
extends Resource

enum Type { NORMAL, UNLAWFUL}

@export_group("Card Attributes")
#@export var id: String
@export var type: Type
@export var cost: int

@export_group("Card Visuals")
@export var name: String
@export var picture: Texture
@export_multiline var description: String


func effect(district: District) -> Effect:
	Events.card_played.emit(self)
	print("card effect, i am inside card.gd")
	return Effect.new()

#func play(target: District, stats: Stats) -> void:
	#Events.card_played.emit(self)
	##stats.gov_points -= cost
	##apply_effects(tree.get_nodes_in_group("disctricts"))
#
#
#func apply_effects(_targets: Array[Node]) -> void:
	#print("i am inside card.gd")
	#pass









