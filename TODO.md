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
    [todo] view inventory
    [todo] drop items
- Implemented broken Inventory UI lmao
    [todo] fix how items are displayed
    [todo] allow the user to interact with items

__Current__
Fix render order problem

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