# TESTABLE FEATURES
PC can move around and can kill an NPC
    Killed NPC drops an item

"g" picks up an item

"c" opens the character menu

"i" opens the inventory
    Items can be dropped

"u" opens the consume menu
    Soul can be selected, opening the submenu
        Soul can be transformed and consumed

## SOULS MECHANIC
__Done__
- Implemented Entity and Components
- Implemented Character Menu to view PC stats/soul, job
    [todo] need to also show which stats form JobComponent match up with the soul integers
- Implemented basic loot system
    Killing an NPC drops a "Soul Jar" item containing their soul.
- Implemented Inventory Menu
    Items may be dropped
- Implemented Soul Consumption Menu
    Souls may be transformed and consumed
    [todo] the consumption menu should show more details of the to-be consumed souls
            inventory will show soul-sum
            consume will show full array + soul-sum


__Next up__
When the soul-matrix is displayed, show the relationship of soul-integer to job-stat.

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