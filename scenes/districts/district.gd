class_name District
extends Area2D


const SELECTOR_OFFSET := 5


@onready var district_1_area: Area2D = %District1Area
@onready var distric_1_selector: Sprite2D = %Distric1Selector

var contentment: int

var neighbours: Array[District]

var church_level: int


func _on_district_1_area_area_entered(_area: Area2D) -> void:
	distric_1_selector.show()


func _on_district_1_area_area_exited(_area: Area2D) -> void:
	distric_1_selector.hide()

