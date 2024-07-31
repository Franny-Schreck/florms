class_name Card
extends Resource

enum Type { NORMAL, UNLAWFUL}

@export_group("Card Attributes")
@export var type: Type
@export var cost: int

@export_group("Card Visuals")
@export var name: String
@export var picture: Texture
@export_multiline var description: String


func effect(district: District) -> Effect:
	Events.card_played.emit(self)
	print("card effect, i am inside card.gd")
	# What is going on?
	return Effect.new()









