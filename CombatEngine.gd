class_name CombatEngine
extends Resource

func physical_combat(attacker: Actor, defender: Actor) -> void:
	var damage_output = attacker.get_stat(Global.Stat.STAT_ATK) - defender.get_stat(Global.Stat.STAT_DEF)
	if damage_output < 0:
		damage_output = 0
	
	if attacker.get_stat(Global.Stat.STAT_SPD) > defender.get_stat(Global.Stat.STAT_SPD) + 5:
		damage_output *= 2
	
	print("Attacker deals ", damage_output, " to defender.")
	defender.reduce_stat(Global.Stat.STAT_HP, damage_output)
	
	if defender.get_stat(Global.Stat.STAT_HP) < 0:
		defender.die()
