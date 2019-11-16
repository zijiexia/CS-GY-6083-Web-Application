-- Generated by Oracle SQL Developer Data Modeler 17.4.0.355.2121
--   at:        2019-11-16 11:09:46 EST
--   site:      Oracle Database 12cR2
--   type:      Oracle Database 12cR2



CREATE TABLE department (
    did     TINYINT NOT NULL COMMENT 'Department ID',
    dname   VARCHAR(20) NOT NULL COMMENT 'Department name',
    dtel    VARCHAR(12) NOT NULL COMMENT 'Department contact number',
    hid     SMALLINT NOT NULL COMMENT 'Hospital unique id'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN department.did IS
    'Department ID'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN department.dname IS
    'Department name'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN department.dtel IS
    'Department contact number'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN department.hid IS
    'Hospital unique id'; */

ALTER TABLE department ADD CONSTRAINT department_pk PRIMARY KEY ( did );

CREATE TABLE disease (
    deid    INT NOT NULL COMMENT 'Disease unique id',
    dname   VARCHAR(30) NOT NULL COMMENT 'Disease''s name'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN disease.deid IS
    'Disease unique id'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN disease.dname IS
    'Disease''s name'; */

ALTER TABLE disease ADD CONSTRAINT disease_pk PRIMARY KEY ( deid );

CREATE TABLE hospital (
    hid           SMALLINT NOT NULL COMMENT 'Hospital unique id',
    hname         VARCHAR(30) NOT NULL COMMENT 'Name of the hospital',
    hst_address   VARCHAR(30) NOT NULL COMMENT 'Street where the hospital located',
    hst_city      VARCHAR(30) NOT NULL COMMENT 'City address of the hospital',
    hstate        VARCHAR(20) NOT NULL COMMENT 'State of the hospital',
    hzip          INT NOT NULL COMMENT 'zipcode of the hospital'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN hospital.hid IS
    'Hospital unique id'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN hospital.hname IS
    'Name of the hospital'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN hospital.hst_address IS
    'Street where the hospital located'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN hospital.hst_city IS
    'City address of the hospital'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN hospital.hstate IS
    'State of the hospital'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN hospital.hzip IS
    'zipcode of the hospital'; */

ALTER TABLE hospital ADD CONSTRAINT hospital_pk PRIMARY KEY ( hid );

CREATE TABLE patient (
    pid       BIGINT NOT NULL COMMENT 'Unique patient id',
    pfname    VARCHAR(30) NOT NULL COMMENT 'Family name of the patient',
    plname    VARCHAR(20) NOT NULL COMMENT 'Last name of the patient',
    pgender   CHAR(1) NOT NULL COMMENT 'Gender of the patient',
    pbd       DATETIME NOT NULL COMMENT 'Patient''s birthday',
    prace     VARCHAR(20) COMMENT 'Race of the patient',
    pstatus   CHAR(1) NOT NULL COMMENT 'Patient''s status'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN patient.pid IS
    'Unique patient id'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN patient.pfname IS
    'Family name of the patient'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN patient.plname IS
    'Last name of the patient'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN patient.pgender IS
    'Gender of the patient'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN patient.pbd IS
    'Patient''s birthday'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN patient.prace IS
    'Race of the patient'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN patient.pstatus IS
    'Patient''s status'; */

ALTER TABLE patient ADD CONSTRAINT patient_pk PRIMARY KEY ( pid );

CREATE TABLE patient_treatment (
    tdate     DATETIME NOT NULL COMMENT 'The date that the patient took the treatment',
    tfreq     TINYINT NOT NULL COMMENT 'Frequency that the patient take the treatment',
    tstatus   CHAR(1) COMMENT 'Current status of the patient under this treatment',
    phid      INT NOT NULL COMMENT 'Physician unique id',
    pid       BIGINT NOT NULL COMMENT 'Patient unique id',
    tid       INT NOT NULL COMMENT 'Treatment unique id'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN patient_treatment.tdate IS
    'The date that the patient took the treatment'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN patient_treatment.tfreq IS
    'Frequency that the patient take the treatment'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN patient_treatment.tstatus IS
    'Current status of the patient under this treatment'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN patient_treatment.phid IS
    'Physician unique id'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN patient_treatment.pid IS
    'Patient unique id'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN patient_treatment.tid IS
    'Treatment unique id'; */

CREATE TABLE physician (
    phid      INT NOT NULL COMMENT 'Unique id for the physician ',
    phfname   VARCHAR(30) NOT NULL COMMENT 'Physician''s family name',
    phtel     VARCHAR(12) NOT NULL COMMENT 'Physician''s phone number',
    phspl     VARCHAR(30) NOT NULL COMMENT 'Specialization of the physician',
    hid       SMALLINT NOT NULL COMMENT 'Hospital unique id'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN physician.phid IS
    'Unique id for the physician '; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN physician.phfname IS
    'Physician''s family name'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN physician.phtel IS
    'Physician''s phone number'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN physician.phspl IS
    'Specialization of the physician'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN physician.hid IS
    'Hospital unique id'; */

ALTER TABLE physician ADD CONSTRAINT physician_pk PRIMARY KEY ( phid );

CREATE TABLE treatment (
    tid     INT NOT NULL COMMENT 'Unique treatment id',
    tname   VARCHAR(50) NOT NULL COMMENT 'Treatment name',
    ttype   VARCHAR(10) NOT NULL COMMENT 'Treatment type',
    deid    INT NOT NULL COMMENT 'Foreign key of the disease table'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN treatment.tid IS
    'Unique treatment id'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN treatment.tname IS
    'Treatment name'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN treatment.ttype IS
    'Treatment type'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN treatment.deid IS
    'Foreign key of the disease table'; */

ALTER TABLE treatment ADD CONSTRAINT treatment_pk PRIMARY KEY ( tid );

CREATE TABLE users (
    usid     SMALLINT NOT NULL COMMENT 'User id ',
    ufname   VARCHAR(20) NOT NULL COMMENT 'User family name',
    ulname   VARCHAR(20) NOT NULL COMMENT 'Last name of the user',
    urole    VARCHAR(20) NOT NULL COMMENT 'The role of this user',
    did      TINYINT NOT NULL COMMENT 'Department unique id'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN users.usid IS
    'User id '; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN users.ufname IS
    'User family name'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN users.ulname IS
    'Last name of the user'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN users.urole IS
    'The role of this user'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN users.did IS
    'Department unique id'; */

ALTER TABLE users ADD CONSTRAINT users_pk PRIMARY KEY ( usid );

ALTER TABLE department
    ADD CONSTRAINT department_hospital_fk FOREIGN KEY ( hid )
        REFERENCES hospital ( hid );

ALTER TABLE patient_treatment
    ADD CONSTRAINT patient_treatment_patient_fk FOREIGN KEY ( pid )
        REFERENCES patient ( pid );

ALTER TABLE patient_treatment
    ADD CONSTRAINT patient_treatment_physician_fk FOREIGN KEY ( phid )
        REFERENCES physician ( phid );

ALTER TABLE patient_treatment
    ADD CONSTRAINT patient_treatment_treatment_fk FOREIGN KEY ( tid )
        REFERENCES treatment ( tid );

ALTER TABLE physician
    ADD CONSTRAINT physician_hospital_fk FOREIGN KEY ( hid )
        REFERENCES hospital ( hid );

ALTER TABLE treatment
    ADD CONSTRAINT treatment_disease_fk FOREIGN KEY ( deid )
        REFERENCES disease ( deid );

ALTER TABLE users
    ADD CONSTRAINT users_department_fk FOREIGN KEY ( did )
        REFERENCES department ( did );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             0
-- ALTER TABLE                             14
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0