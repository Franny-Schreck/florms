class_name Deck
extends Node

@export var starting_deck: CardPile

var hand_pile: CardPile
var discard_pile: CardPile
var draw_pile: CardPile



 ##Save starting deck for new runs
#func create_instance() -> Resource:
	#var instance: Stats = self.duplicate()
	#instance.gov_points = max_gov_points
	#instance.florin = max_florin
	#instance.reset_florin()
	#instance.deck = instance.starting_deck.duplicate()
	#instance.draw_pile = CardPile.new()
	#instance.discard = CardPile.new()
	#return instance
