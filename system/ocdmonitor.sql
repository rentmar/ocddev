-- creacion base de datos C:\xampp\htdocs\ocddev\info\ocdmonitor.sql
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
--
DROP DATABASE ocdmonitor;
CREATE DATABASE ocdmonitor;
USE ocdmonitor;
-- creacion tablas 1
CREATE TABLE tipo_medio (idtipomedio SMALLINT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
			 nombre_tipo VARCHAR(40) NOT NULL,
			 PRIMARY KEY (idtipomedio));
CREATE TABLE tema (idtema SMALLINT(4) UNSIGNED NOT NULL AUTO_INCREMENT,
			nombre_tema VARCHAR(150) NOT NULL,
			PRIMARY KEY (idtema));
CREATE TABLE actor (idactor SMALLINT(4) UNSIGNED NOT NULL AUTO_INCREMENT,
			nombre_actor VARCHAR(150) NOT NULL,
			PRIMARY KEY(idactor));
CREATE TABLE departamento (iddepartamento SMALLINT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
			nombre_departamento VARCHAR(25) NOT NULL,
			PRIMARY KEY (iddepartamento));
CREATE TABLE medio_comunicacion (idmedio SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
			nombre_medio VARCHAR(50) NOT NULL,
			rel_idtipomedio SMALLINT(3) UNSIGNED NOT NULL,
			PRIMARY KEY (idmedio),
			CONSTRAINT FK_mediocomunicaciontipo FOREIGN KEY (rel_idtipomedio) REFERENCES tipo_medio(idtipomedio));
CREATE TABLE subtema (idsubtema SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
			nombre_subtema VARCHAR(150) NOT NULL,
			rel_idtema SMALLINT(4) UNSIGNED NOT NULL,
			PRIMARY KEY(idsubtema),FOREIGN KEY(rel_idtema) REFERENCES tema(idtema));
CREATE TABLE noticia (idnoticia INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
			fecha INT(11) NOT NULL,
			titular VARCHAR(200) NOT NULL,
			resumen TEXT NOT NULL,
			url_noticia VARCHAR(150), 
			rel_idactor SMALLINT(4) UNSIGNED NOT NULL,
			rel_idsubtema SMALLINT(5) UNSIGNED NOT NULL,
			PRIMARY KEY(idnoticia),
			CONSTRAINT FK_actornoticia FOREIGN KEY(rel_idactor) REFERENCES actor(idactor),
			CONSTRAINT FK_subtemanoticia FOREIGN KEY (rel_idsubtema) REFERENCES subtema(idsubtema));
CREATE TABLE noticia_medio (idnoticiamedio INT(11) NOT NULL AUTO_INCREMENT,
			rel_idnoticia INT(11) UNSIGNED NOT NULL,
			rel_idmedio SMALLINT(5) UNSIGNED NOT NULL,
			PRIMARY KEY (idnoticiamedio),
			CONSTRAINT FK_noticiamedio FOREIGN KEY (rel_idnoticia) REFERENCES noticia (idnoticia),
			CONSTRAINT FK_medionoticia FOREIGN KEY (rel_idmedio) REFERENCES medio_comunicacion (idmedio));
CREATE TABLE medio_departamento (idmediodepartamento INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
			rel_idmedio SMALLINT(5) UNSIGNED NOT NULL,
			rel_iddepartamento SMALLINT(3) UNSIGNED NOT NULL,
			PRIMARY KEY (idmediodepartamento),
			CONSTRAINT FK_mediodepartamento FOREIGN KEY (rel_idmedio) REFERENCES medio_comunicacion(idmedio),
			CONSTRAINT FK_departamentomedio FOREIGN KEY(rel_iddepartamento) REFERENCES departamento(iddepartamento)); 

--  usuario y sessions
CREATE TABLE ci_sessions (id VARCHAR(128) NOT NULL,
			ip_address VARCHAR(45) NOT NULL,
			timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
			data BLOB NOT NULL 
			);

INSERT INTO ci_sessions (id, ip_address, timestamp, data) VALUES
			('4f2e9141a034e3c56a1d6e6fbf9f7f077149202e', 
			'127.0.0.1', 
			'0000-00-00 00:00:00', 
			0x5f5f63695f6c6173745f726567656e65726174657c693a313632343637333838333b5f63695f70726576696f75735f75726c7c733a34363a22687474703a2f2f6c6f63616c686f73742f70726f796563746f2f696e6465782e7068702f4c6f67696e2f636f6465223b6e616d657c733a343a226a75616e223b656d61696c7c733a31343a226a75616e406c6f63616c2e636f6d223b6c6f676765645f696e7c623a313b);

CREATE TABLE groups (id mediumint(8) UNSIGNED NOT NULL,
					name varchar(20) NOT NULL,
					description varchar(100) NOT NULL) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO groups (id, name, description) VALUES (1, 'admin', 'Administrator'),(2, 'miembros', 'Usuarios generales, docentes'),(3, 'monitores', 'Alumnos registrados');

CREATE TABLE login_attempts (id int(11) UNSIGNED NOT NULL,
							ip_address varchar(45) NOT NULL,
						    login varchar(100) NOT NULL,
							time int(11) UNSIGNED DEFAULT NULL) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE users (id int(11) UNSIGNED NOT NULL,
			ip_address varchar(45) NOT NULL,
			username varchar(100) DEFAULT NULL,
			password varchar(255) NOT NULL,
			email varchar(254) NOT NULL,
			activation_selector varchar(255) DEFAULT NULL,
			activation_code varchar(255) DEFAULT NULL,
			forgotten_password_selector varchar(255) DEFAULT NULL,
			forgotten_password_code varchar(255) DEFAULT NULL,
			forgotten_password_time int(11) UNSIGNED DEFAULT NULL,
			remember_selector varchar(255) DEFAULT NULL,
			remember_code varchar(255) DEFAULT NULL,
			created_on int(11) UNSIGNED NOT NULL,
			last_login int(11) UNSIGNED DEFAULT NULL,
			active tinyint(1) UNSIGNED DEFAULT NULL,
			first_name varchar(50) DEFAULT NULL,
			last_name varchar(50) DEFAULT NULL,
			company varchar(100) DEFAULT NULL,
			phone varchar(20) DEFAULT NULL
			) ENGINE=InnoDB DEFAULT CHARSET=utf8;
			
INSERT INTO users (id,ip_address,username, password, email, activation_selector, activation_code, 
					forgotten_password_selector, forgotten_password_code,forgotten_password_time, 
					remember_selector,remember_code,created_on,last_login,active,first_name, last_name,company,phone) 
					VALUES (1, 
					'127.0.0.1', 
					'administrator', 
					'$2y$08$200Z6ZZbp3RAEXoaWcMA6uJOFicwNZaqk4oDhqTUiFXFe63MG.Daa', 
					'admin@admin.com',
					NULL, '', NULL, NULL, NULL, NULL, NULL,
					1268889823, 
					1268889823, 
					1, 
					'Admin', 
					'istrator', 
					'ADMIN', 
					'0');

CREATE TABLE users_groups (id int(11) UNSIGNED NOT NULL,
						  user_id int(11) UNSIGNED NOT NULL,
						   group_id mediumint(8) UNSIGNED NOT NULL) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO users_groups (id, `user_id`, group_id) VALUES (1, 1, 1),(2, 1, 2),(3, 1, 3);

ALTER TABLE ci_sessions ADD PRIMARY KEY (id),ADD KEY ci_sessions_timestamp (`timestamp`);
ALTER TABLE groups ADD PRIMARY KEY (id);
ALTER TABLE login_attempts ADD PRIMARY KEY (id);
  
ALTER TABLE users ADD PRIMARY KEY (id),
					ADD UNIQUE KEY uc_email (email),
					ADD UNIQUE KEY uc_activation_selector (activation_selector),
					ADD UNIQUE KEY uc_forgotten_password_selector (forgotten_password_selector),
					ADD UNIQUE KEY uc_remember_selector (remember_selector);
  
ALTER TABLE users_groups ADD PRIMARY KEY (id),
						   ADD UNIQUE KEY uc_users_groups (`user_id`,group_id),
						   ADD KEY fk_users_groups_users1_idx (`user_id`),
						   ADD KEY fk_users_groups_groups1_idx (group_id);
  
ALTER TABLE groups MODIFY id mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
  
ALTER TABLE login_attempts MODIFY id int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
  
ALTER TABLE users MODIFY id int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE users_groups MODIFY id int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE users_groups ADD CONSTRAINT fk_users_groups_groups1 FOREIGN KEY (group_id) REFERENCES groups (id) ON DELETE CASCADE ON UPDATE NO ACTION,
						 ADD CONSTRAINT fk_users_groups_users1 FOREIGN KEY (`user_id`) REFERENCES users (id) ON DELETE CASCADE ON UPDATE NO ACTION;
--  fin usuario y sessions

CREATE TABLE usuario_noticia (idusuarionoticia INT(11) NOT NULL AUTO_INCREMENT,
			rel_idusr INT(11) UNSIGNED NOT NULL,
			rel_idnoticia INT(11) UNSIGNED NOT NULL,
			PRIMARY KEY (idusuarionoticia),
			CONSTRAINT FK_usrnoticia FOREIGN KEY(rel_idusr) REFERENCES users(id),
			CONSTRAINT FK_noticiausuario FOREIGN KEY(rel_idnoticia) REFERENCES noticia(idnoticia));
-- insercion datos 
INSERT INTO tipo_medio (nombre_tipo) VALUES ('Pagina de Red Social'),
											('Canal de Television'),
											('Emisora Radial'),
											('Prensa Escrita');
-- 
INSERT INTO departamento (nombre_departamento) VALUES ('La Paz'),
													  ('Santa Cruz'),
													  ('Oruro'),
													  ('Cochabamba'),
													  ('Sucre'),
													  ('Tarija'),
													  ('Beni'),
													  ('Pando'),
													  ('Potosi');
--
INSERT INTO actor (nombre_actor) VALUES ('Pertenece al Organo Legislativo'),
									    ('Pertenece al Organo Ejecutivo'),
									    ('Pertenece al Organo Judicial'),
									    ('Pertenece al Organo Electoral'),
									    ('Pertenece a un partido politico'),
									    ('Pertenece a la sociedad civil'),
									    ('Pertenece al Organo Ejecutivo Departamental'),
									    ('Pertenece al Organo Legislativo Departamental'),
									    ('Pertenece al Organo Ejecutivo Municipal'),
									    ('Pertenece al Organo Legislativo Municipal');
--
INSERT INTO tema (nombre_tema) VALUES ('Presentacion de Estatutos de organizaciones politicas'),
									  ('Competencias Jurisdicionales del TSE'),
									  ('Redistribuicion de Escaños'),
									  ('Circuncipciones uninominales'),
									  ('Difusion de encuestas'),
									  ('Inhabilitacion de candidatos'),
									  ('Computo departamental'),
									  ('Padron Electoral'),
									  ('Procedimientos Tecnico Electorales'),
									  ('Financiamiento politico y partidario');
-- seleccion tablas
SELECT * FROM tipo_medio;
SELECT * FROM actor;
SELECT * FROM tema;
SELECT * FROM departamento;
SELECT username,first_name,company FROM users;
COMMIT;






