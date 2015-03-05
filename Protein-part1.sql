DROP TABLE IF EXISTS protein_has_interaction;
DROP TABLE IF EXISTS protein_link_ensembleplant;
DROP TABLE IF EXISTS protein_link_refseq;
DROP TABLE IF EXISTS protein_link_uniprotKB;
DROP TABLE IF EXISTS EnsemblePlant;
DROP TABLE IF EXISTS RefSeq;
DROP TABLE IF EXISTS UniprotKB;
DROP TABLE IF EXISTS Protein;
DROP TABLE IF EXISTS Protein_interaction;


CREATE TABLE Protein(
        protein_internal_id INTEGER,
        name varchar(50),
        description varchar(200),
        organism varchar(100),
        sequence varchar(200),
        PRIMARY KEY(protein_internal_id)
)ENGINE=InnoDB;


CREATE TABLE Protein_interaction(
        fake_id INTEGER,
        detection_method varchar(100),
        interact_desc varchar(100),
        reference varchar(200),
        source varchar(100),
        PRIMARY KEY(fake_id)
)ENGINE=InnoDB;


CREATE TABLE protein_has_interaction(
        pid INTEGER,
        fake_id INTEGER,
        PRIMARY KEY(pid,fake_id),
        FOREIGN KEY(pid) REFERENCES Protein(protein_internal_id),
        FOREIGN KEY(fake_id) REFERENCES Protein_interaction(fake_id)
)ENGINE=InnoDB;


CREATE TABLE EnsemblePlant(
        ensemble_id INTEGER,
        PRIMARY KEY(ensemble_id)
)ENGINE=InnoDB;


CREATE TABLE RefSeq(

        refseq_id INTEGER,
        PRIMARY KEY(refseq_id)
)ENGINE=InnoDB;


CREATE TABLE UniprotKB(
        uniprot_id INTEGER,
        PRIMARY KEY(uniprot_id)
)ENGINE=InnoDB;


CREATE TABLE protein_link_ensembleplant(
        pid INTEGER,
        ensemble_id INTEGER,
        PRIMARY KEY(pid,ensemble_id),
        FOREIGN KEY(pid) REFERENCES Protein(protein_internal_id),
        FOREIGN KEY(ensemble_id) REFERENCES EnsemblePlant(ensemble_id)
)ENGINE=InnoDB;


CREATE TABLE protein_link_refseq(
        pid INTEGER,
        refseq_id INTEGER,
        PRIMARY KEY(pid,refseq_id),
        FOREIGN KEY(pid) REFERENCES Protein(protein_internal_id),
        FOREIGN KEY(refseq_id) REFERENCES RefSeq(refseq_id)
)ENGINE=InnoDB;


CREATE TABLE protein_link_uniprotKB(
        pid INTEGER,
        uniprot_id INTEGER,
        PRIMARY KEY(pid,uniprot_id),
        FOREIGN KEY(pid) REFERENCES Protein(protein_internal_id),
        FOREIGN KEY(uniprot_id) REFERENCES UniprotKB(uniprot_id)
)ENGINE=InnoDB;

