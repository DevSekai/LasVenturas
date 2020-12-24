INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_ambulance', 'EMS', 1),
    
	('society_police', 'LSPD', 1),
    
	('society_mecano', 'Mecnao', 1),
	
	('society_weazel', 'Weazel News', 1),
	
	('society_unicorn', 'Vanilla Unicorn', 1),
	
	('society_tequilala', 'Tequi La La', 1),
	
	('society_gouv', 'Gouvernement', 1),
	
	('society_dog', 'Legion Dog', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_ambulance', 'EMS', 1),
    
	('society_police', 'LSPD', 1),
    
	('society_mecano', 'Mecnao', 1),
	
	('society_weazel', 'Weazel News', 1),
	
	('society_unicorn', 'Vanilla Unicorn', 1),
	
	('society_tequilala', 'Tequi La La', 1),
	
	('society_gouv', 'Gouvernement', 1),
	
	('society_dog', 'Legion Dog', 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary) VALUES
	('ambulance',0,'recrue','Ambulancier',0),
	('ambulance',1,'medium','Medecin',0),
	('ambulance',2,'expert','Medecin-chef',0),
	('ambulance',3,'boss','Directeur',0),

	('police',0,'recrue','Recrue',0),
	('police',1,'medium','Officier',0),
	('police',2,'expert','Sergent',0),
	('police',3,'expert2','Lieutenant',0),
	('police',4,'boss','Commandant',0),

	('mecano',0,'recrue','Recrue',0),
	('mecano',1,'medium','Novice',0),
	('mecano',2,'expert','Expert',0),
	('mecano',3,'boss','PDG',0),

	('weazel',0,'recrue','Assistant',0),
	('weazel',1,'medium','Perchiste',0),
	('weazel',2,'expert','Rédacteur',0),
	('weazel',3,'boss','PDG',0),

	('unicorn',0,'recrue','Videur',0),
	('unicorn',1,'medium','Danseuse',0),
	('unicorn',2,'expert','Barman',0),
	('unicorn',3,'boss','PDG',0),

	('tequilala',0,'recrue','Videur',0),
	('tequilala',1,'medium','Musicien',0),
	('tequilala',2,'expert','Barman',0),
	('tequilala',3,'boss','PDG',0),

	('gouv',0,'recrue','Assistant',0),
	('gouv',1,'medium','Secrétaire',0),
	('gouv',2,'expert','Procureur',0),
	('gouv',3,'boss','Gouverneur',0),

	('dog',0,'recrue','Livreur',0),
	('dog',1,'medium','Cuisinier',0),
	('dog',2,'expert','Manager',0),
	('dog',3,'boss','Dirigeant',0)
;

INSERT INTO `jobs` (name, label) VALUES
	('ambulance','EMS'),
    
	('police','LSPD'),

	('mecano','Mecano'),
	
	('weazel','Weazel News'),
	
	('unicorn','Vanilla Unicorn'),
	
	('tequilala','Tequi La La'),
	
	('gouv','Gouvernement'),
	
	('dog','Legion Dog')
;

INSERT INTO `items` (name, label, weight) VALUES
	('bandage','Bandage', 1),
	('medikit','Défibrillateur', 1),
	-- Legion's Dog --
	('saucisse','Saucisse', 1),
	('hotdogbread','Pain à hot-dog', 1),
	('patate','Pomme de terre', 1),
	('frite','Frites', 1),
	('hotdog','Hot-Dog', 1),
	('sprunk','Sprunk', 1),
	('cola','Cola', 1),
	-- Tequi-La-La --
	('jeargerbomb','Jeagerbomb', 1),
	('gintonic','Gin tonic', 1),
	('jeager','Jeager', 1),
	('gin','Gin', 1),
	('tonic','Tonic', 1),
	('redbull','Redbull', 1),
	-- Unicorn --
	('kirr','Kirr', 1),
	('vodkafruit','Sexe on the beach', 1),
	('champagne','Champagne', 1),
	('vodka','Vodka', 1),
	('sirop','Sirop', 1),
	('liqueur','Liqueur', 1)
;