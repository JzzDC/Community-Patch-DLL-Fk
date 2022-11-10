-- Spawning and Release
INSERT INTO Improvement_ValidTerrains (ImprovementType, TerrainType) VALUES ('IMPROVEMENT_BARBARIAN_CAMP', 'TERRAIN_SNOW');
UPDATE Defines SET Value = '20' WHERE Name = 'BARBARIAN_CAMP_FIRST_TURN_PERCENT_OF_TARGET_TO_ADD'; -- 2% of eligible tiles will spawn a camp on the initial spawn turn
UPDATE Defines SET Value = '5' WHERE Name = 'BARBARIAN_CAMP_FIRST_TURN_PERCENT_PER_ERA'; -- ... plus 0.5% per era for advanced starts
UPDATE Defines SET Value = '2' WHERE Name = 'BARBARIAN_INITIAL_SPAWN_TURN'; -- Barbarian camps start spawning on this turn
UPDATE Defines SET Value = '2' WHERE Name = 'AI_TACTICAL_BARBARIAN_RELEASE_VARIATION'; -- Barbarian release turn is modified by +/- this number, then scaled with game speed

-- Barbarian Healing
UPDATE Defines SET Value = '10' WHERE Name = 'BALANCE_BARBARIAN_HEAL_RATE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='BARBARIAN_HEAL' AND Value= 1 );
UPDATE Defines SET Value = '15' WHERE Name = 'BALANCE_BARBARIAN_HEAL_RATE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='BARBARIAN_HEAL' AND Value= 2 );

-- Barbarian Promotions
INSERT INTO UnitPromotions
	(Type, Description, Help, Sound, OrderPriority, PortraitIndex, BarbarianOnly, IconAtlas, PediaType, CannotBeChosen, PediaEntry, AllowsEmbarkation, HillsDoubleMove)
VALUES
	('PROMOTION_MARSH_WALKER', 'TXT_KEY_PROMOTION_MARSH_WALKER', 'TXT_KEY_PROMOTION_MARSH_WALKER_HELP', 'AS2D_IF_LEVELUP', 99, 44, 1, 'PROMOTION_ATLAS', 'PEDIA_BARBARIAN', 1, 'TXT_KEY_PROMOTION_MARSH_WALKER', 0, 0),
	('PROMOTION_WHITE_WALKER', 'TXT_KEY_PROMOTION_WHITE_WALKER', 'TXT_KEY_PROMOTION_WHITE_WALKER_HELP', 'AS2D_IF_LEVELUP', 99, 44, 1, 'PROMOTION_ATLAS', 'PEDIA_BARBARIAN', 1, 'TXT_KEY_PROMOTION_WHITE_WALKER', 0, 0),
	('PROMOTION_WOODS_WALKER', 'TXT_KEY_PROMOTION_WOODS_WALKER', 'TXT_KEY_PROMOTION_WOODS_WALKER_HELP', 'AS2D_IF_LEVELUP', 99, 56, 1, 'PROMOTION_ATLAS', 'PEDIA_BARBARIAN', 1, 'TXT_KEY_PROMOTION_WOODS_WALKER', 0, 0),
	('PROMOTION_DESERT_WALKER', 'TXT_KEY_PROMOTION_DESERT_WALKER', 'TXT_KEY_PROMOTION_DESERT_WALKER_HELP', 'AS2D_IF_LEVELUP', 99, 1, 1, 'EXPANSION2_PROMOTION_ATLAS', 'PEDIA_BARBARIAN', 1, 'TXT_KEY_PROMOTION_DESERT_WALKER', 0, 0),
	('PROMOTION_COAST_WALKER', 'TXT_KEY_PROMOTION_COAST_WALKER', 'TXT_KEY_PROMOTION_COAST_WALKER_HELP', 'AS2D_IF_LEVELUP', 99, 22, 1, 'PROMOTION_ATLAS', 'PEDIA_BARBARIAN', 1, 'TXT_KEY_PROMOTION_COAST_WALKER', 1, 0),
	('PROMOTION_HILL_WALKER', 'TXT_KEY_PROMOTION_HILL_WALKER', 'TXT_KEY_PROMOTION_HILL_WALKER_HELP', 'AS2D_IF_LEVELUP', 99, 0, 1, 'EXPANSION2_PROMOTION_ATLAS', 'PEDIA_BARBARIAN', 1, 'TXT_KEY_PROMOTION_HILL_WALKER', 0, 1);

UPDATE Features
SET SpawnLocationUnitFreePromotion = 'PROMOTION_WOODS_WALKER'
WHERE Type = 'FEATURE_FOREST';

UPDATE Features
SET SpawnLocationUnitFreePromotion = 'PROMOTION_WOODS_WALKER'
WHERE Type = 'FEATURE_JUNGLE';

UPDATE Terrains
SET SpawnLocationUnitFreePromotion = 'PROMOTION_DESERT_WALKER'
WHERE Type = 'TERRAIN_DESERT';

UPDATE Terrains
SET SpawnLocationUnitFreePromotion = 'PROMOTION_HILL_WALKER'
WHERE Type = 'TERRAIN_HILL';

UPDATE Terrains
SET SpawnLocationUnitFreePromotion = 'PROMOTION_WHITE_WALKER'
WHERE Type = 'TERRAIN_SNOW';

UPDATE Terrains
SET AdjacentSpawnLocationUnitFreePromotion = 'PROMOTION_COAST_WALKER'
WHERE Type = 'TERRAIN_COAST';

INSERT INTO UnitPromotions_Features
	(PromotionType, FeatureType, DoubleMove)
VALUES
	('PROMOTION_MARSH_WALKER', 'FEATURE_MARSH', 1),
	('PROMOTION_MARSH_WALKER', 'FEATURE_FLOOD_PLAINS', 1),
	('PROMOTION_WOODS_WALKER', 'FEATURE_FOREST', 1),
	('PROMOTION_WOODS_WALKER', 'FEATURE_JUNGLE', 1);

INSERT INTO UnitPromotions_Terrains
	(PromotionType, TerrainType, DoubleMove)
VALUES
	('PROMOTION_WHITE_WALKER', 'TERRAIN_SNOW', 1),
	('PROMOTION_DESERT_WALKER', 'TERRAIN_DESERT', 1);

INSERT INTO UnitPromotions_UnitCombats
	(PromotionType, UnitCombatType)
VALUES
	('PROMOTION_MARSH_WALKER', 'UNITCOMBAT_RECON'),
	('PROMOTION_MARSH_WALKER', 'UNITCOMBAT_ARCHER'),
	('PROMOTION_MARSH_WALKER', 'UNITCOMBAT_MOUNTED'),
	('PROMOTION_MARSH_WALKER', 'UNITCOMBAT_MELEE'),
	('PROMOTION_MARSH_WALKER', 'UNITCOMBAT_SIEGE'),
	('PROMOTION_MARSH_WALKER', 'UNITCOMBAT_GUN'),
	('PROMOTION_MARSH_WALKER', 'UNITCOMBAT_ARMOR'),
	('PROMOTION_MARSH_WALKER', 'UNITCOMBAT_HELICOPTER'),
	('PROMOTION_WHITE_WALKER', 'UNITCOMBAT_RECON'),
	('PROMOTION_WHITE_WALKER', 'UNITCOMBAT_ARCHER'),
	('PROMOTION_WHITE_WALKER', 'UNITCOMBAT_MOUNTED'),
	('PROMOTION_WHITE_WALKER', 'UNITCOMBAT_MELEE'),
	('PROMOTION_WHITE_WALKER', 'UNITCOMBAT_SIEGE'),
	('PROMOTION_WHITE_WALKER', 'UNITCOMBAT_GUN'),
	('PROMOTION_WHITE_WALKER', 'UNITCOMBAT_ARMOR'),
	('PROMOTION_WHITE_WALKER', 'UNITCOMBAT_HELICOPTER'),
	('PROMOTION_WOODS_WALKER', 'UNITCOMBAT_RECON'),
	('PROMOTION_WOODS_WALKER', 'UNITCOMBAT_ARCHER'),
	('PROMOTION_WOODS_WALKER', 'UNITCOMBAT_MOUNTED'),
	('PROMOTION_WOODS_WALKER', 'UNITCOMBAT_MELEE'),
	('PROMOTION_WOODS_WALKER', 'UNITCOMBAT_SIEGE'),
	('PROMOTION_WOODS_WALKER', 'UNITCOMBAT_GUN'),
	('PROMOTION_WOODS_WALKER', 'UNITCOMBAT_ARMOR'),
	('PROMOTION_WOODS_WALKER', 'UNITCOMBAT_HELICOPTER'),
	('PROMOTION_COAST_WALKER', 'UNITCOMBAT_RECON'),
	('PROMOTION_COAST_WALKER', 'UNITCOMBAT_ARCHER'),
	('PROMOTION_COAST_WALKER', 'UNITCOMBAT_MOUNTED'),
	('PROMOTION_COAST_WALKER', 'UNITCOMBAT_MELEE'),
	('PROMOTION_COAST_WALKER', 'UNITCOMBAT_SIEGE'),
	('PROMOTION_COAST_WALKER', 'UNITCOMBAT_GUN'),
	('PROMOTION_COAST_WALKER', 'UNITCOMBAT_ARMOR'),
	('PROMOTION_COAST_WALKER', 'UNITCOMBAT_HELICOPTER'),
	('PROMOTION_DESERT_WALKER', 'UNITCOMBAT_RECON'),
	('PROMOTION_DESERT_WALKER', 'UNITCOMBAT_ARCHER'),
	('PROMOTION_DESERT_WALKER', 'UNITCOMBAT_MOUNTED'),
	('PROMOTION_DESERT_WALKER', 'UNITCOMBAT_MELEE'),
	('PROMOTION_DESERT_WALKER', 'UNITCOMBAT_SIEGE'),
	('PROMOTION_DESERT_WALKER', 'UNITCOMBAT_GUN'),
	('PROMOTION_DESERT_WALKER', 'UNITCOMBAT_ARMOR'),
	('PROMOTION_DESERT_WALKER', 'UNITCOMBAT_HELICOPTER'),
	('PROMOTION_HILL_WALKER', 'UNITCOMBAT_RECON'),
	('PROMOTION_HILL_WALKER', 'UNITCOMBAT_ARCHER'),
	('PROMOTION_HILL_WALKER', 'UNITCOMBAT_MOUNTED'),
	('PROMOTION_HILL_WALKER', 'UNITCOMBAT_MELEE'),
	('PROMOTION_HILL_WALKER', 'UNITCOMBAT_SIEGE'),
	('PROMOTION_HILL_WALKER', 'UNITCOMBAT_GUN'),
	('PROMOTION_HILL_WALKER', 'UNITCOMBAT_ARMOR'),
	('PROMOTION_HILL_WALKER', 'UNITCOMBAT_HELICOPTER');

CREATE TABLE IF NOT EXISTS Civilization_UnitClassOverrides_BarbarianDisabler (UnitClassType_Temp TEXT NOT NULL);

INSERT INTO Civilization_UnitClassOverrides_BarbarianDisabler (UnitClassType_Temp) VALUES
	-- Barbarians cannot spawn the unit classes below!
	-- Civilians
	('UNITCLASS_SETTLER'),
	('UNITCLASS_PIONEER'),
	('UNITCLASS_COLONIST'),
	('UNITCLASS_WORKER'),
	('UNITCLASS_WORKBOAT'),
	('UNITCLASS_CARAVAN'),
	('UNITCLASS_CARGO_SHIP'),
	('UNITCLASS_GREAT_GENERAL'),
	('UNITCLASS_GREAT_ADMIRAL'),
	('UNITCLASS_ARTIST'),
	('UNITCLASS_WRITER'),
	('UNITCLASS_MUSICIAN'),
	('UNITCLASS_SCIENTIST'),
	('UNITCLASS_MERCHANT'),
	('UNITCLASS_ENGINEER'),
	('UNITCLASS_ARCHAEOLOGIST'),
	('UNITCLASS_PROPHET'),
	('UNITCLASS_MISSIONARY'),
	('UNITCLASS_INQUISITOR'),
	('UNITCLASS_SS_COCKPIT'),
	('UNITCLASS_SS_STASIS_CHAMBER'),
	('UNITCLASS_SS_ENGINE'),
	('UNITCLASS_SS_BOOSTER'),

	-- Slingers, since they have a unique Archer
	('UNITCLASS_VP_SLINGER'),

	-- Scouting Line
	('UNITCLASS_PATHFINDER'),
	('UNITCLASS_SCOUT'),
	('UNITCLASS_EXPLORER'),
	('UNITCLASS_COMMANDO'),
	('UNITCLASS_PARATROOPER'),
	('UNITCLASS_MARINE'),
	('UNITCLASS_XCOM_SQUAD'),

	-- Siege Line
	('UNITCLASS_CATAPULT'),
	('UNITCLASS_TREBUCHET'),
	('UNITCLASS_CANNON'),
	('UNITCLASS_FIELD_GUN'),
	('UNITCLASS_ARTILLERY'),
	('UNITCLASS_ROCKET_ARTILLERY'),

	-- Anti-Air Units
	('UNITCLASS_ANTI_AIRCRAFT_GUN'),
	('UNITCLASS_MOBILE_SAM'),

	-- Air Units & Missiles
	('UNITCLASS_TRIPLANE'),
	('UNITCLASS_WWI_BOMBER'),
	('UNITCLASS_FIGHTER'),
	('UNITCLASS_BOMBER'),
	('UNITCLASS_JET_FIGHTER'),
	('UNITCLASS_STEALTH_BOMBER'),
	('UNITCLASS_GUIDED_MISSILE'),
	('UNITCLASS_ATOMIC_BOMB'),
	('UNITCLASS_NUCLEAR_MISSILE'),

	-- Misc.
	('UNITCLASS_CARRIER'),
	('UNITCLASS_HORSE_ARCHER'),
	('UNITCLASS_ASSYRIAN_SIEGE_TOWER');

DELETE FROM Civilization_UnitClassOverrides WHERE CivilizationType = 'CIVILIZATION_BARBARIAN' AND UnitClassType IN (SELECT UnitClassType_Temp FROM Civilization_UnitClassOverrides_BarbarianDisabler);

INSERT INTO Civilization_UnitClassOverrides
	(CivilizationType, UnitClassType, UnitType)
SELECT 'CIVILIZATION_BARBARIAN', UnitClassType_Temp, NULL FROM Civilization_UnitClassOverrides_BarbarianDisabler;

DROP TABLE Civilization_UnitClassOverrides_BarbarianDisabler;

-- Barbarian now can spawn these unit classes
DELETE FROM Civilization_UnitClassOverrides WHERE CivilizationType = 'CIVILIZATION_BARBARIAN' AND UnitClassType IN (
	'UNITCLASS_KNIGHT',
	'UNITCLASS_LANCER',
	'UNITCLASS_TANK',
	'UNITCLASS_ANTI_TANK_GUN',
	'UNITCLASS_MODERN_ARMOR',
	'UNITCLASS_HELICOPTER_GUNSHIP',
	'UNITCLASS_BATTLESHIP',
	'UNITCLASS_SUBMARINE',
	'UNITCLASS_NUCLEAR_SUBMARINE'
);