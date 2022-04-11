class_name SoulSubComponent


var soul : Array


# The left-most column goes to the far-right.
func rotate_left() -> void:
	for x in range(0, len(soul)):
		# Pop the fist element and push it to the back.
		soul[x].push_back(soul[x].pop_front())


# The right-most column goes to the far-left.
func rotate_right() -> void:
	for x in range(0, len(soul)):
		# Pop the last element, and push it to the front.
		soul[x].push_front(soul[x].pop_back())


# The top-most row goes to the bottom.
func rotate_up() -> void:
	soul.push_back(soul.pop_front())


# The bottom-most row goes to the top.
func rotate_down() -> void:
	soul.push_front(soul.pop_back())




# Merge two souls. ## KEEPING THIS HERE, BUT PROBABLY DOESN'T BELONG HERE
func merge_with(new_soul_component: SoulComponent, soul_component: SoulComponent) -> void:
	var new_soul = new_soul_component.get_soul()
	var soul = soul_component.get_soul()
	for x in range(0, len(new_soul)):
		for y in range(0, len(new_soul[x])):
			soul[x][y] += new_soul[x][y]
	
	soul_component.set_soul(soul)
