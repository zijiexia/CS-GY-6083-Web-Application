-- Hospital data 
insert into hospital values (101,'ABC Hospital', '7 Washington St','Melville','NY',11770);
insert into hospital values (102,'JAY Hospital', '8  New York Ave','Huntington','NY',11570);
insert into hospital values (103,'FirstCare Hospital', '2351 Main St','Hicksville','NY',11530);
insert into hospital values (104,'Wellness Hospital', '100 Wood Ave','Smithtown','NY',11450);
insert into hospital values (105,'JFK Hospital', '1233 Miller Place','Westbury','NY',11370);
insert into hospital values (106,'WDCARH Hospital', '530 James St','Long Beach','NY',11444);

-- Department data 
insert into department values (10,'Registration','999-999-9999',101);
insert into department values (11,'Registration','999-999-9999',106);
insert into department values (12,'Registration','999-999-9999',103);
insert into department values (13,'Academic','999-999-9999',106);
insert into department values (14,'Research','999-999-9999',106);
insert into department values (15,'Billing','999-999-9999',104);
insert into department values (16,'Disease Control','999-999-9999',105);
insert into department values (17,'Preventive Care','999-999-9999',102);
insert into department values (18,'Surgery','999-999-9999',102);

-- User data
insert into users values (1001,'KEVIN','WANG','DBA',11);
insert into users values (1002,'JIM','GALE','BA',12);
insert into users values (1003,'JIN','MA','RESEARCHER',14);
insert into users values (1004,'JOHN','MILLER','PROFESSOR',13);
insert into users values (1005,'ROBERT','GILSON','MANAGER',15);
insert into users values (1006,'JASON','RIGHT','DBA',16);
insert into users values (1007,'ANDY','CHANG','EXECUTIVE',18);
insert into users values (1008,'JESSICA','ROCKS','MANAGER',17);
insert into users values (1009,'LILY','LUE','DBA',18);
insert into users values (1010,'ALLYSA','SONG','MANAGER',13);

-- Physician Data

insert into physician values ( 10001, upper('JENYS'),'888-888-8888',upper('Psychiatry'),101);
insert into physician values ( 10002, upper('Henry'),'888-888-8888',upper('Cardiology'),102);
insert into physician values ( 10003, upper('Edward'), '888-888-8888',upper('Internal Medicine'),103); 
insert into physician values ( 10004, upper('Alvaro'), '888-888-8888',upper('Cardiology'),104);
insert into physician values ( 10005, upper('William'), '888-888-8888',upper('Gynecology'),105); 
insert into physician values ( 10006, upper('Naveen'), '888-888-8888',upper('Plastic Surgery'),106); 
insert into physician values ( 10007, upper('Kishan'), '888-888-8888',upper('Nephrology'),101);
insert into physician values ( 10008, upper('Alexander'), '888-888-8888',upper('General Surgery'),102);  
insert into physician values ( 10009, upper('Elana'), '888-888-8888',upper('Pediatrics'),103);  
insert into physician values ( 10010, upper('Richard'), '888-888-8888',upper('Cardiology'),104); 
insert into physician values ( 10011, upper('Jason'), '888-888-8888',upper('Psychiatry'),105); 
insert into physician values ( 10012, upper('Ranjana'), '888-888-8888',upper('Gynecology'),106); 

-- Disease Data

insert into disease values (100001,'RHEUMATIC FEVER');
insert into disease values (100002,'PULMONARY OEDEMA');
insert into disease values (100003,'HEART BLOCK ');
insert into disease values (100004,'ACUTE CORONARY SYNDROMES');
insert into disease values (100005,'PARASITE INFECTION');
insert into disease values (100006,'FUNGAL SKIN INFECTIONS');
insert into disease values (100007,'BACTERIAL SKIN INFECTION');
insert into disease values (100008,'OTHER SKIN DISEASES');
insert into disease values (100009,'GYNAECOLOGICAL MALIGNANCIES');
insert into disease values (100010,'CANCERS OF THE SKIN');
insert into disease values (100011,'GASTROINTESTINAL MALIGNANCIES');
insert into disease values (100012,'BREAST CANCER');
insert into disease values (100013,'GENITO-URINARY MALIGNANCY');
insert into disease values (100014,'PAEDIATRIC MALIGNANCY');
insert into disease values (100015,'ANAEMIA DURING PREGNANCY');
insert into disease values (100016,'DIABETES IN PREGNANCY');
insert into disease values (100017,'PREGNANCY AND LACTATION');
insert into disease values (100018,'KIDNEY DISEASES');
insert into disease values (100019,'MENTAL CONDITIONS');
insert into disease values (100020,'HYPERTENSION');

-- Treatment Data

insert into treatment values ( 1000001,'Benzathine Penicillin 1.2MU','PHARMA',100001);
insert into treatment values ( 1000002,'BPenicillin V (PO) 250mg','PHARMA',100001);
insert into treatment values ( 1000003,'Erythromycin 250mg 12hourly','PHARMA',100001);
insert into treatment values ( 1000004,'Furosemide 20 80mg','PHARMA',100002);
insert into treatment values ( 1000005,'Dialysis if renal failure','PROCEDURE',100002);
insert into treatment values ( 1000006,'Morphine 10 15 mg IM','PHARMA',100003);
insert into treatment values ( 1000007,'Adrenaline 1:10 000,5mL','PHARMA',100003);
insert into treatment values ( 1000008,'Admit ICU or CCU for monitoring','PROCEDURE',100004);
insert into treatment values ( 1000009,'ECG monitor & rhythm strip','PROCEDURE',100004);
insert into treatment values ( 1000010,'Flucloxacillin  500mg','PHARMA',100005);
insert into treatment values ( 1000011,'Miconazole cream 2%','PHARMA',100006);
insert into treatment values ( 1000012,'Benzoyl Benzoate Emulsion 25%','PHARMA',100007);
insert into treatment values ( 1000013,'Co-trimoxazole 960 mg','PHARMA',100008);
insert into treatment values ( 1000014,'Identify and treat specific cause','SURGERY',100012);
insert into treatment values ( 1000015,'Transplant','SURGERY',100018);

-- Patient Data

insert into patient values (900000001, 'JUN','WANG','M',CAST(date_add(SYSDATE(), interval -7200 day) AS DATE),'ASIAN','M');
insert into patient values (900000002, 'MICHAEL','SONG','M',CAST(date_add(SYSDATE(), interval -6200 day) AS DATE),'ASIAN','M');
insert into patient values (900000003, 'JESSICA','SMITH','F',CAST(date_add(SYSDATE(), interval -8200 day) AS DATE),'AFRICAN','M');
insert into patient values (900000004, 'JULIA','BROWN','F',CAST(date_add(SYSDATE(), interval -8000 day) AS DATE),'AFRICAN','W');
insert into patient values (900000005, 'TINA','DAVIS','F',CAST(date_add(SYSDATE(), interval -6000 day) AS DATE),'AFRICAN','S');
insert into patient values (900000006, 'HOSE','FLORES','M',CAST(date_add(SYSDATE(), interval -6500 day) AS DATE),'LATINO','M');
insert into patient values (900000007, 'SAM','FLORES','M',CAST(date_add(SYSDATE(), interval -7500 day) AS DATE),'LATINO','W');
insert into patient values (900000008, 'JOHN','HAMIAN','M',CAST(date_add(SYSDATE(), interval -5500 day) AS DATE),'AFRICAN','M');
insert into patient values (900000009, 'JAMES','GOLEY','M',CAST(date_add(SYSDATE(), interval -5200 day) AS DATE),'LATINO','M');
insert into patient values (900000010, 'NATASHA','SERGIO','F',CAST(date_add(SYSDATE(), interval -4200 day) AS DATE),'LATINO','S');
insert into patient values (900000011, 'OLIVER','SERGIO','M',CAST(date_add(SYSDATE(), interval -5200 day) AS DATE),'LATINO','M');
insert into patient values (900000012, 'PEDRO','MUCHANO','M',CAST(date_add(SYSDATE(), interval -8200 day) AS DATE),'LATINO','W');
insert into patient values (900000013, 'FENG','CAO','F',CAST(date_add(SYSDATE(), interval -6200 day) AS DATE),'ASIAN','M');

-- Patient_Treatment Data

insert into patient_treatment (tdate, tfreq, tstatus, pid, tid, phid) values (CAST(date_add(sysdate(), interval -200 day) AS DATE),1,'R',900000001,1000001,10001);
insert into patient_treatment (tdate, tfreq, tstatus, pid, tid, phid) values (CAST(date_add(sysdate(), interval -200 day) AS DATE),2,'R',900000001,1000001,10001);
insert into patient_treatment (tdate, tfreq, tstatus, pid, tid, phid) values (CAST(date_add(sysdate(), interval -200 day) AS DATE),3,'R',900000001,1000001,10001);
insert into patient_treatment (tdate, tfreq, tstatus, pid, tid, phid) values (CAST(date_add(sysdate(), interval -201 day) AS DATE),1,'R',900000001,1000001,10001);
insert into patient_treatment (tdate, tfreq, tstatus, pid, tid, phid) values (CAST(date_add(sysdate(), interval -201 day) AS DATE),2,'R',900000001,1000001,10001);
insert into patient_treatment (tdate, tfreq, tstatus, pid, tid, phid) values (CAST(date_add(sysdate(), interval -201 day) AS DATE),3,'R',900000001,1000001,10001);
insert into patient_treatment (tdate, tfreq, tstatus, pid, tid, phid) values (CAST(date_add(sysdate(), interval -190 day) AS DATE),1,'S',900000002,1000002,10002);
insert into patient_treatment (tdate, tfreq, tstatus, pid, tid, phid) values (CAST(date_add(sysdate(), interval -195 day) AS DATE),1,'F',900000003,1000003,10003);
insert into patient_treatment (tdate, tfreq, tstatus, pid, tid, phid) values (CAST(date_add(sysdate(), interval -196 day) AS DATE),1,'F',900000004,1000003,10003);
insert into patient_treatment (tdate, tfreq, tstatus, pid, tid, phid) values (CAST(date_add(sysdate(), interval -196 day) AS DATE),1,'R',900000005,1000004,10004);
insert into patient_treatment (tdate, tfreq, tstatus, pid, tid, phid) values (CAST(date_add(sysdate(), interval -196 day) AS DATE),2,'R',900000005,1000004,10004);
insert into patient_treatment (tdate, tfreq, tstatus, pid, tid, phid) values (CAST(date_add(sysdate(), interval -196 day) AS DATE),3,'R',900000005,1000004,10004);
insert into patient_treatment (tdate, tfreq, tstatus, pid, tid, phid) values (CAST(date_add(sysdate(), interval -196 day) AS DATE),4,'R',900000005,1000004,10004);
insert into patient_treatment (tdate, tfreq, tstatus, pid, tid, phid) values (CAST(date_add(sysdate(), interval -196 day) AS DATE),5,'R',900000005,1000004,10004);
insert into patient_treatment (tdate, tfreq, tstatus, pid, tid, phid) values (CAST(date_add(sysdate(), interval -210 day) AS DATE),1,'S',900000006,1000005,10005);
insert into patient_treatment (tdate, tfreq, tstatus, pid, tid, phid) values (CAST(date_add(sysdate(), interval -210 day) AS DATE),1,'S',900000006,1000006,10005);
insert into patient_treatment (tdate, tfreq, tstatus, pid, tid, phid) values (CAST(date_add(sysdate(), interval -220 day) AS DATE),1,'R',900000007,1000006,10006);
insert into patient_treatment (tdate, tfreq, tstatus, pid, tid, phid) values (CAST(date_add(sysdate(), interval -220 day) AS DATE),2,'R',900000007,1000006,10006);
insert into patient_treatment (tdate, tfreq, tstatus, pid, tid, phid) values (CAST(date_add(sysdate(), interval -220 day) AS DATE),3,'R',900000007,1000006,10006);
insert into patient_treatment (tdate, tfreq, tstatus, pid, tid, phid) values (CAST(date_add(sysdate(), interval -220 day) AS DATE),4,'R',900000007,1000006,10006);
insert into patient_treatment (tdate, tfreq, tstatus, pid, tid, phid) values (CAST(date_add(sysdate(), interval -220 day) AS DATE),5,'R',900000007,1000006,10006);
insert into patient_treatment (tdate, tfreq, tstatus, pid, tid, phid) values (CAST(date_add(sysdate(), interval -220 day) AS DATE),6,'R',900000007,1000006,10006);
insert into patient_treatment (tdate, tfreq, tstatus, pid, tid, phid) values (CAST(date_add(sysdate(), interval -220 day) AS DATE),7,'R',900000007,1000006,10006);
insert into patient_treatment (tdate, tfreq, tstatus, pid, tid, phid) values (CAST(date_add(sysdate(), interval -240 day) AS DATE),1,'S',900000008,1000007,10007);
insert into patient_treatment (tdate, tfreq, tstatus, pid, tid, phid) values (CAST(date_add(sysdate(), interval -245 day) AS DATE),1,'S',900000009,1000008,10008);
insert into patient_treatment (tdate, tfreq, tstatus, pid, tid, phid) values (CAST(date_add(sysdate(), interval -255 day) AS DATE),1,'S',900000010,1000009,10009);
insert into patient_treatment (tdate, tfreq, tstatus, pid, tid, phid) values (CAST(date_add(sysdate(), interval -250 day) AS DATE),1,'R',900000011,1000010,10010);
insert into patient_treatment (tdate, tfreq, tstatus, pid, tid, phid) values (CAST(date_add(sysdate(), interval -250 day) AS DATE),2,'R',900000011,1000010,10010);
insert into patient_treatment (tdate, tfreq, tstatus, pid, tid, phid) values (CAST(date_add(sysdate(), interval -250 day) AS DATE),3,'R',900000011,1000010,10010);
insert into patient_treatment (tdate, tfreq, tstatus, pid, tid, phid) values (CAST(date_add(sysdate(), interval -250 day) AS DATE),4,'R',900000011,1000010,10010);
insert into patient_treatment (tdate, tfreq, tstatus, pid, tid, phid) values (CAST(date_add(sysdate(), interval -251 day) AS DATE),1,'F',900000011,1000014,10010);
insert into patient_treatment (tdate, tfreq, tstatus, pid, tid, phid) values (CAST(date_add(sysdate(), interval -251 day) AS DATE),1,'S',900000013,1000015,10008);
insert into patient_treatment (tdate, tfreq, tstatus, pid, tid, phid) values (CAST(date_add(sysdate(), interval -252 day) AS DATE),1,'R',900000012,1000013,10012);
insert into patient_treatment (tdate, tfreq, tstatus, pid, tid, phid) values (CAST(date_add(sysdate(), interval -252 day) AS DATE),2,'R',900000012,1000013,10012);
insert into patient_treatment (tdate, tfreq, tstatus, pid, tid, phid) values (CAST(date_add(sysdate(), interval -252 day) AS DATE),3,'R',900000012,1000013,10012);

COMMIT;


