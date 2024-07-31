class_name Hand
extends HBoxContainer


func _ready() -> void:
	for child in get_children():
		# Assign a variable to the current child as a CardUI static type
		var card_ui := child as CardUI
		
		card_ui.parent = self
		
		# Connect the signal to own specified func
		card_ui.reparent_requested.connect(_on_card_ui_reparent_requested)


func _on_card_ui_reparent_requested(child: CardUI) -> void:
	child.reparent(self)
