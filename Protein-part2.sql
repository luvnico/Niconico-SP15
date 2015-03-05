/*Gene Ontology:
	model: can only be one of the 3 types - biological process/ molecular function/ cellular component.
	evidence: can be IEA/ISO/IDA/TAS/IMP/...
	term name: GO Term name, like M Band/ A Band/ Heart Growth/ ...
*/

CREATE TABLE Gene_Ontology(
	pid INTEGER,
	model varchar(20),
	GOId INTEGER,
	evidence varchar(10),
	term_name varchar(30),
	FOREIGN KEY(pid) REFERENCES Protein(pid),
	PRIMARY KEY(GOId)
)ENGINE = innoDB;

/* Sub-cellular Location: Provides information on the location and the topology of the mature protein in the cell.
*/
CREATE TABLE Subcellular_Location(
	pid INTEGER,
	locationId INTEGER,
	information varchar(200),
	FOREIGN KEY(pid) REFERENCES Protein(pid),
	PRIMARY KEY(locationId)
)ENGINE = innoDB;
