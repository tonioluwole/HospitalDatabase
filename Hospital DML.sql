-- Filename: Hospital DML.sql
-- Description: script to populate Hospital Database Tables
-- CST 8215
-- Author: Olutoni Oluwole
-- Today's Date: 28 Nov 2020

DELETE FROM bills;
DELETE FROM patients;
DELETE FROM doctors;
DELETE FROM ailments;
DELETE FROM nurses;


/* Ailments Table */
INSERT INTO ailments(ailment_ID, diagnosis, major_symptoms) 
	VALUES( '001', 'Scoliosis', 'Fever, Coughing' );
INSERT INTO ailments(ailment_ID, diagnosis, major_symptoms)
	VALUES( '002', 'Green Panic', 'Pierced liver');
INSERT INTO ailments(ailment_ID, diagnosis, major_symptoms)
	VALUES( '003', 'Clonorchiasis', 'hallucination');
INSERT INTO ailments(ailment_ID, diagnosis, major_symptoms)
	VALUES( '004', 'myocarditis', 'hest pains' );
INSERT INTO ailments(ailment_ID, diagnosis, major_symptoms)
	VALUES('005', 'Lymphoma', 'hair loss' );
INSERT INTO ailments(ailment_ID, diagnosis, major_symptoms)
	VALUES( '006', 'Varicella', 'stuffy nose' );

/* Nurses Table */
INSERT INTO nurses (nurse_ID, L_name, F_name, specialty, phone_number) 
	VALUES('00211','Hoshigake','Kisame','Janitorial','6139817634');
INSERT INTO nurses (nurse_ID, L_name, F_name, specialty, phone_number) 
	VALUES('00301','Uchiha','Itachi','Geriatric','6135550188');
INSERT INTO nurses (nurse_ID, L_name, F_name, specialty, phone_number) 
	VALUES('00212','Yakushi','Kabuto','Janitorial','6134224817');
INSERT INTO nurses (nurse_ID, L_name, F_name, specialty, phone_number) 
	VALUES('00902','Hozuki','Suigetsu','Emergency','6134605828');
INSERT INTO nurses (nurse_ID, L_name, F_name, specialty, phone_number) 
	VALUES('00901','Uzumaki','Karin','Emergency','6134786929');
INSERT INTO nurses (nurse_ID, L_name, F_name, specialty, phone_number) 
	VALUES('00302','Zetsu','Shiro','Geriatric','6133933256');

/* Doctors Table */
INSERT INTO doctors( Doctor_ID, L_name, F_name, gender, address, phone_number, School)
  VALUES('1131', 'Hinata', 'Fukorodani', 'M', '213 Main Street', '5196715541', 'University of Toronto');
INSERT INTO doctors(Doctor_ID, L_name, F_name, gender, address, phone_number, School)
  VALUES('1132', 'Kiba', 'Inuzuka', 'F', '1374 Lyon Street', '2508601950', 'Carleton University');
INSERT INTO doctors(Doctor_ID, L_name, F_name, gender, address, phone_number, School)
  VALUES('1133', 'Neji', 'Hyuga', 'F', '1385 Woodroffe Ave', '2504433745', 'University of Toronto');
INSERT INTO doctors(Doctor_ID, L_name, F_name, gender, address, phone_number, School)
  VALUES('1134', 'Ino', 'Yamanaka', 'M', '854 Younge Street' ,'7809142636', 'University of Ottawa');
INSERT INTO doctors(Doctor_ID, L_name, F_name, gender, address, phone_number, School)
  VALUES('1140', 'Shikamaru', 'Nara', 'M', '264 Main Street' ,'6472880091', 'MCGill');
INSERT INTO doctors(Doctor_ID, L_name, F_name, gender, address, phone_number, School) 
  VALUES('1156', 'Aze', 'Balai', 'F', '4639  Olen Thomas Drive', '4163989596', 'McGill');

/* Patients Table */
INSERT INTO patients (patient_id, doctor_id, nurse_id, patient_l_name, patient_f_name, ailment_id, severity, admission_date, address, phone_number, gender)
  VALUES( 'P011', '1134', '00301', 'Nijima', 'Makoto', '003', 'low', '2020-01-25', '2895 Boundary Street' , '9046650309' , 'F' );
INSERT INTO patients (patient_id, doctor_id, nurse_id, patient_l_name, patient_f_name, ailment_id, severity, admission_date, address, phone_number, gender)
   VALUES( 'P051', '1140', '00212', 'Sakamoto', 'Ryuji', '001', 'medium', '2019-08-13', '2657 Stout Lane' , '7173755381' , 'M' );
INSERT INTO patients (patient_id, doctor_id, nurse_id, patient_l_name, patient_f_name, ailment_id, severity, admission_date, address, phone_number, gender)
  VALUES( 'P213', '1133', '00211', 'Takamaki', 'Ann', '004', 'low', '2020-06-20', '4103 Green Acres Road' , '2524647409' , 'F' );
INSERT INTO patients (patient_id, doctor_id, nurse_id, patient_l_name, patient_f_name, ailment_id, severity, admission_date, address, phone_number, gender)
  VALUES( 'P351', '1156', '00902', 'Akechi', 'Goro', '004', 'critical', '2020-02-28', '3947 Hillview Street' , '8037201848' , 'M' );
INSERT INTO patients (patient_id, doctor_id, nurse_id, patient_l_name, patient_f_name, ailment_id, severity, admission_date, address, phone_number, gender)
 VALUES( 'P125', '1134', '00301', 'Okumura', 'Haru', '005', 'high','2020-02-09', '3006 Kovar Road' , '5086410473' , 'F' );
INSERT INTO patients (patient_id, doctor_id, nurse_id, patient_l_name, patient_f_name, ailment_id, severity, admission_date, address, phone_number, gender)
 VALUES( 'P651', '1140', '00302', 'Sakura', 'Futaba', '003', 'low', '2020-12-15', '4621 Charack Road' , '8122414788' , 'F' );

/* Bills Table */
INSERT INTO bills( bill_no, date, amount, patient_ID, doctor_ID) 
	VALUES( 990036, '2020-05-16', 150.00, 'P011', '1134');
INSERT INTO bills( bill_no, date, amount, patient_ID, doctor_ID) 
	VALUES( 990124, '2020-08-20', 3150.00, 'P051', '1140');
INSERT INTO bills( bill_no, date, amount, patient_ID, doctor_ID) 
	VALUES( 990028, '2020-02-03', 2100.50, 'P213', '1133');
INSERT INTO bills( bill_no, date, amount, patient_ID, doctor_ID)  
	VALUES( 990346, '2020-03-14', 1250.00, 'P351', '1156');
INSERT INTO bills( bill_no, date, amount, patient_ID, doctor_ID) 
	VALUES( 990225, '2020-10-29', 1033.00, 'P125', '1134');
INSERT INTO bills( bill_no, date, amount, patient_ID, doctor_ID) 
	VALUES( 990047, '2020-11-02', 3005.00, 'P651', '1140');

