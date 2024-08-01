class_name Deck
extends HBoxContainer

@export var starting_deck: CardPile

var hand_pile: CardPile
var discard_pile: CardPile
var draw_pile: CardPile


func _ready() -> void:
	for child in get_children():
		# Assign a variable to the current child as a CardUI static type
		var card := child as Card
		
		card.parent = self
		
		# Connect the signal to own specified func
		card.reparent_requested.connect(_on_card_reparent_requested)


func _on_card_reparent_requested(child: Card) -> void:
	child.reparent(self)


#Save starting deck for new runs
func create_instance() -> Node:
	var instance: Stats = Stats.new()
	instance.gov_points = Stats.max_gov_points
	instance.florin = Stats.max_florin
	instance.reset_florin()
	instance.deck = instance.starting_deck.duplicate()
	instance.draw_pile = CardPile.new()
	instance.discard = CardPile.new()
	return instance


