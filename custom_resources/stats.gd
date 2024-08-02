class_name Stats
extends Node

signal stats_changed

@onready var florin = %FlorinLabel
@onready var gov_points = %GovPointsLabel

const max_gov_points: int = 20
const max_florin: int = 50
const draw_per_turn: int = 5



func set_florin(value: int) -> void:
	florin.text = str(value)
	stats_changed.emit()


func reset_florin() -> void:
	florin.text = str(max_florin)


func set_gov_points(value: int) -> void:
	gov_points.text = str(clampi(value, 0, 999))
	stats_changed.emit()


func use_gov_points(value : int) -> void:
	if value <= 0:
		return
	gov_points.text = str(int(gov_points.text) - value)


func gain_gov_points(value: int) -> void:
	gov_points.text = str(clampi(int(gov_points.text) + value, 0, 999))







