class_name Stats
extends Resource

signal stats_changed

@export var max_gov_points: int
@export var max_florin: int
@export var draw_per_turn: int

var florin: int : set = set_florin
var gov_points: int : set = set_gov_points


func set_florin(value: int) -> void:
	florin = value
	stats_changed.emit()


func reset_florin() -> void:
	self.florin = max_florin


func can_buy_card(card: Card) -> bool:
	return florin >= card.buy_cost


func set_gov_points(value: int) -> void:
	gov_points = clampi(value, 0, 999)
	stats_changed.emit()


func use_gov_points(resource_used : int) -> void:
	if resource_used <= 0:
		return
	self.gov_points -= resource_used


func gain_gov_points(amount: int) -> void:
	self.gov_points += amount


func can_play_card(card: Card) -> bool:
	return gov_points >= card.play_cost













