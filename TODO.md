# DONE
PC can move
    PC can't move through walls
    PC can't move through units
Enable Bump Attack
    Can kill NPC
ECS-detour
    Refactored some code to be more inline with ECS patterns.


## SOULS MECHANIC
__Done__
- Implement Actor
    - Implemet Soul, tied into CombatEngine
    - Implement Job
- UI to view PC stats, including soul.
- Killed NPC drops a soul-item.

__Current__
Implement an inventory allowing entities to pick up items.
    - Probably an InventoryComponent that holds a list of a) entity ids or b) entire entities

__Todo__
- Consuming a soul needs its own UI and controls.
    - A UI to see the result of soul consumption
    - Controls to manipulate how the soul will be consumed
    - Consuming the soul changes the player soul


### SOUL OBJECT
I think at the moment this is just 6 integers wrapped in a matrix. 
I could probably write my own class to handle this though. 

# TODO
Enable Ranged Attack
    This is a subset of a proper implementation of skills.
Procedura map generation
Camera that moves and follows PC
Souls mechanic.
Jobs mechanic.

# POLISH
Ensure that bottom-most sprites are drawn in front of top-most sprites.
Create a proper PositionComponent.
Make all components inherit from a base Component class.
Figure out how to render sprites in the correct order.