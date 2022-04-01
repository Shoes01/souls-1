# DONE
PC can move
    PC can't move through walls
    PC can't move through units
Enable Bump Attack
    Can kill NPC


## SOULS MECHANIC
__Done__
- Implement Actor
    - Implemet Soul, tied into CombatEngine
    - Implement Job

__Current__
- UI to view PC stats, including soul.

__Todo__
- Killed NPCs need to drop a soul-item that can be picked up and consumed
    > As a stop-gap, walking over the soul could pick it up and consume it without player input.
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