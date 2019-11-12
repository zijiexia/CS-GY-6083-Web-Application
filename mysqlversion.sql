CREATE TABLE department (
    did     TINYINT NOT NULL,
    dname   VARCHAR(20) NOT NULL,
    dtel    VARCHAR(13) NOT NULL,
    hid     SMALLINT NOT NULL
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
    deid    INT NOT NULL,
    dname   VARCHAR(30) NOT NULL
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN disease.deid IS
    'Disease unique id'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN disease.dname IS
    'Disease''s name'; */

ALTER TABLE disease ADD CONSTRAINT disease_pk PRIMARY KEY ( deid );

CREATE TABLE hospital (
    hid           SMALLINT NOT NULL,
    hname         VARCHAR(30) NOT NULL,
    hst_address   VARCHAR(30) NOT NULL,
    hst_city      VARCHAR(30) NOT NULL,
    hstate        VARCHAR(20) NOT NULL,
    hzip          INT NOT NULL
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
    pid       BIGINT NOT NULL,
    pfname    VARCHAR(30) NOT NULL,
    plname    VARCHAR(20) NOT NULL,
    pgender   CHAR(1) NOT NULL,
    pbd       DATETIME NOT NULL,
    prace     VARCHAR(20),
    pstatus   CHAR(1) NOT NULL
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
    tdate     DATETIME NOT NULL,
    tfreq     BIGINT NOT NULL,
    tstatus   CHAR(1),
    phid      INT NOT NULL,
    pid       BIGINT NOT NULL,
    tid       BIGINT NOT NULL
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
    phid      INT NOT NULL,
    phfname   VARCHAR(30) NOT NULL,
    phtel     VARCHAR(13) NOT NULL,
    phspl     VARCHAR(30) NOT NULL,
    hid       SMALLINT NOT NULL
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
    tid     BIGINT NOT NULL,
    tname   VARCHAR(50) NOT NULL,
    ttype   VARCHAR(10) NOT NULL,
    deid    INT NOT NULL
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
    usid    SMALLINT NOT NULL,
    ufname   VARCHAR(20) NOT NULL,
    ulname   VARCHAR(20) NOT NULL,
    urole    VARCHAR(20) NOT NULL,
    did      TINYINT NOT NULL
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN users."UID" IS
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
