class_name Card
extends Control

signal reparent_requested(which_card: Card)
signal card_played(card_id: String)

const BASE_STYLEBOX := preload("res://scenes/card_ui/card_base_stylebox.tres")
const DRAG_STYLEBOX := preload("res://scenes/card_ui/card_dragging_stylebox.tres")
const HOVER_STYLEBOX := preload("res://scenes/card_ui/card_hover_stylebox.tres")

enum Type { NORMAL, UNLAWFUL }


@export_group("Card Attributes")
@export var type: Type
@export var cost: int

@export_group("Card Visuals")
@export var card_name: String
@export var image: Texture
@export_multiline var description: String

@onready var cost_node: Label = $CostDisplay/CostLabel
@onready var card_name_node: Label = $CardName/NameLabel
@onready var image_node: TextureRect = $CardImage
@onready var description_node: Label = $CardDescription

@onready var panel: Panel = $Panel

@onready var card_state_machine: CardStateMachine = $CardStateMachine as CardStateMachine
@onready var drop_point_detector: Area2D = $DropPointDetector
@onready var target: Node = null

var parent: Control
var tween: Tween



func _ready() -> void:
	card_state_machine.init(self)


func _input(event: InputEvent) -> void:
	card_state_machine.on_input(event)


func animate_to_position(new_position: Vector2, duration: float) -> void:
	tween = create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "global_position", new_position, duration)


func play() -> void:
	#if not card:
		#return
	#
	#card.play(targets, stats)
	#queue_free()
	pass


func _on_gui_input(event: InputEvent) -> void:
	card_state_machine.on_gui_input(event)


func _on_mouse_entered() -> void:
	card_state_machine.on_mouse_entered()


func _on_mouse_exited() -> void:
	card_state_machine.on_mouse_exited()


func _on_drop_point_detector_area_entered(area: Area2D) -> void:
	target = area


func _on_drop_point_detector_area_exited(area: Area2D) -> void:
	target = null


