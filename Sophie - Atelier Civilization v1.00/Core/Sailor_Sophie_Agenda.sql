--///////////////////////////////////////////////////////
-- Sophie / Agenda
--///////////////////////////////////////////////////////
INSERT INTO Types
		(Type,							Kind)
VALUES	('TRAIT_AGENDA_SAILOR_SOPHIE',	'KIND_TRAIT');

INSERT INTO Agendas
		(AgendaType,				Name,								Description)
VALUES	('AGENDA_SAILOR_SOPHIE',	'LOC_AGENDA_SAILOR_SOPHIE_NAME',	'LOC_AGENDA_SAILOR_SOPHIE_DESCRIPTION');

INSERT INTO Traits
		(TraitType,						Name,					Description)
VALUES	('TRAIT_AGENDA_SAILOR_SOPHIE',	'LOC_PLACEHOLDER',		'LOC_PLACEHOLDER');

INSERT INTO AgendaTraits
		(AgendaType,						TraitType)
VALUES	('AGENDA_SAILOR_SOPHIE',			'TRAIT_AGENDA_SAILOR_SOPHIE');

INSERT INTO TraitModifiers
		(TraitType,							ModifierId)
VALUES	('TRAIT_AGENDA_SAILOR_SOPHIE',		'AGENDA_SAILOR_SOPHIE_FRIEND'),
		('TRAIT_AGENDA_SAILOR_SOPHIE',		'AGENDA_SAILOR_SOPHIE_DENOUNCED_FRIEND');

INSERT INTO Modifiers	
		(ModifierId,								ModifierType,									SubjectRequirementSetId)
VALUES	('AGENDA_SAILOR_SOPHIE_FRIEND',				'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',	'PLAYER_DECLARED_FRIEND'),
		('AGENDA_SAILOR_SOPHIE_DENOUNCED_FRIEND',	'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',	'PLAYER_FRIEND_DENOUNCED');

INSERT INTO ModifierArguments
		(ModifierId,								Name,							Value)
VALUES	('AGENDA_SAILOR_SOPHIE_FRIEND',				'InitialValue',					12),
		('AGENDA_SAILOR_SOPHIE_FRIEND',				'ReductionTurns',				10),
		('AGENDA_SAILOR_SOPHIE_FRIEND',				'ReductionValue',				1),
		('AGENDA_SAILOR_SOPHIE_FRIEND',				'MessageThrottle',				20),
		('AGENDA_SAILOR_SOPHIE_FRIEND',				'StatementKey',					'LOC_DIPLO_KUDO_LEADER_SAILOR_SOPHIE_REASON_HIGH'),
		('AGENDA_SAILOR_SOPHIE_FRIEND',				'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_SAILOR_SOPHIE_HIGH'),
		('AGENDA_SAILOR_SOPHIE_DENOUNCED_FRIEND',	'InitialValue',					-12),
		('AGENDA_SAILOR_SOPHIE_DENOUNCED_FRIEND',	'ReductionTurns',				10),
		('AGENDA_SAILOR_SOPHIE_DENOUNCED_FRIEND',	'ReductionValue',				-1),
		('AGENDA_SAILOR_SOPHIE_DENOUNCED_FRIEND',	'MessageThrottle',				20),
		('AGENDA_SAILOR_SOPHIE_DENOUNCED_FRIEND',	'StatementKey',					'LOC_DIPLO_KUDA_LEADER_SAILOR_SOPHIE_REASON_LOW'),
		('AGENDA_SAILOR_SOPHIE_DENOUNCED_FRIEND',	'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_SAILOR_SOPHIE_LOW');

INSERT INTO HistoricalAgendas
		(LeaderType,				AgendaType)
VALUES	('LEADER_SAILOR_SOPHIE',	'AGENDA_SAILOR_SOPHIE');

INSERT INTO ExclusiveAgendas
		(AgendaOne,					AgendaTwo)
VALUES	('AGENDA_SAILOR_SOPHIE',	'AGENDA_INDUSTRIALIST');

INSERT INTO ModifierStrings
		(ModifierId,								Context,		Text)
VALUES	('AGENDA_SAILOR_SOPHIE_FRIEND',				'Sample',		'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL'),
		('AGENDA_SAILOR_SOPHIE_DENOUNCED_FRIEND',	'Sample',		'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL');

--///////////////////////////////////////////////////////
-- Sophie / AI
--///////////////////////////////////////////////////////
INSERT INTO AiListTypes	
		(ListType)
VALUES	('SAILOR_SOPHIE_Victories'),
		('SAILOR_SOPHIE_Civics'),
		('SAILOR_SOPHIE_Techs'),
		('SAILOR_SOPHIE_Buildings'),
		('SAILOR_SOPHIE_Districts'),
		('SAILOR_SOPHIE_Improvements'),
		('SAILOR_SOPHIE_PseudoYields'),
		('SAILOR_SOPHIE_Yields'),
		('SAILOR_SOPHIE_Units'),
		('SAILOR_SOPHIE_Settle'),
		('SAILOR_SOPHIE_Alliances'),
		('SAILOR_SOPHIE_Diploaction'),
		('SAILOR_SOPHIE_Discussions'),
		('SAILOR_SOPHIE_Tactics'),
		('SAILOR_SOPHIE_Resolutions');

INSERT INTO AiLists	
		(ListType,							AgendaType,							System)
VALUES	('SAILOR_SOPHIE_Victories',			'TRAIT_AGENDA_SAILOR_SOPHIE',		'Strategies'),
		('SAILOR_SOPHIE_Civics',			'TRAIT_AGENDA_SAILOR_SOPHIE',		'Civics'),
		('SAILOR_SOPHIE_Techs',				'TRAIT_AGENDA_SAILOR_SOPHIE',		'Technologies'),
		('SAILOR_SOPHIE_Buildings',			'TRAIT_AGENDA_SAILOR_SOPHIE',		'Buildings'),
		('SAILOR_SOPHIE_Districts',			'TRAIT_AGENDA_SAILOR_SOPHIE',		'Districts'),
		('SAILOR_SOPHIE_Improvements',		'TRAIT_AGENDA_SAILOR_SOPHIE',		'Improvements'),
		('SAILOR_SOPHIE_PseudoYields',		'TRAIT_AGENDA_SAILOR_SOPHIE',		'PseudoYields'),
		('SAILOR_SOPHIE_Yields',			'TRAIT_AGENDA_SAILOR_SOPHIE',		'Yields'),
		('SAILOR_SOPHIE_Units',				'TRAIT_AGENDA_SAILOR_SOPHIE',		'Units'),
		('SAILOR_SOPHIE_Settle',			'TRAIT_AGENDA_SAILOR_SOPHIE',		'Settle'),
		('SAILOR_SOPHIE_Alliances',			'TRAIT_AGENDA_SAILOR_SOPHIE',		'Alliances'),
		('SAILOR_SOPHIE_Diploaction',		'TRAIT_AGENDA_SAILOR_SOPHIE',		'DiplomaticActions'),
		('SAILOR_SOPHIE_Discussions',		'TRAIT_AGENDA_SAILOR_SOPHIE',		'Discussions'),
		('SAILOR_SOPHIE_Tactics',			'TRAIT_AGENDA_SAILOR_SOPHIE',		'Tactics'),
		('SAILOR_SOPHIE_Resolutions',		'TRAIT_AGENDA_SAILOR_SOPHIE',		'Resolutions');

INSERT INTO AiFavoredItems	
		(ListType,							Favored,	Item,								Value)
VALUES	
-- VICTORIES
		('SAILOR_SOPHIE_Victories',			1,			'VICTORY_STRATEGY_MILITARY_VICTORY',	-1),
		('SAILOR_SOPHIE_Victories',			1,			'VICTORY_STRATEGY_CULTURAL_VICTORY',	-1),
-- YIELDS
		('SAILOR_SOPHIE_Yields',			1,			'YIELD_CULTURE',					0),		
-- PSEUDOYIELDS
		('SAILOR_SOPHIE_PseudoYields',		1,			'PSEUDOYIELD_GPP_WRITER',			50),
		('SAILOR_SOPHIE_PseudoYields',		1,			'PSEUDOYIELD_GREATWORK_WRITING',	50),
		('SAILOR_SOPHIE_PseudoYields',		1,			'PSEUDOYIELD_CIVIC',				0),
		('SAILOR_SOPHIE_PseudoYields',		1,			'PSEUDOYIELD_TOURISM',				0),
		('SAILOR_SOPHIE_PseudoYields',		1,			'PSEUDOYIELD_STANDING_ARMY_NUMBER',	0),
		('SAILOR_SOPHIE_PseudoYields',		1,			'PSEUDOYIELD_STANDING_ARMY_VALUE',	0),
-- UNITS
		('SAILOR_SOPHIE_Units',				1,			'UNIT_SAILOR_ATLEER_UU',			30),
		('SAILOR_SOPHIE_Units',				1,			'UNIT_GREAT_WRITER',				50),
-- BUILDINGS & DISTRICTS			
		('SAILOR_SOPHIE_Districts',			1,			'DISTRICT_THEATER',					50),	
		('SAILOR_SOPHIE_Districts',			1,			'DISTRICT_ENTERTAINMENT_COMPLEX',	10),	
		('SAILOR_SOPHIE_Districts',			0,			'DISTRICT_HOLY_SITE',				0),
-- IMPROVEMENTS
		('SAILOR_SOPHIE_Improvements',		1,			'IMPROVEMENT_SAILOR_ATLEER_UI',		50),
-- CIVICS & TECHS
		('SAILOR_SOPHIE_Civics',			1,			'CIVIC_CRAFTSMANSHIP',				0), 
		('SAILOR_SOPHIE_Civics',			1,			'CIVIC_MILITARY_TRADITION',			0), 
		('SAILOR_SOPHIE_Civics',			1,			'CIVIC_GAMES_RECREATION',			0), 
		('SAILOR_SOPHIE_Civics',			1,			'CIVIC_DRAMA_POETRY',				50),  
		('SAILOR_SOPHIE_Techs',				1,			'TECH_BRONZE_WORKING',				0), 
		('SAILOR_SOPHIE_Techs',				1,			'TECH_IRON_WORKING',				0),
		('SAILOR_SOPHIE_Techs',				1,			'TECH_GUNPOWDER',					0),
		('SAILOR_SOPHIE_Techs',				1,			'TECH_WRITING',						0),
-- ALLIANCES
		('SAILOR_SOPHIE_Alliances',			1,			'ALLIANCE_CULTURAL',				0),
		('SAILOR_SOPHIE_Alliances',			1,			'ALLIANCE_MILITARY',				0),
-- DIPLOACTION
		('SAILOR_SOPHIE_Diploaction',		1,			'DIPLOACTION_DECLARE_PROTECTORATE_WAR',	0),
		('SAILOR_SOPHIE_Diploaction',		1,			'DIPLOACTION_DECLARE_LIBERATION_WAR',	0),
		('SAILOR_SOPHIE_Diploaction',		1,			'DIPLOACTION_DECLARE_FRIENDSHIP',	0),
-- DISCUSSIONS
		('SAILOR_SOPHIE_Discussions',		1,			'WC_EMERGENCY_MILITARY',			0),
		('SAILOR_SOPHIE_Discussions',		1,			'WC_EMERGENCY_CITY_STATE',			0),
		('SAILOR_SOPHIE_Discussions',		0,			'WC_EMERGENCY_NOBEL_PRIZE_PHYSICS',	0),
		('SAILOR_SOPHIE_Discussions',		0,			'WC_EMERGENCY_CLIMATE_ACCORDS',		0),
		('SAILOR_SOPHIE_Discussions',		1,			'WC_EMERGENCY_WORLD_FAIR',			0),
		('SAILOR_SOPHIE_Discussions',		0,			'WC_EMERGENCY_SPACE_STATION',		0),
		('SAILOR_SOPHIE_Discussions',		0,			'WC_EMERGENCY_RELIGIOUS',			0),
		('SAILOR_SOPHIE_Discussions',		0,			'WC_EMERGENCY_BACKSTAB',			0),
		('SAILOR_SOPHIE_Discussions',		1,			'WC_EMERGENCY_REQUEST_AID',			0),
		('SAILOR_SOPHIE_Discussions',		0,			'WC_EMERGENCY_NUCLEAR',				0),
		('SAILOR_SOPHIE_Discussions',		0,			'WC_EMERGENCY_WORLD_GAMES',			0),
-- TACTICS
		('SAILOR_SOPHIE_Tactics',			1,			'Pillage District',					50),
		('SAILOR_SOPHIE_Tactics',			1,			'Pillage Improvement',				50),
-- RESOLUTIONS
		('SAILOR_SOPHIE_Resolutions',		1,			'WC_RES_MERCENARY_COMPANIES',		0);
-- SETTLE
INSERT INTO AiFavoredItems
		(ListType,					Item,				Favored,		StringVal,					Value)
VALUES  ('SAILOR_SOPHIE_Settle',	'Resource Class',	1,				'RESOURCECLASS_BONUS',		50),
		('SAILOR_SOPHIE_Settle',	'Resource Class',	1,				'RESOURCECLASS_STRATEGIC',	50),
		('SAILOR_SOPHIE_Settle',	'Resource Class',	1,				'RESOURCECLASS_LUXURY',		50);
-- BUILDINGS
INSERT INTO AiFavoredItems	
		(ListType,						Favored,	Item,				Value)
SELECT	'SAILOR_SOPHIE_Buildings',		1,			BuildingType,		0
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_THEATER';

INSERT INTO AiFavoredItems	
		(ListType,						Favored,	Item,				Value)
SELECT	'SAILOR_SOPHIE_Buildings',		1,			BuildingType,		0
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_ENTERTAINMENT_COMPLEX';
-- WONDERS
INSERT INTO AiFavoredItems	
		(ListType,						Favored,	Item,				Value)
SELECT	'SAILOR_SOPHIE_Buildings',		1,			'BUILDING_APADANA',	0
FROM Buildings WHERE BuildingType = 'BUILDING_APADANA' AND EXISTS (SELECT 1 FROM Buildings WHERE BuildingType = 'BUILDING_APADANA');

INSERT INTO AiFavoredItems    
        (ListType,                      Favored,    Item,               Value)
SELECT    'SAILOR_SOPHIE_Buildings',	1,			BuildingType,       0
FROM Building_GreatWorks WHERE GreatWorkSlotType = 'GREATWORKSLOT_WRITING';