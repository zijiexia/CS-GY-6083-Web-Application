-- 生成者Oracle SQL Developer Data Modeler 17.4.0.355.2121
--   时间:        2019-11-11 22:39:52 EST
--   站点:      Oracle Database 12cR2
--   类型:      Oracle Database 12cR2



CREATE TABLE department (
    did     NUMBER(2) NOT NULL,
    dname   VARCHAR2(20) NOT NULL,
    dtel    VARCHAR2(13) NOT NULL,
    hid     NUMBER(3) NOT NULL
);

COMMENT ON COLUMN department.did IS
    'Department ID';

COMMENT ON COLUMN department.dname IS
    'Department name';

COMMENT ON COLUMN department.dtel IS
    'Department contact number';

COMMENT ON COLUMN department.hid IS
    'Hospital unique id';

ALTER TABLE department ADD CONSTRAINT department_pk PRIMARY KEY ( did );

CREATE TABLE disease (
    deid    NUMBER(6) NOT NULL,
    dname   VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN disease.deid IS
    'Disease unique id';

COMMENT ON COLUMN disease.dname IS
    'Disease''s name';

ALTER TABLE disease ADD CONSTRAINT disease_pk PRIMARY KEY ( deid );

CREATE TABLE hospital (
    hid           NUMBER(3) NOT NULL,
    hname         VARCHAR2(30) NOT NULL,
    hst_address   VARCHAR2(30) NOT NULL,
    hst_city      VARCHAR2(30) NOT NULL,
    hstate        VARCHAR2(20) NOT NULL,
    hzip          NUMBER(5) NOT NULL
);

COMMENT ON COLUMN hospital.hid IS
    'Hospital unique id';

COMMENT ON COLUMN hospital.hname IS
    'Name of the hospital';

COMMENT ON COLUMN hospital.hst_address IS
    'Street where the hospital located';

COMMENT ON COLUMN hospital.hst_city IS
    'City address of the hospital';

COMMENT ON COLUMN hospital.hstate IS
    'State of the hospital';

COMMENT ON COLUMN hospital.hzip IS
    'zipcode of the hospital';

ALTER TABLE hospital ADD CONSTRAINT hospital_pk PRIMARY KEY ( hid );

CREATE TABLE patient (
    pid       NUMBER(9) NOT NULL,
    pfname    VARCHAR2(30) NOT NULL,
    plname    VARCHAR2(20) NOT NULL,
    pgender   CHAR(1) NOT NULL,
    pbd       DATE NOT NULL,
    prace     VARCHAR2(20),
    pstatus   CHAR(1) NOT NULL
);

COMMENT ON COLUMN patient.pid IS
    'Unique patient id';

COMMENT ON COLUMN patient.pfname IS
    'Family name of the patient';

COMMENT ON COLUMN patient.plname IS
    'Last name of the patient';

COMMENT ON COLUMN patient.pgender IS
    'Gender of the patient';

COMMENT ON COLUMN patient.pbd IS
    'Patient''s birthday';

COMMENT ON COLUMN patient.prace IS
    'Race of the patient';

COMMENT ON COLUMN patient.pstatus IS
    'Patient''s status';

ALTER TABLE patient ADD CONSTRAINT patient_pk PRIMARY KEY ( pid );

CREATE TABLE patient_treatment (
    tdate     DATE NOT NULL,
    tfreq     NUMBER(9) NOT NULL,
    tstatus   CHAR(1),
    phid      NUMBER(5) NOT NULL,
    pid       NUMBER(9) NOT NULL,
    tid       NUMBER(10) NOT NULL
);

COMMENT ON COLUMN patient_treatment.tdate IS
    'The date that the patient took the treatment';

COMMENT ON COLUMN patient_treatment.tfreq IS
    'Frequency that the patient take the treatment';

COMMENT ON COLUMN patient_treatment.tstatus IS
    'Current status of the patient under this treatment';

COMMENT ON COLUMN patient_treatment.phid IS
    'Physician unique id';

COMMENT ON COLUMN patient_treatment.pid IS
    'Patient unique id';

COMMENT ON COLUMN patient_treatment.tid IS
    'Treatment unique id';

CREATE TABLE physician (
    phid      NUMBER(5) NOT NULL,
    phfname   VARCHAR2(30) NOT NULL,
    phtel     VARCHAR2(13) NOT NULL,
    phspl     VARCHAR2(30) NOT NULL,
    hid       NUMBER(3) NOT NULL
);

COMMENT ON COLUMN physician.phid IS
    'Unique id for the physician ';

COMMENT ON COLUMN physician.phfname IS
    'Physician''s family name';

COMMENT ON COLUMN physician.phtel IS
    'Physician''s phone number';

COMMENT ON COLUMN physician.phspl IS
    'Specialization of the physician';

COMMENT ON COLUMN physician.hid IS
    'Hospital unique id';

ALTER TABLE physician ADD CONSTRAINT physician_pk PRIMARY KEY ( phid );

CREATE TABLE treatment (
    tid     NUMBER(10) NOT NULL,
    tname   VARCHAR2(50) NOT NULL,
    ttype   VARCHAR2(10) NOT NULL,
    deid    NUMBER(6) NOT NULL
);

COMMENT ON COLUMN treatment.tid IS
    'Unique treatment id';

COMMENT ON COLUMN treatment.tname IS
    'Treatment name';

COMMENT ON COLUMN treatment.ttype IS
    'Treatment type';

COMMENT ON COLUMN treatment.deid IS
    'Foreign key of the disease table';

ALTER TABLE treatment ADD CONSTRAINT treatment_pk PRIMARY KEY ( tid );

CREATE TABLE users (
    "UID"    NUMBER(4) NOT NULL,
    ufname   VARCHAR2(20) NOT NULL,
    ulname   VARCHAR2(20) NOT NULL,
    urole    VARCHAR2(20) NOT NULL,
    did      NUMBER(2) NOT NULL
);

COMMENT ON COLUMN users."UID" IS
    'User id ';

COMMENT ON COLUMN users.ufname IS
    'User family name';

COMMENT ON COLUMN users.ulname IS
    'Last name of the user';

COMMENT ON COLUMN users.urole IS
    'The role of this user';

COMMENT ON COLUMN users.did IS
    'Department unique id';

ALTER TABLE users ADD CONSTRAINT users_pk PRIMARY KEY ( "UID" );

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



-- Oracle SQL Developer Data Modeler 概要报告: 
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
