--///////////////////////////////////////////////////////
-- Sophie / XP2 DB
--///////////////////////////////////////////////////////
DELETE FROM TraitModifiers WHERE TraitType = 'TRAIT_AGENDA_SAILOR_SOPHIE';
DELETE FROM Modifiers WHERE ModifierId LIKE 'AGENDA_SAILOR_SOPHIE%';
DELETE FROM ModifierArguments WHERE ModifierId LIKE 'AGENDA_SAILOR_SOPHIE%';
DELETE FROM ModifierStrings WHERE ModifierId LIKE 'AGENDA_SAILOR_SOPHIE%';

INSERT OR REPLACE INTO Types
		(Type,							Kind)
VALUES	('TRAIT_AGENDA_SAILOR_SOPHIE',	'KIND_TRAIT');

INSERT OR REPLACE INTO Agendas
		(AgendaType,				Name,									Description)
VALUES	('AGENDA_SAILOR_SOPHIE',	'LOC_AGENDA_SAILOR_SOPHIE_XP2_NAME',	'LOC_AGENDA_SAILOR_SOPHIE_XP2_DESCRIPTION');

INSERT OR REPLACE INTO Traits
		(TraitType,						Name,					Description)
VALUES	('TRAIT_AGENDA_SAILOR_SOPHIE',	'LOC_PLACEHOLDER',		'LOC_PLACEHOLDER');

INSERT OR REPLACE INTO AgendaTraits
		(AgendaType,						TraitType)
VALUES	('AGENDA_SAILOR_SOPHIE',			'TRAIT_AGENDA_SAILOR_SOPHIE');

INSERT OR REPLACE INTO TraitModifiers
		(TraitType,							ModifierId)
VALUES	('TRAIT_AGENDA_SAILOR_SOPHIE',		'AGENDA_SAILOR_SOPHIE_HIGH'),
		('TRAIT_AGENDA_SAILOR_SOPHIE',		'AGENDA_SAILOR_SOPHIE_LOW');

INSERT OR REPLACE INTO Modifiers	
		(ModifierId,						ModifierType,									SubjectRequirementSetId)
VALUES	('AGENDA_SAILOR_SOPHIE_HIGH',		'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',	'PLAYER_HAS_HIGH_PILLAGE'),
		('AGENDA_SAILOR_SOPHIE_LOW',		'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',	'PLAYER_HAS_LOW_PILLAGE');

INSERT OR REPLACE INTO ModifierArguments
		(ModifierId,						Name,							Value)
VALUES	('AGENDA_SAILOR_SOPHIE_HIGH',		'InitialValue',					10),
		('AGENDA_SAILOR_SOPHIE_HIGH',		'StatementKey',					'LOC_DIPLO_KUDO_LEADER_SAILOR_SOPHIE_XP2_REASON_HIGH'),
		('AGENDA_SAILOR_SOPHIE_HIGH',		'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_SAILOR_SOPHIE_XP2_HIGH'),
		('AGENDA_SAILOR_SOPHIE_LOW',		'InitialValue',					-10),
		('AGENDA_SAILOR_SOPHIE_LOW',		'StatementKey',					'LOC_DIPLO_KUDO_LEADER_SAILOR_SOPHIE_XP2_REASON_LOW'),
		('AGENDA_SAILOR_SOPHIE_LOW',		'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_SAILOR_SOPHIE_XP2_LOW');

INSERT OR REPLACE INTO HistoricalAgendas
		(LeaderType,				AgendaType)
VALUES	('LEADER_SAILOR_SOPHIE',	'AGENDA_SAILOR_SOPHIE');

INSERT INTO ExclusiveAgendas
		(AgendaOne,					AgendaTwo)
VALUES	('AGENDA_SAILOR_SOPHIE',	'AGENDA_PILLAGER');

INSERT OR REPLACE INTO ModifierStrings
		(ModifierId,						Context,		Text)
VALUES	('AGENDA_SAILOR_SOPHIE_HIGH',		'Sample',		'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL'),
		('AGENDA_SAILOR_SOPHIE_LOW',		'Sample',		'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL');
