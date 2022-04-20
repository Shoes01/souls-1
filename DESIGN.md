# CORE MECHANIC 1 -- SOULS
All Actors have a Soul.
A Soul is 6 integers arranged in a pattern - probably a 2x3 matrix.

The 6 values represent the following stats:
HP  | ATK | DEF
SPD | MAG | RES

HP         :: Health Points
ATK // DEF :: Physical damage and protection
MAG // RES :: Magical  damage and protection
SPD        :: Doubles attack if delta_SPD > 5

When an enemy is killed, their soul can be consumed.
> The arragement of integers can be transformed, but transformations are limited. 
> Consuming a soul simply adds the corresponding values of both souls together. \\should it average them? arithmetic or geometric average?

Skills will consume ability points.
> The player will need a skill to "heal" by moving stat points from one stat to HP.

A Soul is a 6-integer 2x3 matrix. It is the Job that assigns stats to each matrix cell. 
Examples:
Knight
HP  | ATK | DEF
SPD | MAG | RES

Ninja
HP  | RES | SPD
DEF | MAG | ATK

## Radical Idea
The soul is 3x3 matrix. Stats are assigned within it by a Job, but not all cells are assigned to a stat.
Templar Knight of Heroic Deeds
DEF | DEF | DEF
HP  | ATK | RES
SPD | RES | MAG

Knifeguy
HP  | DEF | ATK
    | SPD | RES
    | MAG |

Similar Jobs could have similar-look stat matrices, and this is how things would "feel" different. 
Leveling up could even be tied into the size of the soul. 
> How would mis-matched souls match? Just put a 0 at all the values "outside" the soul?

### Null values
Null ATK and MAG means can't attack
Null DEF or RES means soul-HP is lost directly
Null SPD means enemies move twice per turn (and thus attack twice per turn, and thus hit you 4 times per turn)
Cannot have Null HP.

## The HP problem
HP has to be significantly larger than the other numbers. Otherwise everything will be a OHK.
`Solution:` The player will have a certain amount of HP, and when that value reaches 0, then their soul-HP takes damage.
> "HP" can be bestowed by items. Plate armor : lots of HP, Leather armor : little HP.


> I would love to use the Lancer mechanic where teaching 0 HP means you have to roll a dice and risk losing 1 to n HP, where n is the amount of HP you've lost... but I don't think that can be done with this fluid souls system.

## Spending the Soul
The Soul is currency. 
It is the cost to using a skill. 
> Using a skill will cost "SPD", or "ATK", or something.
If there are Merchants in the game, the player will purchase items using their Soul.
> Because the Job dictates how the Soul is assigned to stats, it doesn't make sense to pay a Merchant using "SPD"
> Instead, the Merchant will ask you to pay using your highest (or lowest, or whatever-est) stat.
>> Perhaps items can be "expensive" by costing your lower stats -- and that you can't pay if it is negative. 

## DEF + RES > HP problem
DEF and RES are better than HP because they don't go down.
To mitigate this, HP should grant armor-HP as well. So even with no items, a player with 5 HP would need to take 5 damage before losing 1 HP. 

# CORE MECHANIC 2 -- JOBS
An Actor will have a Job - like a class... but a job.

A Job will decide how the soul-integers are paired to the stats. 
> Example: NINJA: SPD // ATK // MAG // RES // HP // DEF
> The highest integer in a soul will be assigned to SPD. The lowest to DEF.
>> HP cannot be negative. The player will have to move numbers around until they can switch to this class.

A Job allows a player to use certain items. An item will confer certain skills. A skill can be mastered with use. A mastered skill can be used regardless of Job.
> Example skill: "shield user", "sword user", "fireball", etc.


## Item Slots
I should start with 4 item slots for actors.
Mainhand, Offhand, Body, and Head
## Items
Items will be the typical fantasy affair
## Skills
Skills will be taken from FFTA.
Some skills will allow an Actor to use items that are normally for specific Job holders.
Some skills will grant offensive or defensive skills.
Some skills will grant passive buffs. \\maybe.. this seems to go agaist using your soul to pay for everything
## Skill Mastery
When a skill is mastered, it can be used regardless of Job.

# CORE MECHANIC 3 -- ITEMS
Items are needed to learn skills. Skills are needed to unlock jobs.

An item would have the following properties:
1. Each weapon will affect a fixed list of stats.
    ex: Knife --> ATK
    ex: Sword --> ATK, DEF
    ex: Katana --> SPD, ATK, DEF
    ex: Sword of Amazing --> SPD, ATK, DEF, MAG, RES, HP
2. Each rarity will have a fixed stat-sum.
    ex: Basic items will have a sum of 0
    ex: Rare items will have a sum of 2
3. Each eccentricity will have a fixed spread 
    ex: Boring items will have a (0, 1) spread.
    ex: Hyperbolic items will have a (-2, 4) spread.

I need to be careful that a given item can be generated given a list of stats, stat-sum and eccentricity.

Items will occupy slots.
- Head
- Body
- Mainhand
- Offhand

# CORE MECHANIC 4 -- SKILLS
Skill will be granted by items. Once mastered, the item won't be necessary.
Skills will occupy a slot, just like items do.
Skills will cost stats to use. 

[question] Should skills be grindable, like in Disgaea? 
    If so, then a mastered skill could always be usable, just at a weaker level. Essentially, an item would grant +1 skill, up to a maximum level of X.
    If so, then each unique item granting the same skill should grant a new level for it. If Knife and Sword each grant slash, then mastering both items would give you Slash+2.

    More levels in a skill would increase its effect, but not reduce costs.

# META MECHANIC -- PROGRESSION
There is no XP or Levels.
A player will progress by learning new skills and by increasing their soul-sum.