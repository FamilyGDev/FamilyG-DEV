INSERT INTO `jobs` (name, label) VALUES
  ('offpolice','Repos'),
  ('offambulance','Repos'),
  ('offmecano','Repos'),
  ('offtaxi','Repos'),
  ('offbanker','Repos'),
  ('offfueler','Repos'),
  ('offrealestateagent','Repos'),
  ('offvigne','Repos'),
  ('offunicorn','Repos')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('offpolice',0,'recruit','Recruit',0,'{}','{}'),
  ('offpolice',1,'officer','Officer',0,'{}','{}'),
  ('offpolice',2,'sergeant','Sergeant',0,'{}','{}'),
  ('offpolice',3,'lieutenant','Lieutenant',0,'{}','{}'),
  ('offpolice',4,'boss','Boss',0,'{}','{}'),
  ('offambulance',0,'ambulance','Ambulance',0,'{}','{}'),
  ('offambulance',1,'doctor','Doctor',0,'{}','{}'),
  ('offambulance',2,'chief_doctor','Chef',0,'{}','{}'),
  ('offambulance',3,'boss','Boss',0,'{}','{}')
;


-- RAJOUTER LES AUTRES METIERS WL MANQUANTS.

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('offmecano',0,'recrue','Recrue',0,'{}','{}'),
  ('offmecano',1,'novice','Novice',0,'{}','{}'),
  ('offmecano',2,'experimente','Experimente',0,'{}','{}'),
  ('offmecano',3,'chief','Chef dequipe',0,'{}','{}'),
  ('offmecano',4,'boss','Patron',0,'{}','{}')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('offtaxi',0,'recrue','Recrue',0,'{}','{}'),
  ('offtaxi',1,'novice','Novice',0,'{}','{}'),
  ('offtaxi',2,'experimente','Experimente',0,'{}','{}'),
  ('offtaxi',3,'uber','Chauffeur confirmé',0,'{}','{}'),
  ('offtaxi',4,'boss','Patron',0,'{}','{}')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('offbanker',0,'advisor','Conseiller',0,'{}','{}'),
  ('offbanker',1,'banker','Banquier',0,'{}','{}'),
  ('offbanker',2,'business_banker','Banquier daffaires',0,'{}','{}'),
  ('offbanker',3,'trader','Trader',0,'{}','{}'),
  ('offbanker',4,'boss','Patron',0,'{}','{}')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('offfueler',0,'recrue','Apprenti',0,'{}','{}'),
  ('offfueler',1,'novice','Pétrolier',0,'{}','{}'),
  ('offfueler',2,'cdisenior','Pétrolier Confirmé',0,'{}','{}'),
  ('offfueler',3,'boss','Patron',0,'{}','{}')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('offrealestateagent',0,'location','Location',0,'{}','{}'),
  ('offrealestateagent',1,'vendeur','Vendeur',0,'{}','{}'),
  ('offrealestateagent',2,'gestion','Gestion bails',0,'{}','{}'),
  ('offrealestateagent',3,'boss','Patron',0,'{}','{}')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('offvigne',0,'recrue','Vignoble',0,'{}','{}'),
  ('offvigne',1,'novice','Chef de chai',0,'{}','{}'),
  ('offvigne',2,'cdisenior','Adjoint',0,'{}','{}'),
  ('offvigne',3,'boss','Patron',0,'{}','{}')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('offunicorn',0,'barman','Barman',0,'{}','{}'),
  ('offunicorn',1,'dancer','Danseur',0,'{}','{}'),
  ('offunicorn',2,'viceboss','Co-Gérant',0,'{}','{}'),
  ('offunicorn',3,'boss','Patron',0,'{}','{}')
;