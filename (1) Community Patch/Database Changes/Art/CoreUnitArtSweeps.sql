-- Faster aircraft
UPDATE ArtDefine_UnitMemberCombats SET MoveRate = MoveRate * 3;
UPDATE ArtDefine_UnitMemberCombats SET TurnRateMin = TurnRateMin * 3 WHERE MoveRate IS NOT NULL;
UPDATE ArtDefine_UnitMemberCombats SET TurnRateMax = TurnRateMax * 3 WHERE MoveRate IS NOT NULL;

-- Civilian units change appearance in Modern Era (by Mad Madigan)
UPDATE ArtDefine_UnitInfos SET Type = 'ART_DEF_UNIT__WORKER_MODERN' WHERE Type = 'ART_DEF_UNIT__WORKER_LATE';
UPDATE ArtDefine_UnitInfoMemberInfos SET UnitInfoType = 'ART_DEF_UNIT__WORKER_MODERN' WHERE UnitInfoType = 'ART_DEF_UNIT__WORKER_LATE';

UPDATE ArtDefine_UnitInfos SET Type = 'ART_DEF_UNIT_WORKBOAT_MODERN' WHERE Type = 'ART_DEF_UNIT_WORKBOAT_LATE';
UPDATE ArtDefine_UnitInfoMemberInfos SET UnitInfoType = 'ART_DEF_UNIT_WORKBOAT_MODERN' WHERE UnitInfoType = 'ART_DEF_UNIT_WORKBOAT_LATE';

UPDATE ArtDefine_UnitInfos SET Type = 'ART_DEF_UNIT_CARAVAN_MODERN' WHERE Type = 'ART_DEF_UNIT_CARAVAN_POSTMODERN';
UPDATE ArtDefine_UnitInfoMemberInfos SET UnitInfoType = 'ART_DEF_UNIT_CARAVAN_MODERN' WHERE UnitInfoType = 'ART_DEF_UNIT_CARAVAN_POSTMODERN';

UPDATE ArtDefine_UnitInfos SET Type = 'ART_DEF_UNIT_CARGO_SHIP_MODERN' WHERE Type = 'ART_DEF_UNIT_CARGO_SHIP_POSTMODERN';
UPDATE ArtDefine_UnitInfoMemberInfos SET UnitInfoType = 'ART_DEF_UNIT_CARGO_SHIP_MODERN' WHERE UnitInfoType = 'ART_DEF_UNIT_CARGO_SHIP_POSTMODERN';

UPDATE ArtDefine_UnitInfos SET Type = 'ART_DEF_UNIT_GENERAL_MODERN' WHERE Type = 'ART_DEF_UNIT_GENERAL_LATE';
UPDATE ArtDefine_UnitInfoMemberInfos SET UnitInfoType = 'ART_DEF_UNIT_GENERAL_MODERN' WHERE UnitInfoType = 'ART_DEF_UNIT_GENERAL_LATE';

UPDATE ArtDefine_UnitInfos SET Type = 'ART_DEF_UNIT_GREAT_ADMIRAL_MODERN' WHERE Type = 'ART_DEF_UNIT_GREAT_ADMIRAL_LATE';
UPDATE ArtDefine_UnitInfoMemberInfos SET UnitInfoType = 'ART_DEF_UNIT_GREAT_ADMIRAL_MODERN' WHERE UnitInfoType = 'ART_DEF_UNIT_GREAT_ADMIRAL_LATE';
