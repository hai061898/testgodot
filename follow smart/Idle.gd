extends State

class_name IdleState
 
func transition():
	if ray_cast.get_collider() == player :
		get_parent().change_state("Follow")
