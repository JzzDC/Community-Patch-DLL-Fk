---------------------------------------------------------------------------------------------------------------
-- Unit Panel promotions
---------------------------------------------------------------------------------------------------------------

-- Default
UPDATE UnitPromotions SET OrderPriority = 9999, ShowInUnitPanel = 1;

CREATE TEMP TABLE PromotionClass_Orders (
	PromotionClass TEXT,
	OrderNumber INTEGER
);

INSERT INTO PromotionClass_Orders
VALUES
	-- Plagues (should be always shown)
	('BOARDED', 1),
	-- Trunk promotions
	('SHOCK', 101),
	('DRILL', 102),
	('INTERCEPTOR', 104), -- reserve slot for Buffalo
	('BARRAGE', 101),
	('ACCURACY', 102),
	('TANK_HUNTER', 103),
	('HELI_MOBILITY', 104),
	('SIEGE', 101),
	('FIELD', 102),
	('TRAILBLAZER', 101),
	('SURVIVALISM', 102),
	('HULL', 101),
	('BOARDING_PARTY', 102),
	('TARGETING', 101),
	('BOMBARDMENT', 102),
	('TORPEDO', 101),
	('FLIGHT_DECK', 101),
	('ARMOR_PLATING', 109), -- also given to other units
	('ACE_PILOT', 101),
	('DOGFIGHTING', 102),
	('AIR_SUPREMACY', 103),
	('AIR_TARGETING', 101),
	('AIR_SIEGE', 102),
	('AIR_AMBUSH', 103),
	-- Unique unit free promotions
	('BUFFALO', 103),
	('BUSHIDO', 111),
	('MYSTIC_BLADE', 112), -- technically a unit can have both Bushido and Mystic Blade
	-- Building free promotions
	('DIPLO_BOOST', 201),
	-- Leaf promotions
	('FORMATION', 301),
	('COVER', 302),
	('AMBUSH', 303),
	('COASTAL_ARTILLERY', 303),
	('CHARGE', 304),
	('MEDIC', 305),
	('MARCH', 306),
	('AIR_DEFENSE', 307),
	('SENTRY', 308),
	('SPLASH', 301),
	('SCOUTING', 301),
	('NAVIGATOR', 301),
	('AIR_PENETRATION', 301),
	-- Unit free promotions (stays on upgrade)
	('GENERAL_MOVEMENT', 401),
	('SIEGE_ENGINE', 402),
	('WITHDRAW', 403),
	('GENERAL_RATE', 404),
	-- Policy promotions
	('AUTHORITY', 603),
	('IMPERIALISM', 608),
	-- Tech promotions
	('EMBARKATION', 701),
	('FALLOUT_RESISTANCE', 703),
	-- Unit free promotions (lost on upgrade)
	('FIELD_WORKS', 801),
	('COVERING_FIRE', 801),
	('PARADROP', 801),
	('DEPTH_CHARGES', 801),
	('AIR_RECON', 801),
	('SUBMARINE_BASE', 801),
	('DIPLO_BASE', 801),
	('CARGO', 802);

UPDATE UnitPromotions
SET OrderPriority = (SELECT OrderNumber FROM PromotionClass_Orders WHERE PromotionClass = RankList)
WHERE EXISTS (SELECT 1 FROM PromotionClass_Orders WHERE PromotionClass = RankList);

DROP TABLE PromotionClass_Orders;

CREATE TEMP TABLE UnitPromotion_Orders (
	PromotionType TEXT,
	OrderNumber INTEGER
);

INSERT INTO UnitPromotion_Orders
VALUES
	-- Plagues
	('PROMOTION_DAZED', 2),
	('PROMOTION_PRISONER_WAR', 3),
	-- Really important promotions
	('PROMOTION_JUGGERNAUT', 10),
	-- Unique unit free promotions (stays on upgrade)
	('PROMOTION_ADJACENT_BONUS', 113),
	('PROMOTION_SPAWN_GENERALS_I', 115),
	('PROMOTION_SPAWN_GENERALS_II', 116),
	('PROMOTION_KNOCKOUT', 118),
	('PROMOTION_OPEN_TERRAIN', 119),
	('PROMOTION_MOVEMENT_TO_GENERAL', 120),
	('PROMOTION_GENERAL_STACKING', 121),
	('PROMOTION_PARTIAL_HEAL_IF_DESTROY_ENEMY', 122),
	('PROMOTION_HAKKAA_PAALLE', 123),
	('PROMOTION_SCOUT_CAVALRY', 124),
	('PROMOTION_FOREIGN_LANDS', 125),
	('PROMOTION_FASTER_HEAL', 126),
	('PROMOTION_STRONGER_VS_DAMAGED', 127),
	('PROMOTION_ESPRIT_DE_CORPS', 128),
	('PROMOTION_SKI_INFANTRY', 129),
	('PROMOTION_HAKA_WAR_DANCE', 131),
	('PROMOTION_MEDIC_GENERAL', 132),
	('PROMOTION_GAIN_EXPERIENCE', 133),
	('PROMOTION_TRADE_MISSION_BONUS', 134),
	('PROMOTION_HEAVY_CHARGE', 135),
	('PROMOTION_SAPPER', 136),
	('PROMOTION_GOLDEN_AGE_POINTS', 137),
	('PROMOTION_MANY_GOLDEN_AGE_POINTS', 138),
	('PROMOTION_HOMELAND_GUARDIAN', 139),
	('PROMOTION_DEFEND_NEAR_CAPITAL', 140),
	('PROMOTION_MOON_STRIKER', 141),
	('PROMOTION_LIGHTNING_WARFARE', 142),
	('PROMOTION_DOUBLE_PLUNDER', 143),
	('PROMOTION_FLANK_ATTACK_BONUS', 144),
	('PROMOTION_FLANK_ATTACK_BONUS_STRONG', 145),
	('PROMOTION_PRIZE_SHIPS', 146),
	('PROMOTION_ENSLAVEMENT', 147),
	('PROMOTION_RAIDER', 148),
	('PROMOTION_RECON_BANDEIRANTES', 149),
	('PROMOTION_ASSIZE_OF_ARMS', 150),
	('PROMOTION_FOCUS_FIRE', 151),
	('PROMOTION_AOE_STRIKE_ON_KILL', 152),
	('PROMOTION_AOE_STRIKE_FORTIFY', 153),
	('PROMOTION_DOPPELSOLDNER', 154),
	('PROMOTION_SLINGER', 155),
	('PROMOTION_REPEATER', 156),
	('PROMOTION_HEAVY_SHIP', 157),
	('PROMOTION_MOHAWK', 158),
	('PROMOTION_JAGUAR', 158),
	('PROMOTION_MYSTIC_BLADE', 159),
	-- Building free promotions
	('PROMOTION_MORALE', 201),
	('PROMOTION_BUSHIDO', 202),
	('PROMOTION_HIMEJI_CASTLE', 203),
	('PROMOTION_STATUE_ZEUS', 204),
	('PROMOTION_ALHAMBRA', 205),
	('PROMOTION_TREASURE_FLEET', 206),
	('PROMOTION_ARSENALE', 207),
	-- Leaf promotions
	('PROMOTION_SIEGE', 311),
	('PROMOTION_SKIRMISHER_MOBILITY', 311),
	('PROMOTION_SKIRMISHER_POWER', 312),
	('PROMOTION_ENVELOPMENT', 313),
	('PROMOTION_VOLLEY', 311),
	('PROMOTION_FROGMAN', 311),
	('PROMOTION_SCREENING', 312),
	('PROMOTION_BREACHER', 311),
	('PROMOTION_NAVAL_SIEGE', 312),
	('PROMOTION_PRESS_GANGS', 313),
	('PROMOTION_PIRACY', 314),
	('PROMOTION_ENCIRCLEMENT', 315),
	('PROMOTION_MINELAYER', 316),
	('PROMOTION_SEE_INVISIBLE_SUBMARINE', 317),
	('PROMOTION_DAMAGE_REDUCTION', 318),
	('PROMOTION_BETTER_BOMBARDMENT', 311),
	('PROMOTION_ANTI_FIGHTER', 311),
	('PROMOTION_AERIAL_TORPEDO', 312),
	('PROMOTION_BOMB_RACK', 313),
	('PROMOTION_EVASION', 314),
	('PROMOTION_SHOCK_4', 321),
	('PROMOTION_DRILL_4', 322),
	('PROMOTION_BARRAGE_4', 321),
	('PROMOTION_ACCURACY_4', 322),
	('PROMOTION_COASTAL_RAIDER_4', 321),
	('PROMOTION_BOARDING_PARTY_4', 322),
	('PROMOTION_TARGETING_4', 323),
	('PROMOTION_BOMBARDMENT_4', 324),
	('PROMOTION_COASTAL_TERROR', 325), -- Conquistador gets this
	('PROMOTION_TRUE_WOLFPACK', 321),
	('PROMOTION_HUNTER_KILLER', 324),
	('PROMOTION_PREDATOR', 325),
	('PROMOTION_PERISCOPE_DEPTH', 326),
	('PROMOTION_RANGE', 331),
	('PROMOTION_AIR_RANGE', 331),
	('PROMOTION_AMPHIBIOUS', 332),
	('PROMOTION_WOODSMAN', 333),
	('PROMOTION_BLITZ', 334),
	('PROMOTION_LOGISTICS', 334),
	('PROMOTION_AIR_LOGISTICS', 334),
	('PROMOTION_MOBILITY', 335),
	('PROMOTION_SUPPLY', 336),
	-- Unit free promotions (stays on upgrade)
	('PROMOTION_CAN_MOVE_AFTER_ATTACKING', 411),
	('PROMOTION_IGNORE_TERRAIN_COST', 412),
	('PROMOTION_RECON_EXPERIENCE', 413),
	('PROMOTION_OCEAN_CROSSING', 414),
	('PROMOTION_EMBARKED_SIGHT', 415),
	('PROMOTION_SCOUT_XP_PILLAGE', 416),
	('PROMOTION_ATTACK_BONUS', 417),
	('PROMOTION_FREE_PILLAGE_MOVES', 418),
	('PROMOTION_WITHDRAW_BEFORE_MELEE', 419),
	('PROMOTION_SILENT_HUNTER', 420),
	('PROMOTION_CAN_MOVE_IMPASSABLE', 421),
	('PROMOTION_RIVAL_TERRITORY', 422),
	-- Event/Natural Wonder promotions
	('PROMOTION_MORALE_EVENT', 496),
	('PROMOTION_ALTITUDE_TRAINING', 497),
	('PROMOTION_SACRED_STEPS', 498),
	('PROMOTION_EVERLASTING_YOUTH', 499),
	-- Barbarian promotions
	('PROMOTION_HILL_WALKER', 501),
	('PROMOTION_DESERT_WALKER', 502),
	('PROMOTION_WOODS_WALKER', 503),
	('PROMOTION_WHITE_WALKER', 504),
	('PROMOTION_MARSH_WALKER', 505),
	-- Policy promotions
	('PROMOTION_FASTER_WORKER', 602),
	('PROMOTION_NATIONALISM', 611),
	('PROMOTION_FAST_GENERAL', 612),
	('PROMOTION_LIGHTNING_WARFARE_GUN', 612),
	('PROMOTION_LIGHTNING_WARFARE_ARMOR', 612),
	('PROMOTION_MARE_NOSTRUM', 612),
	-- Tech promotions
	('PROMOTION_ICE_BREAKERS', 702),
	-- Trait promotions
	('PROMOTION_MONGOL_TERROR', 794),
	('PROMOTION_VIKING', 795),
	('PROMOTION_LONGBOAT', 795),
	('PROMOTION_COERCION', 796),
	('PROMOTION_ATTACK_BONUS_SWEDEN', 797),
	('PROMOTION_WAR_CANOES', 798),
	('PROMOTION_GOODY_HUT_PICKER', 799),
	-- Unit free promotions (lost on upgrade)
	('PROMOTION_CITY_ASSAULT', 803),
	('PROMOTION_RANGED_SUPPORT_FIRE', 804),
	('PROMOTION_FEARED_ELEPHANT', 805),
	('PROMOTION_BARBARIAN_BONUS', 806),
	('PROMOTION_SKIRMISHER_DOCTRINE', 807),
	('PROMOTION_HOVERING_UNIT', 808),
	('PROMOTION_FLAT_MOVEMENT_COST', 809),
	('PROMOTION_INDIRECT_FIRE', 810),
	('PROMOTION_COMMANDO', 811),
	('PROMOTION_INVISIBLE_SUBMARINE', 812),
	('PROMOTION_AIR_SWEEP', 813),
	('PROMOTION_AIR_MISFIRE', 814),
	('PROMOTION_ANTI_HELICOPTER', 815),
	('PROMOTION_STEALTH', 816),
	('PROMOTION_GREAT_GENERAL', 817),
	('PROMOTION_GREAT_ADMIRAL', 817),
	('PROMOTION_GREAT_DIPLOMAT', 817),
	('PROMOTION_SUPPLY_BOOST', 818),
	('PROMOTION_NUCLEAR_SILO', 819),
	('PROMOTION_MECH', 820),
	('PROMOTION_SELL_EXOTIC_GOODS', 821),
	('PROMOTION_CONSCRIPT', 822),
	('PROMOTION_ANTI_MOUNTED_I', 823),
	-- Penalties
	('PROMOTION_ONLY_ATTACKS_CITIES', 901),
	('PROMOTION_UNWELCOME_EVANGELIST', 901),
	('PROMOTION_CITY_PENALTY', 902),
	('PROMOTION_SMALL_CITY_PENALTY', 902),
	('PROMOTION_BIG_CITY_PENALTY', 902),
	('PROMOTION_OCEAN_HALF_MOVES', 903),
	('PROMOTION_OCEAN_IMPASSABLE_UNTIL_ASTRONOMY', 903),
	('PROMOTION_MUST_SET_UP', 904),
	('PROMOTION_ROUGH_TERRAIN_HALF_TURN', 905),
	('PROMOTION_NAVAL_MISFIRE', 906),
	('PROMOTION_NAVAL_INACCURACY', 906),
	('PROMOTION_NO_DEFENSIVE_BONUSES', 998);

UPDATE UnitPromotions
SET OrderPriority = (SELECT OrderNumber FROM UnitPromotion_Orders WHERE PromotionType = Type)
WHERE EXISTS (SELECT 1 FROM UnitPromotion_Orders WHERE PromotionType = Type);

DROP TABLE UnitPromotion_Orders;

-- don't show these on the unit panel
UPDATE UnitPromotions SET ShowInUnitPanel = 0 WHERE Type IN (
	'PROMOTION_ONLY_DEFENSIVE'
);

---------------------------------------------------------------------------------------------------------------
-- Unit Flag promotions
-- Promotions with the same RankList will be grouped together
---------------------------------------------------------------------------------------------------------------
UPDATE UnitPromotions SET FlagPromoOrder = OrderPriority;

-- There shouldn't be any here, but just in case, put these promotions at the end.
UPDATE UnitPromotions SET FlagPromoOrder = 999 WHERE OrderPriority = 0;

---------------------------------------------------------------------------------------------------------------
-- Promotions which should not be displayed above the Unit Flag
-- Trait- and unit-specific free promotions are already automatically excluded with the respective settings
---------------------------------------------------------------------------------------------------------------

-- Default
UPDATE UnitPromotions SET IsVisibleAboveFlag = 1;

UPDATE UnitPromotions
SET IsVisibleAboveFlag = 0
WHERE Type IN (
	'PROMOTION_EMBARKATION',
	'PROMOTION_FASTER_GENERAL',
	'PROMOTION_FAST_GENERAL',
	'PROMOTION_SIGNET',
	'PROMOTION_EXPRESS',
	'PROMOTION_LITERACY',
	'PROMOTION_IMMUNITY',
	'PROMOTION_PAX',
	'PROMOTION_NOBILITY',
	'PROMOTION_FALLOUT_REDUCTION',
	'PROMOTION_FALLOUT_IMMUNITY',
	'PROMOTION_ICE_BREAKERS',
	'PROMOTION_INSTA_HEAL'
);

---------------------------------------------------------------------------------------------------------------
-- Misc.
---------------------------------------------------------------------------------------------------------------

-- For promos where the title is the same as the Help text
UPDATE UnitPromotions SET SimpleHelpText = 1 WHERE Description = Help;
