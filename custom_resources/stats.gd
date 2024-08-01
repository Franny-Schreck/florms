class_name Stats
extends Node

signal stats_changed

#@onready var florin = $Florin
#@onready var florin_label = %FlorinLabel
#@onready var gov_points = $GovPoints
#@onready var gov_points_label = %GovPointsLabel

var florin_label = "90"
var gov_points_label = "200"

const max_gov_points: int = 20
const max_florin: int = 50
const draw_per_turn: int = 5

var florin: int : set = set_florin
var gov_points: int : set = set_gov_points


func update_stats(stats: Stats) -> void:
	florin_label.text =  str(stats.florin)
	gov_points_label.text = str(stats.gov_points)


func set_florin(value: int) -> void:
	florin = value
	stats_changed.emit()


func reset_florin() -> void:
	self.florin = max_florin


func set_gov_points(value: int) -> void:
	gov_points = clampi(value, 0, 999)
	stats_changed.emit()


func use_gov_points(resource_used : int) -> void:
	if resource_used <= 0:
		return
	self.gov_points -= resource_used


func gain_gov_points(amount: int) -> void:
	self.gov_points += amount







