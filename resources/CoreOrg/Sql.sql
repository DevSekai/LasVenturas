INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_ballas', 'Ballas', 1),
    
	('society_vagos', 'Vagos', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_ballas', 'Ballas', 1),
    
	('society_vagos', 'Vagos', 1)
;

INSERT INTO `job2_grades` (job_name2, grade, name, label, salary) VALUES
	('ballas',0,'recrue','Ambulancier',0),
	('ballas',1,'medium','Medecin',0),
	('ballas',2,'expert','Medecin-chef',0),
	('ballas',3,'boss','Og',0),

	('vagos',0,'recrue','Recrue',0),
	('vagos',1,'medium','Novice',0),
	('vagos',2,'expert','Expert',0),
	('vagos',3,'boss','Jefe',0)
;

INSERT INTO `jobs2` (name, label) VALUES
	('ballas','Ballas'),
    
	('vagos','Vagos'),
;