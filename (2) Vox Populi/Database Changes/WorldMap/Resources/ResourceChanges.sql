-- Improvements for new resources
INSERT INTO Improvement_ResourceTypes
	(ImprovementType, ResourceType)
VALUES
	('IMPROVEMENT_PLANTATION', 'RESOURCE_COFFEE'),
	('IMPROVEMENT_PLANTATION', 'RESOURCE_TEA'),
	('IMPROVEMENT_PLANTATION', 'RESOURCE_TOBACCO'),
	('IMPROVEMENT_PLANTATION', 'RESOURCE_OLIVE'),
	('IMPROVEMENT_PLANTATION', 'RESOURCE_PERFUME'),
	('IMPROVEMENT_QUARRY', 'RESOURCE_AMBER'),
	('IMPROVEMENT_QUARRY', 'RESOURCE_JADE'),
	('IMPROVEMENT_QUARRY', 'RESOURCE_LAPIS'),
	('IMPROVEMENT_FISHING_BOATS', 'RESOURCE_CORAL'),
	('IMPROVEMENT_FARM', 'RESOURCE_MAIZE'),
	('IMPROVEMENT_FARM', 'RESOURCE_RICE'),
	('IMPROVEMENT_PLANTATION', 'RESOURCE_NUTMEG'),
	('IMPROVEMENT_PLANTATION', 'RESOURCE_CLOVES'),
	('IMPROVEMENT_PLANTATION', 'RESOURCE_PEPPER');

-- Uranium is improved by quarry not mine
UPDATE Improvement_ResourceTypes
SET ImprovementType = 'IMPROVEMENT_QUARRY'
WHERE ResourceType = 'RESOURCE_URANIUM' AND ImprovementType = 'IMPROVEMENT_MINE';

-- No need for these; GPTI connects resources by default
DELETE FROM Improvement_ResourceTypes
WHERE ImprovementType IN (
	SELECT Type FROM Improvements
	WHERE CreatedByGreatPerson = 1 AND BuildableOnResources = 1
);

-- Update Sugar art
UPDATE Resources
SET ArtDefineTag = 'ART_DEF_RESOURCE_SUGAR_ALT'
WHERE Type = 'RESOURCE_SUGAR';

UPDATE Resources
SET ArtDefineTag = 'ART_DEF_RESOURCE_NUTMEG'
WHERE Type = 'RESOURCE_NUTMEG';

UPDATE Resources
SET ArtDefineTag = 'ART_DEF_RESOURCE_CLOVES'
WHERE Type = 'RESOURCE_CLOVES';

UPDATE Resources
SET ArtDefineTag = 'ART_DEF_RESOURCE_PEPPER'
WHERE Type = 'RESOURCE_PEPPER';

UPDATE Resources
SET ArtDefineTag = 'ART_DEF_RESOURCE_ALL'
WHERE Type = 'RESOURCE_JEWELRY';

UPDATE Resources
SET ArtDefineTag = 'ART_DEF_RESOURCE_ALL'
WHERE Type = 'RESOURCE_PORCELAIN';

-- Stone good for Ancient and Classical wonders
UPDATE Resources
SET WonderProductionMod = 10, WonderProductionModObsoleteEra = 'ERA_MEDIEVAL'
WHERE Type = 'RESOURCE_STONE';

-- Marble good for Ancient through Renaissance wonders
UPDATE Resources
SET WonderProductionMod = 15, WonderProductionModObsoleteEra = 'ERA_INDUSTRIAL'
WHERE Type = 'RESOURCE_MARBLE';

-- No need for horses anymore after Agribusiness, Landship and Light Tank
UPDATE Resources
SET TechObsolete = 'TECH_ROCKETRY'
WHERE Type = 'RESOURCE_HORSE';

-- Artistry finisher reveals hidden artifacts
UPDATE Resources
SET PolicyReveal = 'POLICY_AESTHETICS_FINISHER'
WHERE Type = 'RESOURCE_HIDDEN_ARTIFACTS';

--------------------------------------------------------------------------------------------
-- Resource building boosts (putting it here since it makes more sense tied to resources)
-- Using BuildingClass, uniques may update it again later
--------------------------------------------------------------------------------------------
CREATE TEMP TABLE BuildingClass_ResourceYieldChanges (
	BuildingClass TEXT,
	ResourceType TEXT,
	YieldType TEXT,
	Yield INTEGER
);

INSERT INTO BuildingClass_ResourceYieldChanges
VALUES
	-- Bonus
	('BUILDINGCLASS_STONE_WORKS', 'RESOURCE_STONE', 'YIELD_PRODUCTION', 2),
	('BUILDINGCLASS_GRANARY', 'RESOURCE_WHEAT', 'YIELD_FOOD', 1),
	('BUILDINGCLASS_GRANARY', 'RESOURCE_MAIZE', 'YIELD_FOOD', 1),
	('BUILDINGCLASS_GRANARY', 'RESOURCE_RICE', 'YIELD_FOOD', 1),
	('BUILDINGCLASS_GRANARY', 'RESOURCE_BANANA', 'YIELD_FOOD', 1),
	('BUILDINGCLASS_MINT', 'RESOURCE_BANANA', 'YIELD_GOLD', 2),
	('BUILDINGCLASS_LODGE', 'RESOURCE_BISON', 'YIELD_FOOD', 1),
	('BUILDINGCLASS_LODGE', 'RESOURCE_DEER', 'YIELD_FOOD', 1),
	('BUILDINGCLASS_STABLE', 'RESOURCE_COW', 'YIELD_PRODUCTION', 2),
	('BUILDINGCLASS_STABLE', 'RESOURCE_SHEEP', 'YIELD_PRODUCTION', 2),
	-- Strategics
	('BUILDINGCLASS_FORGE', 'RESOURCE_IRON', 'YIELD_PRODUCTION', 1),
	('BUILDINGCLASS_FORGE', 'RESOURCE_IRON', 'YIELD_GOLD', 1),
	('BUILDINGCLASS_STABLE', 'RESOURCE_HORSE', 'YIELD_PRODUCTION', 2),
	('BUILDINGCLASS_FACTORY', 'RESOURCE_COAL', 'YIELD_PRODUCTION', 2),
	('BUILDINGCLASS_FACTORY', 'RESOURCE_COAL', 'YIELD_SCIENCE', 2),
	('BUILDINGCLASS_LABORATORY', 'RESOURCE_OIL', 'YIELD_SCIENCE', 4),
	('BUILDINGCLASS_LABORATORY', 'RESOURCE_ALUMINUM', 'YIELD_SCIENCE', 4),
	('BUILDINGCLASS_LABORATORY', 'RESOURCE_URANIUM', 'YIELD_SCIENCE', 4),
	-- Luxuries
	('BUILDINGCLASS_MARKET', 'RESOURCE_SPICES', 'YIELD_FOOD', 1),
	('BUILDINGCLASS_MARKET', 'RESOURCE_SPICES', 'YIELD_PRODUCTION', 1),
	('BUILDINGCLASS_MARKET', 'RESOURCE_SUGAR', 'YIELD_FOOD', 1),
	('BUILDINGCLASS_MARKET', 'RESOURCE_SUGAR', 'YIELD_GOLD', 1),
	('BUILDINGCLASS_STONE_WORKS', 'RESOURCE_SALT', 'YIELD_GOLD', 2),
	('BUILDINGCLASS_STONE_WORKS', 'RESOURCE_MARBLE', 'YIELD_PRODUCTION', 1),
	('BUILDINGCLASS_STONE_WORKS', 'RESOURCE_MARBLE', 'YIELD_GOLD', 1),
	('BUILDINGCLASS_STONE_WORKS', 'RESOURCE_JADE', 'YIELD_PRODUCTION', 1),
	('BUILDINGCLASS_STONE_WORKS', 'RESOURCE_JADE', 'YIELD_GOLD', 1),
	('BUILDINGCLASS_COLOSSEUM', 'RESOURCE_OLIVE', 'YIELD_FOOD', 1),
	('BUILDINGCLASS_COLOSSEUM', 'RESOURCE_OLIVE', 'YIELD_GOLD', 1),
	('BUILDINGCLASS_COLOSSEUM', 'RESOURCE_PERFUME', 'YIELD_GOLD', 1),
	('BUILDINGCLASS_COLOSSEUM', 'RESOURCE_PERFUME', 'YIELD_CULTURE', 1),
	('BUILDINGCLASS_FORGE', 'RESOURCE_COPPER', 'YIELD_GOLD', 2),
	('BUILDINGCLASS_AMPHITHEATER', 'RESOURCE_DYE', 'YIELD_GOLD', 1),
	('BUILDINGCLASS_AMPHITHEATER', 'RESOURCE_DYE', 'YIELD_CULTURE', 1),
	('BUILDINGCLASS_AMPHITHEATER', 'RESOURCE_SILK', 'YIELD_GOLD', 1),
	('BUILDINGCLASS_AMPHITHEATER', 'RESOURCE_SILK', 'YIELD_CULTURE', 1),
	('BUILDINGCLASS_AMPHITHEATER', 'RESOURCE_LAPIS', 'YIELD_CULTURE', 2),
	('BUILDINGCLASS_CARAVANSARY', 'RESOURCE_TRUFFLES', 'YIELD_GOLD', 2),
	('BUILDINGCLASS_CARAVANSARY', 'RESOURCE_COTTON', 'YIELD_PRODUCTION', 1),
	('BUILDINGCLASS_CARAVANSARY', 'RESOURCE_COTTON', 'YIELD_CULTURE', 1),
	('BUILDINGCLASS_CARAVANSARY', 'RESOURCE_FUR', 'YIELD_PRODUCTION', 1),
	('BUILDINGCLASS_CARAVANSARY', 'RESOURCE_FUR', 'YIELD_GOLD', 1),
	('BUILDINGCLASS_CIRCUS', 'RESOURCE_IVORY', 'YIELD_CULTURE', 3),
	('BUILDINGCLASS_TEMPLE', 'RESOURCE_INCENSE', 'YIELD_GOLD', 1),
	('BUILDINGCLASS_TEMPLE', 'RESOURCE_INCENSE', 'YIELD_CULTURE', 1),
	('BUILDINGCLASS_TEMPLE', 'RESOURCE_WINE', 'YIELD_GOLD', 1),
	('BUILDINGCLASS_TEMPLE', 'RESOURCE_WINE', 'YIELD_CULTURE', 1),
	('BUILDINGCLASS_TEMPLE', 'RESOURCE_AMBER', 'YIELD_GOLD', 1),
	('BUILDINGCLASS_TEMPLE', 'RESOURCE_AMBER', 'YIELD_CULTURE', 1),
	('BUILDINGCLASS_GARDEN', 'RESOURCE_CITRUS', 'YIELD_FOOD', 1),
	('BUILDINGCLASS_GARDEN', 'RESOURCE_CITRUS', 'YIELD_GOLD', 1),
	('BUILDINGCLASS_GARDEN', 'RESOURCE_COCOA', 'YIELD_FOOD', 1),
	('BUILDINGCLASS_GARDEN', 'RESOURCE_COCOA', 'YIELD_GOLD', 1),
	('BUILDINGCLASS_MINT', 'RESOURCE_TEA', 'YIELD_PRODUCTION', 1),
	('BUILDINGCLASS_MINT', 'RESOURCE_TEA', 'YIELD_GOLD', 2),
	('BUILDINGCLASS_MINT', 'RESOURCE_COFFEE', 'YIELD_PRODUCTION', 2),
	('BUILDINGCLASS_MINT', 'RESOURCE_COFFEE', 'YIELD_GOLD', 1),
	('BUILDINGCLASS_MINT', 'RESOURCE_TOBACCO', 'YIELD_GOLD', 3),
	('BUILDINGCLASS_BANK', 'RESOURCE_GEMS', 'YIELD_GOLD', 1),
	('BUILDINGCLASS_BANK', 'RESOURCE_GEMS', 'YIELD_CULTURE', 2),
	('BUILDINGCLASS_BANK', 'RESOURCE_GOLD', 'YIELD_GOLD', 3),
	('BUILDINGCLASS_BANK', 'RESOURCE_SILVER', 'YIELD_PRODUCTION', 1),
	('BUILDINGCLASS_BANK', 'RESOURCE_SILVER', 'YIELD_GOLD', 1),
	('BUILDINGCLASS_BANK', 'RESOURCE_SILVER', 'YIELD_CULTURE', 1),
	-- Uniques
	('BUILDINGCLASS_AMPHITHEATER', 'RESOURCE_BRAZILWOOD', 'YIELD_GOLD', 1),
	('BUILDINGCLASS_AMPHITHEATER', 'RESOURCE_BRAZILWOOD', 'YIELD_CULTURE', 1),
	('BUILDINGCLASS_GARDEN', 'RESOURCE_CLOVES', 'YIELD_CULTURE', 1),
	('BUILDINGCLASS_GARDEN', 'RESOURCE_CLOVES', 'YIELD_FAITH', 1),
	('BUILDINGCLASS_GARDEN', 'RESOURCE_PEPPER', 'YIELD_GOLD', 1),
	('BUILDINGCLASS_GARDEN', 'RESOURCE_PEPPER', 'YIELD_FAITH', 1),
	('BUILDINGCLASS_GARDEN', 'RESOURCE_NUTMEG', 'YIELD_PRODUCTION', 1),
	('BUILDINGCLASS_GARDEN', 'RESOURCE_NUTMEG', 'YIELD_CULTURE', 1);

INSERT INTO Building_ResourceYieldChanges
	(BuildingType, ResourceType, YieldType, Yield)
SELECT DISTINCT
	a.Type, b.ResourceType, b.YieldType, b.Yield
FROM Buildings a, BuildingClass_ResourceYieldChanges b
WHERE a.BuildingClass = b.BuildingClass
ORDER BY a.BuildingClass, a.Type;

DROP TABLE BuildingClass_ResourceYieldChanges;

--------------------------------------------------------------------------------------------
-- Tech reveal
-- Supports the COMMUNITY_CORE_BALANCE_RESOURCE_REVEAL option
--------------------------------------------------------------------------------------------

-- Strategics
UPDATE Resources
SET TechReveal = 'TECH_CHEMISTRY'
WHERE Type = 'RESOURCE_COAL';

UPDATE Resources
SET TechReveal = 'TECH_COMBUSTION'
WHERE Type = 'RESOURCE_OIL';

-- Bonus and luxuries
UPDATE Resources
SET TechReveal = 'TECH_AGRICULTURE'
WHERE Type IN (
	'RESOURCE_WHEAT',
	'RESOURCE_MAIZE',
	'RESOURCE_RICE',
	'RESOURCE_BANANA'
);

UPDATE Resources
SET TechReveal = 'TECH_POTTERY'
WHERE Type = 'RESOURCE_FISH';

UPDATE Resources
SET TechReveal = 'TECH_TRAPPING'
WHERE Type IN (
	'RESOURCE_DEER',
	'RESOURCE_BISON',
	'RESOURCE_FUR'
);

UPDATE Resources
SET TechReveal = 'TECH_THE_WHEEL'
WHERE Type IN (
	'RESOURCE_STONE'
);

UPDATE Resources
SET TechReveal = 'TECH_ANIMAL_HUSBANDRY'
WHERE Type IN (
	'RESOURCE_COW',
	'RESOURCE_SHEEP',
	'RESOURCE_TRUFFLES'
);

UPDATE Resources
SET TechReveal = 'TECH_SAILING'
WHERE Type IN (
	'RESOURCE_WHALE',
	'RESOURCE_PEARLS',
	'RESOURCE_CRAB',
	'RESOURCE_CORAL'
);

UPDATE Resources
SET TechReveal = 'TECH_HORSEBACK_RIDING'
WHERE Type IN (
	'RESOURCE_GOLD',
	'RESOURCE_SILVER',
	'RESOURCE_GEMS',
	'RESOURCE_SILK',
	'RESOURCE_SPICES',
	'RESOURCE_SALT',
	'RESOURCE_SUGAR',
	'RESOURCE_COFFEE',
	'RESOURCE_AMBER',
	'RESOURCE_JADE',
	'RESOURCE_LAPIS'
);

UPDATE Resources
SET TechReveal = 'TECH_CALENDAR'
WHERE Type IN (
	'RESOURCE_DYE',
	'RESOURCE_COTTON',
	'RESOURCE_WINE',
	'RESOURCE_COCOA',
	'RESOURCE_INCENSE',
	'RESOURCE_CITRUS',
	'RESOURCE_OLIVE',
	'RESOURCE_PERFUME'
);

UPDATE Resources
SET TechReveal = 'TECH_MASONRY'
WHERE Type IN (
	'RESOURCE_TEA',
	'RESOURCE_COFFEE',
	'RESOURCE_MARBLE'
);

UPDATE Resources
SET TechReveal = 'TECH_ARCHERY'
WHERE Type IN (
	'RESOURCE_TOBACCO',
	'RESOURCE_IVORY'
);

UPDATE Resources
SET TechReveal = 'TECH_BRONZE_WORKING'
WHERE Type = 'RESOURCE_COPPER';

-- COMMUNITY_CORE_BALANCE_RESOURCE_REVEAL = 0: Reveal all bonus and luxury resources at start
UPDATE Resources
SET TechReveal = NULL
WHERE ResourceClassType IN (
	'RESOURCECLASS_BONUS',
	'RESOURCECLASS_LUXURY'
) AND EXISTS (
	SELECT 1 FROM COMMUNITY
	WHERE Type = 'COMMUNITY_CORE_BALANCE_RESOURCE_REVEAL' AND Value = 0
);

-- COMMUNITY_CORE_BALANCE_RESOURCE_REVEAL = 1: Reveal all luxury resources at start
UPDATE Resources
SET TechReveal = NULL
WHERE ResourceClassType = 'RESOURCECLASS_LUXURY' AND EXISTS (
	SELECT 1 FROM COMMUNITY
	WHERE Type = 'COMMUNITY_CORE_BALANCE_RESOURCE_REVEAL' AND Value = 1
);

-- COMMUNITY_CORE_BALANCE_RESOURCE_REVEAL = 2: Reveal all bonus resources at start
UPDATE Resources
SET TechReveal = NULL
WHERE ResourceClassType = 'RESOURCECLASS_BONUS' AND EXISTS (
	SELECT 1 FROM COMMUNITY
	WHERE Type = 'COMMUNITY_CORE_BALANCE_RESOURCE_REVEAL' AND Value = 2
);

-- COMMUNITY_CORE_BALANCE_RESOURCE_REVEAL = 3: Reveal nothing at start

--------------------------------------------------------------------------------------------
-- Monopolies
--------------------------------------------------------------------------------------------

INSERT INTO Resource_YieldChangeFromMonopoly
	(ResourceType, YieldType, Yield)
VALUES
	('RESOURCE_CRAB', 'YIELD_FOOD', 3),
	('RESOURCE_TRUFFLES', 'YIELD_FOOD', 3),
	('RESOURCE_PEPPER', 'YIELD_FOOD', 3),
	('RESOURCE_IRON', 'YIELD_PRODUCTION', 2),
	('RESOURCE_ALUMINUM', 'YIELD_PRODUCTION', 2),
	('RESOURCE_COTTON', 'YIELD_GOLD', 3),
	('RESOURCE_DYE', 'YIELD_GOLD', 3),
	('RESOURCE_PERFUME', 'YIELD_GOLD', 3),
	('RESOURCE_COAL', 'YIELD_GOLD', 3),
	('RESOURCE_CITRUS', 'YIELD_SCIENCE', 2),
	('RESOURCE_CORAL', 'YIELD_SCIENCE', 2),
	('RESOURCE_HORSE', 'YIELD_SCIENCE', 2),
	('RESOURCE_OIL', 'YIELD_SCIENCE', 2),
	('RESOURCE_SPICES', 'YIELD_CULTURE', 2),
	('RESOURCE_COCOA', 'YIELD_CULTURE', 2),
	('RESOURCE_SILVER', 'YIELD_CULTURE', 2),
	('RESOURCE_BRAZILWOOD', 'YIELD_CULTURE', 2),
	('RESOURCE_INCENSE', 'YIELD_FAITH', 2),
	('RESOURCE_PEARLS', 'YIELD_FAITH', 2),
	('RESOURCE_WINE', 'YIELD_FAITH', 2),
	('RESOURCE_TOBACCO', 'YIELD_FAITH', 2),
	('RESOURCE_GOLD', 'YIELD_GOLDEN_AGE_POINTS', 2),
	('RESOURCE_IVORY', 'YIELD_GOLDEN_AGE_POINTS', 2),
	('RESOURCE_LAPIS', 'YIELD_GOLDEN_AGE_POINTS', 2),
	('RESOURCE_JADE', 'YIELD_GOLDEN_AGE_POINTS', 2);

INSERT INTO Resource_CityYieldModFromMonopoly
	(ResourceType, YieldType, Yield)
VALUES
	('RESOURCE_SALT', 'YIELD_FOOD', 10),
	('RESOURCE_SUGAR', 'YIELD_FOOD', 10),
	('RESOURCE_OLIVE', 'YIELD_FOOD', 10),
	('RESOURCE_COPPER', 'YIELD_PRODUCTION', 10),
	('RESOURCE_COFFEE', 'YIELD_PRODUCTION', 10),
	('RESOURCE_NUTMEG', 'YIELD_PRODUCTION', 10),
	('RESOURCE_SILK', 'YIELD_GOLD', 10),
	('RESOURCE_GEMS', 'YIELD_GOLD', 10),
	('RESOURCE_URANIUM', 'YIELD_SCIENCE', 10),
	('RESOURCE_WHALE', 'YIELD_SCIENCE', 10),
	('RESOURCE_TEA', 'YIELD_CULTURE', 10),
	('RESOURCE_MARBLE', 'YIELD_CULTURE', 10);

UPDATE Resources
SET MonopolyHappiness = 6
WHERE Type IN (
	'RESOURCE_FUR',
	'RESOURCE_AMBER',
	'RESOURCE_CLOVES',
	'RESOURCE_GLASS',
	'RESOURCE_JEWELRY'
);

UPDATE Resources
SET MonopolyGALength = 25
WHERE Type IN (
	'RESOURCE_GOLD',
	'RESOURCE_IVORY',
	'RESOURCE_LAPIS',
	'RESOURCE_JADE'
);

UPDATE Resources
SET MonopolyGALength = 30
WHERE Type = 'RESOURCE_PORCELAIN';

-- Strategic monopolies
UPDATE Resources
SET MonopolyDefenseBonus = 10
WHERE Type = 'RESOURCE_IRON';

UPDATE Resources
SET MonopolyAttackBonus = 10
WHERE Type = 'RESOURCE_HORSE';

UPDATE Resources
SET MonopolyMovementBonus = 1
WHERE Type = 'RESOURCE_COAL';

UPDATE Resources
SET MonopolyXPBonus = 2
WHERE Type = 'RESOURCE_OIL';

UPDATE Resources
SET MonopolyHealBonus = 5
WHERE Type = 'RESOURCE_ALUMINUM';

UPDATE Resources
SET MonopolyAttackBonus = 10
WHERE Type = 'RESOURCE_URANIUM';

-- Monopoly text
UPDATE Resources
SET Help = 'TXT_KEY_RESOURCE_MONOPOLY_YIELD_FOOD'
WHERE Type IN (
	SELECT ResourceType FROM Resource_YieldChangeFromMonopoly
	WHERE YieldType = 'YIELD_FOOD' AND Yield = 3
);

UPDATE Resources
SET Help = 'TXT_KEY_RESOURCE_MONOPOLY_MOD_FOOD'
WHERE Type IN (
	SELECT ResourceType FROM Resource_CityYieldModFromMonopoly
	WHERE YieldType = 'YIELD_FOOD' AND Yield = 10
);

UPDATE Resources
SET Help = 'TXT_KEY_RESOURCE_MONOPOLY_YIELD_PRODUCTION_IRON'
WHERE Type = 'RESOURCE_IRON';

UPDATE Resources
SET Help = 'TXT_KEY_RESOURCE_MONOPOLY_YIELD_PRODUCTION_ALUMINUM'
WHERE Type = 'RESOURCE_ALUMINUM';

UPDATE Resources
SET Help = 'TXT_KEY_RESOURCE_MONOPOLY_MOD_PRODUCTION'
WHERE Type IN (
	SELECT ResourceType FROM Resource_CityYieldModFromMonopoly
	WHERE YieldType = 'YIELD_PRODUCTION' AND Yield = 10
);

UPDATE Resources
SET Help = 'TXT_KEY_RESOURCE_MONOPOLY_YIELD_GOLD'
WHERE Type IN (
	SELECT ResourceType FROM Resource_YieldChangeFromMonopoly
	WHERE YieldType = 'YIELD_GOLD' AND Yield = 3
);

UPDATE Resources
SET Help = 'TXT_KEY_RESOURCE_MONOPOLY_YIELD_GOLD_COAL'
WHERE Type = 'RESOURCE_COAL';

UPDATE Resources
SET Help = 'TXT_KEY_RESOURCE_MONOPOLY_MOD_GOLD'
WHERE Type IN (
	SELECT ResourceType FROM Resource_CityYieldModFromMonopoly
	WHERE YieldType = 'YIELD_GOLD' AND Yield = 10
);

UPDATE Resources
SET Help = 'TXT_KEY_RESOURCE_MONOPOLY_YIELD_SCIENCE'
WHERE Type IN (
	SELECT ResourceType FROM Resource_YieldChangeFromMonopoly
	WHERE YieldType = 'YIELD_SCIENCE' AND Yield = 2
);

UPDATE Resources
SET Help = 'TXT_KEY_RESOURCE_MONOPOLY_YIELD_SCIENCE_HORSE'
WHERE Type = 'RESOURCE_HORSE';

UPDATE Resources
SET Help = 'TXT_KEY_RESOURCE_MONOPOLY_YIELD_SCIENCE_OIL'
WHERE Type = 'RESOURCE_OIL';

UPDATE Resources
SET Help = 'TXT_KEY_RESOURCE_MONOPOLY_MOD_SCIENCE'
WHERE Type IN (
	SELECT ResourceType FROM Resource_CityYieldModFromMonopoly
	WHERE YieldType = 'YIELD_SCIENCE' AND Yield = 10
);

UPDATE Resources
SET Help = 'TXT_KEY_RESOURCE_MONOPOLY_MOD_SCIENCE_URANIUM'
WHERE Type = 'RESOURCE_URANIUM';

UPDATE Resources
SET Help = 'TXT_KEY_RESOURCE_MONOPOLY_YIELD_CULTURE'
WHERE Type IN (
	SELECT ResourceType FROM Resource_YieldChangeFromMonopoly
	WHERE YieldType = 'YIELD_CULTURE' AND Yield = 2
);

UPDATE Resources
SET Help = 'TXT_KEY_RESOURCE_MONOPOLY_MOD_CULTURE'
WHERE Type IN (
	SELECT ResourceType FROM Resource_CityYieldModFromMonopoly
	WHERE YieldType = 'YIELD_CULTURE' AND Yield = 10
);

UPDATE Resources
SET Help = 'TXT_KEY_RESOURCE_MONOPOLY_YIELD_FAITH'
WHERE Type IN (
	SELECT ResourceType FROM Resource_YieldChangeFromMonopoly
	WHERE YieldType = 'YIELD_FAITH' AND Yield = 2
);

UPDATE Resources
SET Help = 'TXT_KEY_RESOURCE_MONOPOLY_HAPPINESS'
WHERE MonopolyHappiness = 6;

UPDATE Resources
SET Help = 'TXT_KEY_RESOURCE_MONOPOLY_GA_LENGTH'
WHERE MonopolyGALength = 25;

-- Exception for Porcelain: +30% length and no tile bonus
UPDATE Resources
SET Help = 'TXT_KEY_RESOURCE_MONOPOLY_GA_LENGTH_ONLY'
WHERE Type = 'RESOURCE_PORCELAIN';

-- Strategic Monopoly text
UPDATE Resources
SET StrategicHelp = 'TXT_KEY_RESOURCE_MONOPOLY_STRAT_HORSE'
WHERE Type = 'RESOURCE_HORSE';

UPDATE Resources
SET StrategicHelp = 'TXT_KEY_RESOURCE_MONOPOLY_STRAT_IRON'
WHERE Type = 'RESOURCE_IRON';

UPDATE Resources
SET StrategicHelp = 'TXT_KEY_RESOURCE_MONOPOLY_STRAT_COAL'
WHERE Type = 'RESOURCE_COAL';

UPDATE Resources
SET StrategicHelp = 'TXT_KEY_RESOURCE_MONOPOLY_STRAT_ALUMINUM'
WHERE Type = 'RESOURCE_ALUMINUM';

UPDATE Resources
SET StrategicHelp = 'TXT_KEY_RESOURCE_MONOPOLY_STRAT_OIL'
WHERE Type = 'RESOURCE_OIL';

UPDATE Resources
SET StrategicHelp = 'TXT_KEY_RESOURCE_MONOPOLY_STRAT_URANIUM'
WHERE Type = 'RESOURCE_URANIUM';

--------------------------------------------------------------------------------------------
-- Plot validation
-- Only used for Civilopedia display in VP, but may be used in modmods and mapscripts
-- Building_ResourcePlotsToPlace table and Plot:CanHaveResource lua method
--------------------------------------------------------------------------------------------

-- TERRAIN_HILL is for display only
INSERT INTO Resource_TerrainBooleans
	(ResourceType, TerrainType)
VALUES
	('RESOURCE_COFFEE', 'TERRAIN_GRASS'),
	('RESOURCE_COFFEE', 'TERRAIN_PLAINS'),
	('RESOURCE_TEA', 'TERRAIN_GRASS'),
	('RESOURCE_TEA', 'TERRAIN_PLAINS'),
	('RESOURCE_TOBACCO', 'TERRAIN_GRASS'),
	('RESOURCE_TOBACCO', 'TERRAIN_PLAINS'),
	('RESOURCE_OLIVE', 'TERRAIN_GRASS'),
	('RESOURCE_OLIVE', 'TERRAIN_PLAINS'),
	('RESOURCE_PERFUME', 'TERRAIN_GRASS'),
	('RESOURCE_PERFUME', 'TERRAIN_PLAINS'),
	('RESOURCE_AMBER', 'TERRAIN_GRASS'),
	('RESOURCE_AMBER', 'TERRAIN_PLAINS'),
	('RESOURCE_AMBER', 'TERRAIN_DESERT'),
	('RESOURCE_AMBER', 'TERRAIN_TUNDRA'),
	('RESOURCE_AMBER', 'TERRAIN_HILL'),
	('RESOURCE_JADE', 'TERRAIN_GRASS'),
	('RESOURCE_JADE', 'TERRAIN_PLAINS'),
	('RESOURCE_JADE', 'TERRAIN_DESERT'),
	('RESOURCE_JADE', 'TERRAIN_TUNDRA'),
	('RESOURCE_JADE', 'TERRAIN_HILL'),
	('RESOURCE_LAPIS', 'TERRAIN_GRASS'),
	('RESOURCE_LAPIS', 'TERRAIN_PLAINS'),
	('RESOURCE_LAPIS', 'TERRAIN_DESERT'),
	('RESOURCE_LAPIS', 'TERRAIN_TUNDRA'),
	('RESOURCE_LAPIS', 'TERRAIN_HILL'),
	('RESOURCE_CORAL', 'TERRAIN_COAST'),
	('RESOURCE_MAIZE', 'TERRAIN_GRASS'),
	('RESOURCE_MAIZE', 'TERRAIN_PLAINS'),
	('RESOURCE_RICE', 'TERRAIN_GRASS'),
	('RESOURCE_SHEEP', 'TERRAIN_TUNDRA'),
	('RESOURCE_NUTMEG', 'TERRAIN_GRASS'),
	('RESOURCE_NUTMEG', 'TERRAIN_PLAINS'),
	('RESOURCE_NUTMEG', 'TERRAIN_DESERT'),
	('RESOURCE_NUTMEG', 'TERRAIN_TUNDRA'),
	('RESOURCE_CLOVES', 'TERRAIN_GRASS'),
	('RESOURCE_CLOVES', 'TERRAIN_PLAINS'),
	('RESOURCE_CLOVES', 'TERRAIN_DESERT'),
	('RESOURCE_CLOVES', 'TERRAIN_TUNDRA'),
	('RESOURCE_PEPPER', 'TERRAIN_GRASS'),
	('RESOURCE_PEPPER', 'TERRAIN_PLAINS'),
	('RESOURCE_PEPPER', 'TERRAIN_DESERT'),
	('RESOURCE_PEPPER', 'TERRAIN_TUNDRA');

CREATE TEMP TABLE ResourceHelper (
	ResourceTypeTemp TEXT,
	TerrainTypeTemp TEXT
);

INSERT INTO ResourceHelper
VALUES
	('RESOURCE_DEER', 'TERRAIN_TUNDRA'),
	('RESOURCE_FUR', 'TERRAIN_SNOW'),
	('RESOURCE_FUR', 'TERRAIN_TUNDRA'),
	('RESOURCE_CITRUS', 'TERRAIN_GRASS'),
	('RESOURCE_CITRUS', 'TERRAIN_PLAINS');

DELETE FROM Resource_TerrainBooleans
WHERE EXISTS (
	SELECT 1 FROM ResourceHelper
	WHERE ResourceTypeTemp = ResourceType
	AND TerrainTypeTemp = TerrainType
);

DELETE FROM ResourceHelper;

INSERT INTO Resource_FeatureBooleans
	(ResourceType, FeatureType)
VALUES
	('RESOURCE_BANANA', 'FEATURE_MARSH'),
	('RESOURCE_RICE', 'FEATURE_MARSH'),
	('RESOURCE_MAIZE', 'FEATURE_FLOOD_PLAINS'),
	('RESOURCE_DEER', 'FEATURE_JUNGLE'),
	('RESOURCE_COAL', 'FEATURE_FOREST'),
	('RESOURCE_NUTMEG', 'FEATURE_JUNGLE'),
	('RESOURCE_NUTMEG', 'FEATURE_FOREST'),
	('RESOURCE_NUTMEG', 'FEATURE_FLOOD_PLAINS'),
	('RESOURCE_CLOVES', 'FEATURE_JUNGLE'),
	('RESOURCE_CLOVES', 'FEATURE_FOREST'),
	('RESOURCE_CLOVES', 'FEATURE_FLOOD_PLAINS'),
	('RESOURCE_PEPPER', 'FEATURE_JUNGLE'),
	('RESOURCE_PEPPER', 'FEATURE_FOREST'),
	('RESOURCE_PEPPER', 'FEATURE_FLOOD_PLAINS');

-- Not to be confused with Resource_TerrainBooleans
INSERT INTO Resource_FeatureTerrainBooleans
	(ResourceType, TerrainType)
VALUES
	('RESOURCE_RICE', 'TERRAIN_GRASS'),
	('RESOURCE_MAIZE', 'TERRAIN_DESERT'),
	('RESOURCE_COAL', 'TERRAIN_GRASS'),
	('RESOURCE_COAL', 'TERRAIN_PLAINS');

INSERT INTO ResourceHelper
VALUES
	('RESOURCE_OIL', 'TERRAIN_PLAINS'),
	('RESOURCE_URANIUM', 'TERRAIN_SNOW'),
	('RESOURCE_DEER', 'TERRAIN_SNOW'),
	('RESOURCE_FUR', 'TERRAIN_GRASS'),
	('RESOURCE_FUR', 'TERRAIN_PLAINS'),
	('RESOURCE_FUR', 'TERRAIN_SNOW'),
	('RESOURCE_SUGAR', 'TERRAIN_PLAINS');

DELETE FROM Resource_FeatureTerrainBooleans
WHERE EXISTS (
	SELECT 1 FROM ResourceHelper
	WHERE ResourceTypeTemp = ResourceType
	AND TerrainTypeTemp = TerrainType
);

DROP TABLE ResourceHelper;

-- Make sure these resources don't spawn on map outside of game start
UPDATE Resources
SET Hills = 0, Flatlands = 0
WHERE Type IN (
	'RESOURCE_PAPER',
	'RESOURCE_GLASS',
	'RESOURCE_JEWELRY',
	'RESOURCE_PORCELAIN'
);

-- Make sure Brazilwood doesn't spawn on map for non-Brazil
UPDATE Resources
SET CivilizationType = 'CIVILIZATION_BRAZIL'
WHERE Type = 'RESOURCE_BRAZILWOOD';

-- Set the order of Strategic Resources on the Top Panel
CREATE TEMP TABLE Helper (
	Priority INTEGER,
	ResourceType TEXT
);

INSERT INTO Helper
VALUES
	(1, 'RESOURCE_HORSE'),
	(2, 'RESOURCE_IRON'),
	(3, 'RESOURCE_COAL'),
	(4, 'RESOURCE_OIL'),
	(5, 'RESOURCE_ALUMINUM'),
	(6, 'RESOURCE_URANIUM'),
	(7, 'RESOURCE_PAPER');

UPDATE Resources
SET StrategicPriority = (SELECT Priority FROM Helper WHERE ResourceType = Type)
WHERE EXISTS (SELECT 1 FROM Helper WHERE ResourceType = Type);

DROP TABLE Helper;
