extends State

class_name FollowState
 
func transition():
	if ray_cast.get_collider() != player :
		get_parent().change_state("Idle")

 
func enter():
	super.enter()
	owner.set_physics_process(true)
 
func exit():
	super.exit()
	owner.set_physics_process(false)
