# DONE
PC can move
PC can't move through walls
Add dummy NPC
PC can't move through units
Enable Bump Attack
    Can kill NPC
Make sprites bigger.

## SOULS MECHANIC
__Done (I think)__
- Implement the Soul object. 

__Current__
I am trying to get the souls-jobs to pair up their stats and values, and have CombatEngine make use of that.
BUG: my Recruit resource is not able to set its own name/description/anything.
        I am clearly doing something wrong with resources.

__Todo__
- UI to view the player stats, including the soul.
- Killed NPCs need to drop a soul-item that can be picked up and consumed
    As a stop-gap, walking over the soul could pick it up and consume it without player input.
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