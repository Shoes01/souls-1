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
- Implement Entity and Components
- UI to view PC stats, including soul. 
    [todo] need to also show which stats form JobComponent match up with the soul integers
- Killed NPC drops a soul-item.
- Implemented Inventory
    [todo] implement soul-consume system
    [todo] differentiate between different items
- Implemented Soul Cosumption 
    [todo] need to improve the UI to make it more clear what is happening

__Not done yet__
Refactor the code so that it is more clean.
    Figure out how and where to put input logic
    Figure out how to sort UI and related systems

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
When Debug is toggled, it just hides $Label. In the future, I may want to hide _all_ of Debug. 