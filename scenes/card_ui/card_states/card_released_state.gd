extends CardState

var played: bool

func enter() -> void:
	#card_ui.name_label.text = "RELEASED"
	
	played = false
	
	if card.target != null:
		played = true
		card.play()


func on_input(_event: InputEvent) -> void:
	if played:
		return
	
	transition_requested.emit(self, CardState.State.BASE)





