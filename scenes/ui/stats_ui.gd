class_name StatsUI
extends HBoxContainer

@onready var florin = $Florin
@onready var florin_label = %FlorinLabel
@onready var gov_points = $GovPoints
@onready var gov_points_label = %GovPointsLabel


func update_stats(stats: Stats) -> void:
	florin_label.text =  str(stats.florin)
	gov_points_label.text = str(stats.gov_points)







