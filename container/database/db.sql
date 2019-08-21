#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------

use aubonbeurre;

#------------------------------------------------------------
# Table: SYSTEM_DETAILS
#------------------------------------------------------------

CREATE TABLE SYSTEM_DETAILS(
        id                         Int  Auto_increment  NOT NULL ,
        tank_temperature           Float NOT NULL ,
        outside_temperature        Float NOT NULL ,
        milk_weight                Float NOT NULL ,
        measure_pH                 Float NOT NULL ,
        measure_Kplus              Int NOT NULL ,
        NaCI_concentration         Float NOT NULL ,
        salmonelle_bacterian_level Int NOT NULL ,
        E_coli_bacterian_level     Int NOT NULL ,
        niveau_bacterien_Listeria  Int NOT NULL ,
        system_main_number         Varchar (50) NOT NULL
	,CONSTRAINT SYSTEM_DETAILS_AK UNIQUE (system_main_number)
	,CONSTRAINT SYSTEM_DETAILS_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: SYSTEM_MAIN
#------------------------------------------------------------

CREATE TABLE SYSTEM_MAIN(
        id                  Int  Auto_increment  NOT NULL ,
        system_number       Varchar (255) NOT NULL ,
        number_type         Varchar (255) NOT NULL ,
        product_unit_number Varchar (50) NOT NULL
	,CONSTRAINT SYSTEM_MAIN_AK UNIQUE (product_unit_number)
	,CONSTRAINT SYSTEM_MAIN_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: JOB
#------------------------------------------------------------

CREATE TABLE JOB(
        id    Int  Auto_increment  NOT NULL ,
        label Varchar (50) NOT NULL
	,CONSTRAINT JOB_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: USERS
#------------------------------------------------------------

CREATE TABLE USERS(
        id_users   Int  Auto_increment  NOT NULL ,
        username   Varchar (255) NOT NULL ,
        password   Varchar (255) NOT NULL ,
        job_label  Varchar (255) NOT NULL ,
        p_u_number Varchar (255) NOT NULL ,
        id         Int NOT NULL ,
        id_JOB     Int NOT NULL
	,CONSTRAINT USERS_AK0 UNIQUE (job_label,p_u_number)
	,CONSTRAINT USERS_PK PRIMARY KEY (id_users)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: PRODUCTION_UNIT
#------------------------------------------------------------

CREATE TABLE PRODUCTION_UNIT(
        id          Int  Auto_increment  NOT NULL ,
        unit_number Int NOT NULL ,
        id_users    Int
	,CONSTRAINT PRODUCTION_UNIT_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: SUITABLE
#------------------------------------------------------------

CREATE TABLE SUITABLE(
        id                 Int NOT NULL ,
        id_PRODUCTION_UNIT Int NOT NULL
	,CONSTRAINT SUITABLE_PK PRIMARY KEY (id,id_PRODUCTION_UNIT)
)ENGINE=InnoDB;




ALTER TABLE USERS
	ADD CONSTRAINT USERS_PRODUCTION_UNIT0_FK
	FOREIGN KEY (id)
	REFERENCES PRODUCTION_UNIT(id);

ALTER TABLE USERS
	ADD CONSTRAINT USERS_JOB1_FK
	FOREIGN KEY (id_JOB)
	REFERENCES JOB(id);

ALTER TABLE USERS
	ADD CONSTRAINT USERS_PRODUCTION_UNIT0_AK
	UNIQUE (id);

ALTER TABLE PRODUCTION_UNIT
	ADD CONSTRAINT PRODUCTION_UNIT_USERS0_FK
	FOREIGN KEY (id_users)
	REFERENCES USERS(id_users);

ALTER TABLE PRODUCTION_UNIT
	ADD CONSTRAINT PRODUCTION_UNIT_USERS0_AK
	UNIQUE (id_users);

ALTER TABLE SUITABLE
	ADD CONSTRAINT SUITABLE_SYSTEM_MAIN0_FK
	FOREIGN KEY (id)
	REFERENCES SYSTEM_MAIN(id);

ALTER TABLE SUITABLE
	ADD CONSTRAINT SUITABLE_PRODUCTION_UNIT1_FK
	FOREIGN KEY (id_PRODUCTION_UNIT)
	REFERENCES PRODUCTION_UNIT(id);
