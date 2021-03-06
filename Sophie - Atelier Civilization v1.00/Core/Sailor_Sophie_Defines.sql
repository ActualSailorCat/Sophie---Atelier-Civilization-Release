--///////////////////////////////////////////////////////
-- Sophie / Defines
--///////////////////////////////////////////////////////
INSERT INTO Types (Type, Kind) VALUES ('LEADER_SAILOR_SOPHIE', 'KIND_LEADER');

INSERT INTO Leaders	(LeaderType, Name, Sex, InheritFrom, SceneLayers)
VALUES	('LEADER_SAILOR_SOPHIE', 'LOC_LEADER_SAILOR_SOPHIE_NAME', 'Female', 'LEADER_DEFAULT',	4);	

INSERT INTO CivilizationLeaders	(CivilizationType, LeaderType, CapitalName)
VALUES	('CIVILIZATION_SAILOR_ATLEER', 'LEADER_SAILOR_SOPHIE', 'LOC_CITY_NAME_SAILOR_KIRCHEN_BELL');

INSERT INTO LeaderQuotes (LeaderType, Quote)
VALUES	('LEADER_SAILOR_SOPHIE', 'LOC_PEDIA_LEADERS_PAGE_LEADER_SAILOR_SOPHIE_QUOTE');	

INSERT INTO LoadingInfo (LeaderType, BackgroundImage, ForegroundImage, PlayDawnOfManAudio)
VALUES	('LEADER_SAILOR_SOPHIE', 'LEADER_SAILOR_SOPHIE_BACKGROUND', 'LEADER_SAILOR_SOPHIE_NEUTRAL', 0);	

-- // Sophie Traits
INSERT INTO Types (Type, Kind)
VALUES	('TRAIT_LEADER_SAILOR_SOPHIE_UA', 'KIND_TRAIT');

INSERT INTO Traits (TraitType, Name, Description)
VALUES	('TRAIT_LEADER_SAILOR_SOPHIE_UA', 'LOC_TRAIT_LEADER_SAILOR_SOPHIE_UA_NAME', 'LOC_TRAIT_LEADER_SAILOR_SOPHIE_UA_DESCRIPTION');

INSERT INTO LeaderTraits (LeaderType, TraitType)
VALUES	('LEADER_SAILOR_SOPHIE', 'TRAIT_LEADER_SAILOR_SOPHIE_UA'),
		('LEADER_SAILOR_SOPHIE', 'TRAIT_LEADER_CULTURAL_MAJOR_CIV');

-- // Great Works of Writing yield +2 Science
INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_SAILOR_SOPHIE_UA', 'SAILOR_SOPHIE_UA_SCIENCE');
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SAILOR_SOPHIE_UA_SCIENCE', 'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SAILOR_SOPHIE_UA_SCIENCE', 'GreatWorkObjectType', 'GREATWORKOBJECT_WRITING');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SAILOR_SOPHIE_UA_SCIENCE', 'YieldType', 'YIELD_SCIENCE');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SAILOR_SOPHIE_UA_SCIENCE', 'YieldChange', 2);

-- // Unit Abilities (for Lua)
INSERT INTO Types (Type, Kind)
VALUES	('ABILITY_SAILOR_SOPHIE', 'KIND_ABILITY');

INSERT INTO TypeTags (Type, Tag) SELECT DISTINCT 'ABILITY_SAILOR_SOPHIE', Tag
FROM TypeTags WHERE Type IN (SELECT UnitType FROM Units);

INSERT INTO UnitAbilities (UnitAbilityType,	Name, Description, Inactive, Permanent)
VALUES	('ABILITY_SAILOR_SOPHIE', NULL, NULL, 1, 1);

INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId)
VALUES	('ABILITY_SAILOR_SOPHIE', 'SAILOR_SOPHIE_UNIT_MOVEMENT'),
		('ABILITY_SAILOR_SOPHIE', 'SAILOR_SOPHIE_UNIT_STRENGTH');

INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES	('SAILOR_SOPHIE_UNIT_MOVEMENT', 'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT'),
		('SAILOR_SOPHIE_UNIT_STRENGTH',	'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH');

INSERT INTO ModifierArguments (ModifierID, Name, Value)
VALUES	('SAILOR_SOPHIE_UNIT_MOVEMENT', 'Amount', 2),
		('SAILOR_SOPHIE_UNIT_STRENGTH',	'Amount', 7);

INSERT INTO ModifierStrings (ModifierId, Context, Text)
VALUES	('SAILOR_SOPHIE_UNIT_STRENGTH',	'Preview',	'LOC_SAILOR_SOPHIE_UNIT_STRENGTH_PREVIEW_TEXT');