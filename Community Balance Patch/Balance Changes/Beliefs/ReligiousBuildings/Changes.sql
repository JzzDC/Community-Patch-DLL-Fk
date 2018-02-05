-- Flavor Deletion
DELETE FROM Building_Flavors
WHERE BuildingType = 'BUILDING_MOSQUE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

DELETE FROM Building_Flavors
WHERE BuildingType = 'BUILDING_CATHEDRAL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

DELETE FROM Building_Flavors
WHERE BuildingType = 'BUILDING_PAGODA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

-- Mosque

DELETE FROM Building_YieldChanges
WHERE BuildingType = 'BUILDING_MOSQUE' AND YieldType = 'YIELD_CULTURE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Building_YieldChanges
SET Yield = '3'
WHERE BuildingType = 'BUILDING_MOSQUE' AND YieldType = 'YIELD_FAITH' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Buildings
SET GreatWorkSlotType = 'GREAT_WORK_SLOT_LITERATURE'
WHERE Type = 'BUILDING_MOSQUE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Buildings
SET GreatWorkCount = '1'
WHERE Type = 'BUILDING_MOSQUE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Buildings
SET ReligiousPressureModifier = '25'
WHERE Type = 'BUILDING_MOSQUE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Buildings
SET Happiness = '0'
WHERE Type = 'BUILDING_MOSQUE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Buildings
SET ConversionModifier = '-10'
WHERE Type = 'BUILDING_MOSQUE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Buildings 
SET Help = 'TXT_KEY_BUILDING_MOSQUE_HELP'
WHERE Type = 'BUILDING_MOSQUE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_CITY_HAPPINESS' AND Value= 1 );

-- Cathedral

DELETE FROM Building_YieldChanges
WHERE BuildingType = 'BUILDING_CATHEDRAL' AND YieldType = 'YIELD_CULTURE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Building_YieldChanges
SET Yield = '2'
WHERE BuildingType = 'BUILDING_CATHEDRAL' AND YieldType = 'YIELD_FAITH' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Buildings
SET Happiness = '0'
WHERE Type = 'BUILDING_CATHEDRAL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Buildings
SET ReligiousPressureModifier = '25'
WHERE Type = 'BUILDING_CATHEDRAL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Buildings
SET ConversionModifier = '-10'
WHERE Type = 'BUILDING_CATHEDRAL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Buildings 
SET Help = 'TXT_KEY_BUILDING_CATHEDRAL_HELP'
WHERE Type = 'BUILDING_CATHEDRAL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_CITY_HAPPINESS' AND Value= 1 );

-- Pagoda

DELETE FROM Building_YieldChanges
WHERE BuildingType = 'BUILDING_PAGODA';

UPDATE Buildings
SET GreatWorkSlotType = 'GREAT_WORK_SLOT_ART_ARTIFACT'
WHERE Type = 'BUILDING_PAGODA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Buildings
SET GreatWorkCount = '1'
WHERE Type = 'BUILDING_PAGODA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Buildings
SET Happiness = '0'
WHERE Type = 'BUILDING_PAGODA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_RELIGION' AND Value= 1 );

UPDATE Buildings 
SET Help = 'TXT_KEY_BUILDING_PAGODA_HELP'
WHERE Type = 'BUILDING_PAGODA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_CITY_HAPPINESS' AND Value= 1 );

-- New Building Yields

INSERT INTO Building_WLTKDYieldMod
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_SYNAGOGUE', 'YIELD_SCIENCE', 15);

INSERT INTO Building_YieldModifiers
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_MANDIR', 'YIELD_FOOD', 10);

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_STUPA', 'YIELD_FAITH', 3),
	('BUILDING_STUPA', 'YIELD_GOLDEN_AGE_POINTS', 3),
	('BUILDING_STUPA', 'YIELD_TOURISM', 5),
	('BUILDING_CHURCH', 'YIELD_FAITH', 4),
	('BUILDING_MANDIR', 'YIELD_FAITH', 3),
	('BUILDING_MANDIR', 'YIELD_FOOD', 2),
	('BUILDING_SYNAGOGUE', 'YIELD_FAITH', 2),
	('BUILDING_SYNAGOGUE', 'YIELD_PRODUCTION', 3),
	('BUILDING_MOSQUE', 'YIELD_SCIENCE', 2),
	('BUILDING_CATHEDRAL', 'YIELD_GOLD', 2),
	('BUILDING_ORDER', 'YIELD_FAITH', 2);

INSERT INTO Building_YieldChangesPerReligion
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_PAGODA', 'YIELD_FOOD', 100),
	('BUILDING_PAGODA', 'YIELD_GOLD', 100),
	('BUILDING_PAGODA', 'YIELD_CULTURE', 100),
	('BUILDING_PAGODA', 'YIELD_SCIENCE', 100),
	('BUILDING_PAGODA', 'YIELD_FAITH', 100),
	('BUILDING_PAGODA', 'YIELD_PRODUCTION', 100);

INSERT INTO Building_GoldenAgeYieldMod
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_MOSQUE', 'YIELD_CULTURE', 20);

INSERT INTO Building_ImprovementYieldChanges
	(BuildingType, ImprovementType, YieldType, Yield)
VALUES
	('BUILDING_CATHEDRAL', 'IMPROVEMENT_FARM', 'YIELD_GOLD', 1),
	('BUILDING_CATHEDRAL', 'IMPROVEMENT_PASTURE', 'YIELD_GOLD', 1),
	('BUILDING_CATHEDRAL', 'IMPROVEMENT_QUARRY', 'YIELD_GOLD', 1);

INSERT INTO Building_Flavors
	(BuildingType, FlavorType, Flavor)
VALUES
	('BUILDING_STUPA', 'FLAVOR_RELIGION', 8),
	('BUILDING_STUPA', 'FLAVOR_CULTURE', 4),
	('BUILDING_CHURCH', 'FLAVOR_RELIGION', 10),
	('BUILDING_CHURCH', 'FLAVOR_CULTURE', 4),
	('BUILDING_MANDIR', 'FLAVOR_RELIGION', 4),
	('BUILDING_MANDIR', 'FLAVOR_GROWTH', 6),
	('BUILDING_MANDIR', 'FLAVOR_CULTURE', 4),
	('BUILDING_MANDIR', 'FLAVOR_ESPIONAGE', 2),
	('BUILDING_SYNAGOGUE', 'FLAVOR_RELIGION', 4),
	('BUILDING_SYNAGOGUE', 'FLAVOR_PRODUCTION', 6),
	('BUILDING_SYNAGOGUE', 'FLAVOR_CULTURE', 6),
	('BUILDING_SYNAGOGUE', 'FLAVOR_SCIENCE', 4),
	('BUILDING_ORDER', 'FLAVOR_RELIGION', 6),
	('BUILDING_ORDER', 'FLAVOR_OFFENSE', 4),
	('BUILDING_ORDER', 'FLAVOR_DEFENSE', 4),
	('BUILDING_ORDER', 'FLAVOR_MILITARY_TRAINING', 6),
	('BUILDING_CATHEDRAL', 'FLAVOR_RELIGION', 4),
	('BUILDING_CATHEDRAL', 'FLAVOR_CULTURE', 4),
	('BUILDING_CATHEDRAL', 'FLAVOR_GOLD', 8),
	('BUILDING_MOSQUE', 'FLAVOR_RELIGION', 4),
	('BUILDING_MOSQUE', 'FLAVOR_CULTURE', 8),
	('BUILDING_MOSQUE', 'FLAVOR_SCIENCE', 4),
	('BUILDING_PAGODA', 'FLAVOR_RELIGION', 4),
	('BUILDING_PAGODA', 'FLAVOR_CULTURE', 4),
	('BUILDING_PAGODA', 'FLAVOR_PRODUCTION', 4);

INSERT INTO Building_DomainFreeExperiences
	(BuildingType, DomainType, Experience)
VALUES
	('BUILDING_ORDER', 'DOMAIN_LAND', 15);