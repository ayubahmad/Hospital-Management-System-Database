CREATE TABLE DOCTOR(
    doc_id INT not null,
    doc_name VARCHAR2(50) not null,
    date_of_joining date,
    Primary key (doc_id),
    d_id INT,
    FOREIGN KEY (d_id) REFERENCES DEPARTMENT (d_id)
    );
CREATE TABLE PATIENT(
    p_id INT not null,
    p_name VARCHAR2(50) not null,
    p_fathername VARCHAR2(50),
    r_id INT,
    Primary key (p_id),
    FOREIGN KEY (r_id) REFERENCES ROOM (r_id)
    );
CREATE TABLE APPOINTMENT(
    appoint_id INT,
    appointment_time TIMESTAMP WITH LOCAL TIME ZONE,
    doc_id INT,
    p_id INT,
    PRIMARY KEY (appoint_id),
    FOREIGN KEY (doc_id) REFERENCES DOCTOR (doc_id),
    FOREIGN KEY (p_id) REFERENCES PATIENT (p_id)
    );
CREATE TABLE PRESCRIPTION(
    prec_id INT NOT NULL,
    Primary key (prec_id),
    appoint_id INT,
    FOREIGN KEY (appoint_id) REFERENCES APPOINTMENT (appoint_id)
    );
CREATE TABLE PRESCRIBEDMEDICINE(
    med_id INT,
    prec_id INT,
    FOREIGN KEY (med_id) REFERENCES MEDICINE (med_id),
    FOREIGN KEY (prec_id) REFERENCES PRESCRIPTION (prec_id),
    primary key(med_id,prec_id)
    );
CREATE TABLE MEDICINE(
    med_id INT not null,
    med_name VARCHAR2(50) not null,
    company_name VARCHAR2(50) not null,
    Primary key (med_id)
    );

CREATE TABLE ROOM(
    r_id INT,
    r_type VARCHAR2(50) not null,
    Primary key (r_id),
    b_id INT,
    FOREIGN KEY (b_id) REFERENCES HOS_BLOCK (b_id)
    );

CREATE TABLE DEPARTMENT(
    d_id INT not null,
    d_name VARCHAR2(50) not null,
    d_location VARCHAR2(100),
    Primary key (d_id)
    );
CREATE TABLE HOS_BLOCK(
    b_id INT,
    b_name VARCHAR2(50) not null,
    Primary key (b_id)
    );
CREATE TABLE TREATMENT(
    t_id INT,
    t_name VARCHAR2(50) not null,
    t_cost INT,
    Primary key (t_id)
    );
CREATE TABLE SPECIALIZATION(
    certification_date date,
    doc_id INT,
    FOREIGN KEY (doc_id) REFERENCES DOCTOR (doc_id),
    t_id INT,
    FOREIGN KEY (t_id) REFERENCES TREATMENT (t_id),
    Primary key (doc_id,t_id)
    );

CREATE TABLE NURSE(
    n_id INT,
    n_name VARCHAR2(50) not null,
    date_of_joining date,
    Primary key (n_id)
    );
CREATE TABLE NURSEINTREATMENT(
    n_id INT,
    FOREIGN KEY (n_id) REFERENCES NURSE (n_id),
    t_id INT,
    FOREIGN KEY (t_id) REFERENCES TREATMENT (t_id),
    Primary key (n_id,t_id)
    );
    
CREATE TABLE DUTYINBLOCK(
    b_id INT,
    FOREIGN KEY (b_id) REFERENCES HOS_BLOCK (b_id),
    n_id INT,
    FOREIGN KEY (n_id) REFERENCES NURSE (n_id),
    Primary key (n_id,b_id)
    );
    
    
    
    
INSERT INTO NURSE VALUES (1,'Amina', '01-JAN-1999');
INSERT INTO NURSE VALUES (2,'Isha', '09-NOV-2000');
INSERT INTO NURSE VALUES (3,'Ayesha', '10-DEC-2020');
INSERT INTO NURSE VALUES (4,'Zainab', '21-FEB-2001');
INSERT INTO NURSE VALUES (5,'Mamona', '16-MAR-2016');

INSERT INTO treatment VALUES (1,'Gene therapy?', 50000);
INSERT INTO treatment VALUES (2,'Renal dialysis?', 30000);
INSERT INTO treatment VALUES (3,'Treatment of sleep disorders?', 15000);
INSERT INTO treatment VALUES (4,'Cancer treatments?', 240000);
INSERT INTO treatment VALUES (5,'Drugs Treatment', 5000);

INSERT INTO hos_block VALUES (1,'Quaid-e-Azam Block');
INSERT INTO hos_block VALUES (2,'Dr. Abdul Qadir Block');
INSERT INTO hos_block VALUES (3,'Sikandar Block');
INSERT INTO hos_block VALUES (4,'Himmani Block');
INSERT INTO hos_block VALUES (5,'New Block');

INSERT INTO room VALUES (1,'Economy', 5);
INSERT INTO room VALUES (2,'AC', 3);
INSERT INTO room VALUES (3,'Economy', 4);
INSERT INTO room VALUES (4,'Professional', 1);
INSERT INTO room VALUES (5,'Economy Plus', 2);

INSERT INTO patient VALUES (1,'Ajmal','Arshad', 2);
INSERT INTO patient VALUES (2,'Saeed','Ajmal', 3);
INSERT INTO patient VALUES (3,'Aqsa','Parveeen', 1);
INSERT INTO patient VALUES (4,'Maryam','Orangzaib', 5);
INSERT INTO patient VALUES (5,'Kameel','Jonson', 4);

INSERT INTO department VALUES (1,'Cardiology', 'Dr. Abdul Qadeer Block');
INSERT INTO department VALUES (2,'General Surgery', 'Himmani Block');
INSERT INTO department VALUES (3,'Neuorology', 'New Block');
INSERT INTO department VALUES (4,'Sexual Health', 'Sikandar Block');
INSERT INTO department VALUES (5,'Orthopedics', 'Quaid-e-Azam Block');

INSERT INTO doctor VALUES (1,'Haroon Akram', '06-JAN-2003',5);
INSERT INTO doctor VALUES (2,'Abdullah Rana', '03-DEC-2010',4);
INSERT INTO doctor VALUES (3,'Reshaeel Nisar', '10-DEC-2009',1);
INSERT INTO doctor VALUES (4,'Talha Munir', '10-SEP-2001',3);
INSERT INTO doctor VALUES (5,'Fahad Hassan', '13-AUG-2016',2);

INSERT INTO specialization VALUES ('26-FEB-2004',3,2);
INSERT INTO specialization VALUES ('13-JUL-1998',1,3);
INSERT INTO specialization VALUES ('02-DEC-2014',5,4);
INSERT INTO specialization VALUES ('18-NOV-2019',4,5);
INSERT INTO specialization VALUES ('21-SEP-2018',2,1);

INSERT INTO nurseintreatment VALUES (2,5);
INSERT INTO nurseintreatment VALUES (1,3);
INSERT INTO nurseintreatment VALUES (3,2);
INSERT INTO nurseintreatment VALUES (5,4);
INSERT INTO nurseintreatment VALUES (4,1);

INSERT INTO dutyinblock VALUES (3,4);
INSERT INTO dutyinblock VALUES (2,1);
INSERT INTO dutyinblock VALUES (1,5);
INSERT INTO dutyinblock VALUES (4,2);
INSERT INTO dutyinblock VALUES (5,3);

INSERT INTO appointment VALUES (1,CURRENT_TIMESTAMP,3,4);
INSERT INTO appointment VALUES (2,CURRENT_TIMESTAMP,4,5);
INSERT INTO appointment VALUES (3,CURRENT_TIMESTAMP,1,3);
INSERT INTO appointment VALUES (4,CURRENT_TIMESTAMP,2,1);
INSERT INTO appointment VALUES (5,CURRENT_TIMESTAMP,5,2);

INSERT INTO prescription VALUES (1,3);
INSERT INTO prescription VALUES (2,4);
INSERT INTO prescription VALUES (3,1);
INSERT INTO prescription VALUES (4,5);
INSERT INTO prescription VALUES (5,2);

INSERT INTO medicine VALUES (1,'aripiprazole','Abilify');
INSERT INTO medicine VALUES (2,'albumin-bound paclitaxel','Abraxane');
INSERT INTO medicine VALUES (3,'isotretinoin capsule','Absorica');
INSERT INTO medicine VALUES (4,'quinapril HCI','Accupril');
INSERT INTO medicine VALUES (5,'quinapril/HCTZ tablet','Accuretic');

INSERT INTO prescribedmedicine VALUES (5,4);
INSERT INTO prescribedmedicine VALUES (3,5);
INSERT INTO prescribedmedicine VALUES (2,1);
INSERT INTO prescribedmedicine VALUES (1,3);
INSERT INTO prescribedmedicine VALUES (4,2);