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


__Current__
Merge redundant "open menu" and "set activity" functions.


__Not done yet__
Show player stats somewhere

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
Redesign most UI nodes to have buttons, instead of double-clicking everything.
    Also allow native kb inputs - I turned this off on ConsumeMenu