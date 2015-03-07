DROP TABLE IF EXISTS Error;
DROP TABLE IF EXISTS BLAST;
DROP TABLE IF EXISTS MitoLoc;
DROP TABLE IF EXISTS Result;
DROP TABLE IF EXISTS Job;

DROP TABLE IF EXISTS User_log;
DROP TABLE IF EXISTS Authentication;
DROP TABLE IF EXISTS Security;
DROP TABLE IF EXISTS User_level;
DROP TABLE IF EXISTS Institution;
DROP TABLE IF EXISTS Individual;
DROP TABLE IF EXISTS User;

DROP TABLE IF EXISTS Interacts;
DROP TABLE IF EXISTS protein_link_genbank;
DROP TABLE IF EXISTS protein_link_refseq;
DROP TABLE IF EXISTS protein_link_uniprotKB;
DROP TABLE IF EXISTS GenBank;
DROP TABLE IF EXISTS RefSeq;
DROP TABLE IF EXISTS UniprotKB;

DROP TABLE IF EXISTS protein_has_go;
DROP TABLE IF EXISTS protein_has_location;
DROP TABLE IF EXISTS Gene_Ontology;
DROP TABLE IF EXISTS Subcellular_Location;
DROP TABLE IF EXISTS Protein_Info;
DROP TABLE IF EXISTS Protein;
/*----------------------------------Proteins-------------------------------------------*/

CREATE TABLE Protein(
	pid INTEGER AUTO_INCREMENT,
	name varchar(100),
	PRIMARY KEY(pid)
)ENGINE=InnoDB;

/* Protein_Info: contains all detailed information related to a specific protein, created for more efficiency
	sequence: several lines of strings, can be very long!
*/
CREATE TABLE Protein_Info(
	pid INTEGER,
	description varchar(500),
	organism varchar(100),
	sequence varchar(1000),
	FOREIGN KEY(pid) REFERENCES Protein(pid),
	PRIMARY KEY(pid)
)ENGINE = InnoDB;

CREATE TABLE Interacts(
	fake_id INTEGER AUTO_INCREMENT,
	pid_a INTEGER,
	pid_b INTEGER,
	detection_method varchar(200),
	description varchar(300),
	reference varchar(200),
	source varchar(100),
	FOREIGN KEY(pid_a) REFERENCES Protein(pid),
	FOREIGN KEY(pid_b) REFERENCES Protein(pid),
	PRIMARY KEY(fake_id)
)ENGINE=InnoDB;

/*GenBank, RefSeq & UniprotKB: 
	id: number or string?
*/
CREATE TABLE GenBank(
	genbank_id INTEGER,
	PRIMARY KEY(genbank_id)
)ENGINE=InnoDB;


CREATE TABLE RefSeq(
	refseq_id INTEGER,
	PRIMARY KEY(refseq_id)
)ENGINE=InnoDB;


CREATE TABLE UniprotKB(
	uniprot_id INTEGER,
	PRIMARY KEY(uniprot_id)
)ENGINE=InnoDB;


CREATE TABLE protein_link_genbank(
	pid INTEGER,
	genbank_id INTEGER,
	PRIMARY KEY(pid,genbank_id),
	FOREIGN KEY(pid) REFERENCES Protein(pid),
	FOREIGN KEY(genbank_id) REFERENCES GenBank(genbank_id)
)ENGINE=InnoDB;


CREATE TABLE protein_link_refseq(
	pid INTEGER,
	refseq_id INTEGER,
	PRIMARY KEY(pid,refseq_id),
	FOREIGN KEY(pid) REFERENCES Protein(pid),
	FOREIGN KEY(refseq_id) REFERENCES RefSeq(refseq_id)
)ENGINE=InnoDB;


CREATE TABLE protein_link_uniprotKB(
	pid INTEGER,
	uniprot_id INTEGER,
	PRIMARY KEY(pid,uniprot_id),
	FOREIGN KEY(pid) REFERENCES Protein(pid),
	FOREIGN KEY(uniprot_id) REFERENCES UniprotKB(uniprot_id)
)ENGINE=InnoDB;

/*Gene_Ontology:
	model: can be biological process/ molecular function/ cellular component.
	evidence: can be IEA/ISO/IDA/TAS/IMP/...
	term name: GO Term name, like M Band/ A Band/ Heart Growth/ ...
	GOId: given by the database, a combination of numbers and characters
*/
CREATE TABLE Gene_Ontology(
	model varchar(50),
	go_id varchar(30),
	evidence varchar(30),
	term_name varchar(100),
	PRIMARY KEY(go_id)
)ENGINE = InnoDB;

/* protein_has_go: table for the many-to-many relationship between protein and Gene_Ontology
*/
CREATE TABLE protein_has_go(
	pid INTEGER,
	go_id varchar(30),
	FOREIGN KEY(pid) REFERENCES Protein(pid),
	FOREIGN KEY(go_id) REFERENCES Gene_Ontology(go_id),
	PRIMARY KEY(pid, go_id)
)ENGINE = InnoDB;

/* Subcellular_Location: Provides information on the location and the topology of the mature protein in the cell.
*/
CREATE TABLE Subcellular_Location(
	location_id INTEGER,
	information varchar(200),
	PRIMARY KEY(location_id)
)ENGINE = InnoDB;

/* protein_has_location: table for the many-to-many relationship between protein and subcellular location.
*/
CREATE TABLE protein_has_location(
	pid INTEGER,
	location_id INTEGER,
	FOREIGN KEY(pid) REFERENCES Protein(pid),
	PRIMARY KEY(pid, location_id)
)ENGINE = InnoDB;

/*---------------------------------------User------------------------------------------*/

CREATE TABLE User( 
	uid INTEGER AUTO_INCREMENT,
	address VARCHAR(200),
	city VARCHAR(50),
	state VARCHAR(20),
	zipcode VARCHAR(10),
	member_since DATE,
	username VARCHAR(20),
	email VARCHAR(30),
	primary key (uid)
)engine = InnoDB;

CREATE TABLE User_log(
	uid INTEGER,
	lid INTEGER AUTO_INCREMENT,
	action VARCHAR(20),
	ip_address VARCHAR(15),
	time TIMESTAMP,
	FOREIGN KEY(uid) REFERENCES User(uid),
	PRIMARY KEY(lid)
)ENGINE = InnoDB;

CREATE TABLE Authentication(
	uid INTEGER,
	salt VARCHAR(40),
	hashed_password VARCHAR(50),
	PRIMARY KEY (uid),
	FOREIGN KEY (uid) REFERENCES User(uid) ON DELETE CASCADE
)ENGINE = InnoDB;

CREATE TABLE Security(
	uid INTEGER,
	question VARCHAR(100),
	answer VARCHAR(100),
	PRIMARY KEY (uid),
	FOREIGN KEY (uid) REFERENCES User(uid) ON DELETE CASCADE
)ENGINE = InnoDB;

CREATE TABLE User_level(
	uid INTEGER,
	priority VARCHAR(50),
	verify VARCHAR(50),
	PRIMARY KEY (uid),
	FOREIGN KEY (uid) REFERENCES User(uid) ON DELETE CASCADE
)ENGINE = InnoDB;

/*
CREATE TABLE user_has_log(
	uid INT,
	lid INT,
	PRIMARY KEY(uid,lid),
	FOREIGN KEY(uid) REFERENCES User(uid),
	FOREIGN KEY(lid) REFERENCES User_log(lid)
)engine=InnoDB;
*/

CREATE TABLE Institution(
	uid INTEGER,
	name VARCHAR(40),
	PRIMARY key (uid),
	FOREIGN key (uid) REFERENCES User(uid) ON DELETE RESTRICT
)ENGINE = InnoDB;

CREATE TABLE Individual( 
	uid INTEGER,
	firstname VARCHAR(40),
	lastname VARCHAR(40),
	age INTEGER,
	PRIMARY key (uid),
	FOREIGN key (uid) REFERENCES User(uid) ON DELETE RESTRICT
)ENGINE = InnoDB;

/*---------------------------------------Job-------------------------------------------*/

CREATE TABLE Job(
	uid INTEGER,
	job_id INTEGER AUTO_INCREMENT,
	input varchar(500),
	tool_name varchar(40),
	status varchar(100),
	start_time time,
	finish_time time,
	FOREIGN KEY(uid) REFERENCES User(uid) ON DELETE CASCADE,
	PRIMARY KEY(job_id)
)ENGINE = InnoDB;

CREATE TABLE Error(
	job_id INTEGER,
	errCode INTEGER,
	description varchar(200),
	PRIMARY KEY(errCode),
	FOREIGN KEY(job_id) REFERENCES Job(job_id)
)ENGINE = InnoDB;

/*BLAST:
	db_name: name of the database
	(MySQL doesn't allow 'database' to be a column's name!)
*/
CREATE TABLE BLAST(
	db_name varchar(100),
	evalue varchar(100),
	job_id INTEGER,
	FOREIGN KEY (job_id) REFERENCES Job(job_id),
	PRIMARY KEY (job_id)
)ENGINE = InnoDB;

CREATE TABLE MitoLoc(
	specificity varchar(100),
	job_id INTEGER,
	FOREIGN KEY (job_id) REFERENCES Job(job_id),
	PRIMARY KEY (job_id)
)ENGINE = InnoDB;

/*Result: records the output of each job once it's done by the tool
*/
CREATE TABLE Result(
	output varchar(500),
	job_id INTEGER,
	FOREIGN KEY(job_id) REFERENCES Job(job_id), 
	PRIMARY KEY(job_id)
)ENGINE = InnoDB;
