class_name CombatEngine
extends Resource

func physical_combat(attacker: Actor, defender: Actor) -> void:
	var damage_output = attacker.attack - defender.defense
	if damage_output < 0:
		damage_output = 0
	
	if attacker.speed > defender.speed + 5:
		damage_output *= 2
	
	print("Attacker deals ", damage_output, " to defender.")
	defender.hp -= damage_output
	
	if defender.hp < 0:
		defender.hp = 0
		defender.die()
