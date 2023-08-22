-- No more holy city dependency for Grand Temple

UPDATE Buildings
SET HolyCity = '0'
WHERE Type = 'BUILDING_GRAND_TEMPLE';

UPDATE Buildings
SET ReligiousPressureModifier = '0'
WHERE Type = 'BUILDING_GRAND_TEMPLE';

UPDATE Building_YieldChanges
SET Yield = '6'
WHERE BuildingType = 'BUILDING_GRAND_TEMPLE';

-- New Religious National Wonder Yields

INSERT INTO Building_YieldChanges
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_MAUSOLEUM', 'YIELD_FAITH', 5),
	('BUILDING_HEAVENLY_THRONE', 'YIELD_FAITH', 2),
	('BUILDING_HEAVENLY_THRONE', 'YIELD_FOOD', 2),
	('BUILDING_HEAVENLY_THRONE', 'YIELD_CULTURE', 2),
	('BUILDING_HEAVENLY_THRONE', 'YIELD_SCIENCE', 2),
	('BUILDING_HEAVENLY_THRONE', 'YIELD_PRODUCTION', 2),
	('BUILDING_HEAVENLY_THRONE', 'YIELD_GOLD', 2),
	('BUILDING_GREAT_ALTAR', 'YIELD_FAITH', 5),
	('BUILDING_RELIGIOUS_LIBRARY', 'YIELD_SCIENCE', 4),
	('BUILDING_DIVINE_COURT', 'YIELD_FAITH', 3),
	('BUILDING_SACRED_GARDEN', 'YIELD_FAITH', 3),
	('BUILDING_HOLY_COUNCIL', 'YIELD_FAITH', 4),
	('BUILDING_APOSTOLIC_PALACE', 'YIELD_FAITH', 4),
	('BUILDING_APOSTOLIC_PALACE', 'YIELD_GOLDEN_AGE_POINTS', 4),
	('BUILDING_GRAND_OSSUARY', 'YIELD_FAITH', 10),
	('BUILDING_DIVINE_COURT', 'YIELD_GOLD', 6),
	('BUILDING_HOLY_COUNCIL', 'YIELD_FOOD', 5),
	('BUILDING_SACRED_GARDEN', 'YIELD_CULTURE', 5);

INSERT INTO Building_DomainProductionModifiers
	(BuildingType, DomainType, Modifier)
VALUES
	('BUILDING_GREAT_ALTAR', 'DOMAIN_SEA', 15),
	('BUILDING_GREAT_ALTAR', 'DOMAIN_LAND', 15),
	('BUILDING_GREAT_ALTAR', 'DOMAIN_AIR', 15);

INSERT INTO Building_ThemingBonuses	
		(BuildingType,	Description, Bonus, SameEra, RequiresSamePlayer, AIPriority)
VALUES	('BUILDING_RELIGIOUS_LIBRARY', 'TXT_KEY_THEMING_BONUS_RELIGIOUS_LIBRARY', 8, 0, 1, 2);

INSERT INTO Building_ImprovementYieldChangesGlobal
	(BuildingType, ImprovementType, YieldType, Yield)
VALUES
	('BUILDING_MAUSOLEUM', 'IMPROVEMENT_HOLY_SITE', 'YIELD_FAITH', 5),
	('BUILDING_HEAVENLY_THRONE', 'IMPROVEMENT_HOLY_SITE', 'YIELD_GOLDEN_AGE_POINTS', 5),
	('BUILDING_GREAT_ALTAR', 'IMPROVEMENT_HOLY_SITE', 'YIELD_PRODUCTION', 5),
	('BUILDING_RELIGIOUS_LIBRARY', 'IMPROVEMENT_HOLY_SITE', 'YIELD_SCIENCE', 5),
	('BUILDING_DIVINE_COURT', 'IMPROVEMENT_HOLY_SITE', 'YIELD_CULTURE', 5),
	('BUILDING_SACRED_GARDEN', 'IMPROVEMENT_HOLY_SITE', 'YIELD_FOOD', 5),
	('BUILDING_HOLY_COUNCIL', 'IMPROVEMENT_HOLY_SITE', 'YIELD_SCIENCE', 5),
	('BUILDING_APOSTOLIC_PALACE', 'IMPROVEMENT_HOLY_SITE', 'YIELD_TOURISM', 5),
	('BUILDING_GRAND_OSSUARY', 'IMPROVEMENT_HOLY_SITE', 'YIELD_GOLD', 5);

INSERT INTO Building_YieldFromDeath
	(BuildingType, YieldType, Yield)
VALUES
	('BUILDING_MAUSOLEUM', 'YIELD_FAITH', 30);

-- Religious Authority (CSD)
UPDATE Buildings SET FaithToVotes = '10' WHERE Type = 'BUILDING_MAUSOLEUM';
UPDATE Buildings SET FaithToVotes = '10' WHERE Type = 'BUILDING_HEAVENLY_THRONE';
UPDATE Buildings SET FaithToVotes = '10' WHERE Type = 'BUILDING_GREAT_ALTAR';
UPDATE Buildings SET FaithToVotes = '10' WHERE Type = 'BUILDING_RELIGIOUS_LIBRARY';
UPDATE Buildings SET FaithToVotes = '10' WHERE Type = 'BUILDING_DIVINE_COURT';
UPDATE Buildings SET FaithToVotes = '10' WHERE Type = 'BUILDING_SACRED_GARDEN';
UPDATE Buildings SET FaithToVotes = '10' WHERE Type = 'BUILDING_HOLY_COUNCIL';
UPDATE Buildings SET FaithToVotes = '10' WHERE Type = 'BUILDING_GRAND_OSSUARY';
UPDATE Buildings SET FaithToVotes = '10' WHERE Type = 'BUILDING_APOSTOLIC_PALACE';
