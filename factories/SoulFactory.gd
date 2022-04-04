class_name SoulFactory


func make_soul(rows: int, columns: int) -> Script:
	var soul: Script = load("res://components/SoulComponent.gd").new()
	var soul_array: Array = []
	
	for x in range(0, rows):
		soul_array.append([])
		for _y in range(0, columns):
			soul_array[x].append(0)
	
	soul.set_soul(soul_array)
	return soul
