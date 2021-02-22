--///////////////////////////////////////////////////////
-- Sophie / Colors
--///////////////////////////////////////////////////////
INSERT INTO Colors -- Primary is background, secondary foreground.
        (Type,								Color)
VALUES  ('COLOR_SAILOR_SOPHIE_PRIMARY',		'37,68,87,255'),
		('COLOR_SAILOR_SOPHIE_SECONDARY',	'237,215,203,255'),
		('COLOR_SAILOR_SOPHIE_PRIMARY2',	'66,122,129,255'),
        ('COLOR_SAILOR_SOPHIE_SECONDARY2',	'237,215,203,255'),
		('COLOR_SAILOR_SOPHIE_PRIMARY3',	'131,27,32,255'),
        ('COLOR_SAILOR_SOPHIE_SECONDARY3',	'237,215,203,255');

INSERT INTO PlayerColors (
		Type,
		Usage, 
		PrimaryColor, 
		SecondaryColor, 
		Alt1PrimaryColor, 
		Alt1SecondaryColor, 
		Alt2PrimaryColor, 
		Alt2SecondaryColor, 
		Alt3PrimaryColor, 
		Alt3SecondaryColor)
VALUES	('LEADER_SAILOR_SOPHIE',
		'Unique',
		'COLOR_SAILOR_SOPHIE_PRIMARY',
		'COLOR_SAILOR_SOPHIE_SECONDARY',
		'COLOR_SAILOR_SOPHIE_PRIMARY2',
		'COLOR_SAILOR_SOPHIE_SECONDARY2',
		'COLOR_SAILOR_SOPHIE_PRIMARY3',
		'COLOR_SAILOR_SOPHIE_SECONDARY3',
		'COLOR_SAILOR_ATLEER_C_PRIMARY',
		'COLOR_SAILOR_ATLEER_C_SECONDARY');