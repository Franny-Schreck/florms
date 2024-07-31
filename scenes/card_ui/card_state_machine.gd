class_name CardStateMachine
extends Node

@export var initial_state: CardState

var current_state: CardState
var states := {}				# Dictionary to store all states


func init(card: CardUI) -> void:
	# Iterate through all children in the state machine
	for child in get_children():
		
		# Check if the current child is a card state
		if child is CardState:
			# If it is, add it to the dictionary all the states
			states[child.state] = child
			# Connect to own function handling transition
			child.transition_requested.connect(_on_transition_requested)
			# Pass the card UI reference to the state itself
			child.card_ui = card
	
	if initial_state:
		initial_state.enter()
		current_state = initial_state

# Call the current state's corresponding callback func
func on_input(event: InputEvent) -> void:
	if current_state:
		current_state.on_input(event)


func on_gui_input(event: InputEvent) -> void:
	if current_state:
		current_state.on_gui_input(event)


func on_mouse_entered() -> void:
	if current_state:
		current_state.on_mouse_entered()


func on_mouse_exited() -> void:
	if current_state:
		current_state.on_mouse_exited()

# Transition from one state to another
func _on_transition_requested(from: CardState, to: CardState.State) -> void:
	# Check if from and current state are equal, otherwise abort!
	if from != current_state:
		return

	# Store a reference to the new state from state-dictionary 
	var new_state: CardState = states[to]
	if not new_state:
		return
	
	if current_state:
		current_state.exit()
	
	new_state.enter()
	current_state = new_state




