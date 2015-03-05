DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS User_log;
DROP TABLE IF EXISTS Authentication;
DROP TABLE IF EXISTS Security;
DROP TABLE IF EXISTS User_level;
DROP TABLE IF EXISTS user_has_log;
DROP TABLE IF EXISTS Institution;
DROP TABLE IF EXISTS Individual;

CREATE TABLE User
( uid INT auto_increment,
address VARCHAR(40),
city VARCHAR(20),
state VARCHAR(20),
zipcode VARCHAR(10),
member_since DATE,
username VARCHAR(10),
email VARCHAR(30),
primary key (uid))engine = InnoDB;

CREATE TABLE User_log
(lid INT auto_increment,
action VARCHAR(20),
ip_address VARCHAR(15),
time TIMESTAMP,
primary key(lid))engine=InnoDB;

CREATE TABLE Authentication
(uid INT,
salt VARCHAR(40),
hashed_password VARCHAR(50),
PRIMARY KEY (uid),
foreign key (uid) references User(uid) ON DELETE CASCADE)engine=InnoDB;

CREATE TABLE Security
(uid INT,
question VARCHAR(50),
answer VARCHAR(50),
PRIMARY KEY (uid),
foreign key (uid) references User(uid) ON DELETE CASCADE)engine=InnoDB;

CREATE TABLE User_level
(uid INT,
priority VARCHAR(50),
verify VARCHAR(50),
PRIMARY KEY (uid),
foreign key (uid) references User(uid) ON DELETE CASCADE)engine=InnoDB;

CREATE TABLE user_has_log
(uid INT,
lid INT,
PRIMARY KEY(uid,lid),
FOREIGN KEY(uid) REFERENCES User(uid),
FOREIGN KEY(lid) REFERENCES User_log(lid))engine=InnoDB;

CREATE TABLE Institution
( uid INT,
name VARCHAR(40),
primary key (uid),
foreign key (uid) references User(uid) ON DELETE RESTRICT)engine = InnoDB;

CREATE TABLE Individual
( uid INT,
firstname VARCHAR(40),
lastname VARCHAR(40),
age INT,
primary key (uid),
foreign key (uid) references User(uid) ON DELETE RESTRICT)engine = InnoDB;
