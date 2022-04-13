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
- Implemented Entity and Components
- Implemented Character Menu to view PC stats/soul, job
    [todo] need to also show which stats form JobComponent match up with the soul integers
- Implemented basic loot system
    Killing an NPC drops a "Soul Jar" item containing their soul.
- Implemented Inventory Menu
    Items may be dropped
    [todo] differentiate between different items \\a soul-sum would do this well enough.
- Implemented Soul Consumption Menu
    Souls may be transformed and consumed
    [todo] need to show the end-result of consuming the new soul
    [todo] the consumption menu should show more details of the to-be consumed souls
                inventory will show soul-sum
                consume will show full array + soul-sum

__Not done yet__
Refactor the code so that it is more clean.
    Figure out how and where to put input logic
    Figure out how to sort UI and related systems
Improve UI
    Have titles and boarders in the menus
    Show player stats somewhere

## REFACTOR
Problem-1 ::: I don't want systems to copy any data in order to remember it.

Solution-1 :: Simplest solution is to fetch the player entity each time input is used.
Solution-2 :: Store the active-entity'd ID in the system to be retrieved when needed.

Note-1 :::::: Menu-data can be stored in the menu systems, provided it is not copied.
Note-2 :::::: A lot of the UI data should be populated by signal. The signal sends to the UI menu all the data required.
                This still suggests that input is done such that entity data is emitted with the signal,
                or that I remember entity IDs in the systems

Problem-2 ::: How do I handle UI nodes and UI Systems? Are they the same or different?

Solution-1 :: Make them the same.




# TODO
Enable Ranged Attack
    This is a subset of a proper implementation of skills.
Procedura map generation
Camera that moves and follows PC
Jobs mechanic

# POLISH
Create a proper PositionComponent.
Make all components inherit from a base Component class.
When Debug is toggled, it just hides $Label. In the future, I may want to hide _all_ of Debug. 
Redesign most UI nodes to have buttons, instead of double-clicking everything