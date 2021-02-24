-- Filename: Hospital DDL.sql
-- Description: script to construct Hospital Staff Database
-- CST 8215
-- Author: Olutoni Oluwole
-- Today's Date: 28 Nov 2020

DROP TABLE IF EXISTS BILLS;
DROP TABLE IF EXISTS PATIENTS;
DROP TABLE IF EXISTS DOCTORS;
DROP TABLE IF EXISTS NURSES;
DROP TABLE IF EXISTS AILMENTS;

CREATE TABLE Ailments(
	ailment_ID CHAR (3) NOT NULL,
	diagnosis VARCHAR(15),
	major_symptoms VARCHAR(15) NOT NULL,
	UNIQUE (diagnosis),
	CONSTRAINT pk_ailment_no PRIMARY KEY (ailment_ID)
	);

CREATE TABLE Nurses(
	nurse_ID CHAR(5) NOT NULL,
	L_name VARCHAR(30) NOT NULL,
	F_name VARCHAR(30),
	specialty VARCHAR(15) NOT NULL,
	phone_number CHAR(10),

	CONSTRAINT nurse_ID PRIMARY KEY (nurse_ID)
	);

CREATE TABLE Doctors(
	doctor_ID CHAR(4) NOT NULL,
	L_name VARCHAR(30) NOT NULL,
	F_name VARCHAR(30) NOT NULL,
	gender CHAR(1),
	address VARCHAR(30),
	phone_number CHAR(10) NOT NULL,
	school VARCHAR(25),

	CONSTRAINT pk_doctors PRIMARY KEY (doctor_ID)
	);

CREATE TABLE Patients(
	patient_ID CHAR(5) NOT NULL,
	doctor_ID CHAR(4),
	nurse_ID CHAR(5),
	patient_L_name VARCHAR(20) NOT NULL,
	patient_F_name VARCHAR(20),
	ailment_ID CHAR(3),
	severity VARCHAR(10),
	admission_date DATE NOT NULL,
	address VARCHAR(30),
	phone_number CHAR(10),
	gender CHAR (1),

	CONSTRAINT pk_patients_ID PRIMARY KEY (patient_ID),
	CONSTRAINT fk_doctorid FOREIGN KEY (doctor_id) references Doctors(doctor_ID),
	CONSTRAINT fk_ailments FOREIGN KEY (ailment_ID) references Ailments(ailment_ID),
	CONSTRAINT fk_nurse FOREIGN KEY (nurse_ID) references Nurses(nurse_ID)
	);

CREATE TABLE Bills(
	bill_no 	CHAR(8) NOT NULL,
	patient_ID	CHAR(5),
	date 		DATE,
	amount 		DECIMAL NOT NULL,
	doctor_ID	CHAR(4),

	CONSTRAINT pk_bills_no PRIMARY KEY (bill_no),
	CONSTRAINT fk_doctor FOREIGN KEY (doctor_ID) references Doctors(doctor_ID),
	CONSTRAINT fk_patientid FOREIGN KEY (patient_ID) references Patients(patient_ID)
	);






	
