extends CardState


func enter() -> void:
	if not card.is_node_ready():
		await card.ready
	
	if card.tween and card.tween.is_running():
		card.tween.kill()
	
	card.panel.set("theme_override_styles/panel", card.BASE_STYLEBOX)
	card.reparent_requested.emit(card)
	card.name_label.text = "BASE"
	# The card will be dragged where it's been clicked on, but in the base state this is zero
	card.pivot_offset = Vector2.ZERO


func on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_mouse"):
		card.pivot_offset = card.get_global_mouse_position() - card.global_position
		transition_requested.emit(self, CardState.State.CLICKED)


func on_mouse_entered() -> void:
	card.panel.set("theme_override_styles/panel", card.HOVER_STYLEBOX)


func on_mouse_exited() -> void:
	card.panel.set("theme_override_styles/panel", card.BASE_STYLEBOX)





