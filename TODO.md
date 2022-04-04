# DONE
PC can move
    PC can't move through walls
    PC can't move through units
Enable Bump Attack
    Can kill NPC
ECS-detour
    Refactored some code to be more inline with ECS patterns.
        [TODO] Need to properly implement a PositionComponent.
            This will affect/improve how the MovementSystem detects valid cells.

## SOULS MECHANIC
__Done__
- Implement Actor
    - Implemet Soul, tied into CombatEngine
    - Implement Job
- UI to view PC stats, including soul.

__Current__
- Killed NPCs need to drop a soul-item that can be picked up and consumed
    - Might as well make an inventory to store/consume souls.
    - When a NPC dies, they drop their soul.
        - Emit a signal on death, sending their soul.
        - Need to connect the signal to gamboard, I guess
        - Gameboard needs to create an item
            - I should generalize the Actor into an Entity.
                - Some entities are actors
                - Some entities are items
                - All entities are Node2D with Sprite child nodes

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