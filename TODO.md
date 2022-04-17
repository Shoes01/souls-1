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

# TODO
Items/equipment
Skills
    Granted by items/equipment
    Can be mastered and used without the item/equipment
    Skills will cost stat points
    Skill_1 : decrease all stats by 1, increase on stat by 4.
Jobs
    Can switch jobs if requirements are met
        Requirements could be based on skills, or based on the soul
HP-Armor
    When HP-Armor reaches 0, the entity loses one HP, and then regains all their HP-Armor.
Procedura map generation
Camera
Enemy AI
    Basic zombie-style chase AI

# POLISH
Create a proper PositionComponent.
Make all components inherit from a base Component class.
When Debug is toggled, it just hides $Label. In the future, I may want to hide _all_ of Debug. 
Redesign most UI nodes to have buttons, instead of double-clicking everything.
    Also allow native kb inputs - I turned this off on ConsumeMenu
Create a custom Menu node with the open/close and setget actviate functions

# ISSUES
ItemList cannot use \n characters, so I can't show the entire soul-matrix in the list of souls.