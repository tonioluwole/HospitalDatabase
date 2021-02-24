-- Filename: Hospital SQL ALL Queries.sql
-- Description: script to perform multiple and all different queries as defined in assigment
-- CST 8215
-- Author: Olutoni Oluwole
-- Today's Date: 28 Nov 2020

--Metadata statement
SELECT * FROM information_schema.columns 
WHERE table_name 
IN ('doctors', 'bills', 'nurses', 'patients', 'ailments') 
ORDER BY table_name;

--Queries for Patients Table
SELECT patient_ID, patient_l_name, patient_f_name, ailment_id, severity 
FROM Patients 
WHERE severity = 'low';

SELECT * FROM patients 
WHERE admission_date >= '2020-02-01' AND admission_date < '2020-03-01' ;

SELECT patient_ID, doctor_ID, patient_l_name, patient_f_name 
FROM Patients 
WHERE doctor_ID = '1140';

--Queries for Doctors Table
SELECT * FROM Doctors 
WHERE school = 'University of Toronto';

SELECT doctor_id, L_name, F_name, gender 
FROM Doctors WHERE gender = 'M';

SELECT doctor_id, L_name, F_name, gender 
FROM Doctors WHERE gender = 'F';

--Queries for Nurses Table
SELECT * FROM nurses 
WHERE specialty = 'Emergency';

SELECT * FROM nurses 
WHERE specialty <> 'Janitorial';

SELECT * FROM nurses 
WHERE L_name LIKE 'H%';

--Queries for Bills Table
SELECT * FROM bills 
WHERE amount > 1000.00;

SELECT bill_no, amount, patient_ID 
FROM bills 
WHERE amount 
BETWEEN 1000 AND 2500.00;

SELECT * FROM bills 
WHERE doctor_ID = '1134';

--VIEW 1
CREATE VIEW summer_fall_bills AS
SELECT * FROM bills 
WHERE date 
BETWEEN '2020-06-01' AND '2020-12-31';

--VIEW 2
CREATE VIEW McGill_Doctors AS
SELECT Doctor_ID, L_name, F_name FROM Doctors 
WHERE school = 'McGill';

--SUBQUERIES
SELECT patient_l_name, patient_f_name, doctor_ID
FROM patients 
Where doctor_ID = (SELECT Doctor_ID FROM Doctors 
WHERE school = 'University of Ottawa');

SELECT bill_no, amount, patient_ID
FROM Bills
WHERE patient_ID = (SELECT patient_id From patients where ailment_id = '005');

--JOINS
--LEFT JOIN : This displays patients' information/names and mathes it with their doctor's names/information
SELECT patients.patient_ID, patient_l_name, patient_f_name, doctors.doctor_ID, doctors.L_name, doctors.F_name
FROM Patients
LEFT JOIN Doctors ON Patients.doctor_ID = Doctors.doctor_ID;

--RIGHT JOIN :  this displays nurses specialty and information, matching it against the patients they are taking care of
SELECT nurses.nurse_ID, nurses.L_name, nurses.F_name, nurses.specialty, Patients.patient_l_name, Patients.patient_f_name
FROM Nurses
RIGHT JOIN patients ON nurses.nurse_ID = patients.nurse_ID;

--UNION
SELECT patient_ID, doctor_ID FROM bills 
WHERE Patient_ID = 'P011'
UNION
SELECT patient_ID, Doctor_ID FROM patients
WHERE patient_ID = 'P051';

--Normalization statement to 1NF
SELECT bill_no, date, amount, 
patients.patient_ID, patients.patient_l_name, patients.patient_f_name, patients.admission_date,
patients.address, patients.phone_number, patients.gender,   
patients.ailment_ID, patients.severity,
nurses.nurse_ID, nurses.L_name, nurses.F_name, nurses.specialty, nurses.phone_number,
ailments.diagnosis, ailments.major_symptoms,
bills.doctor_ID, doctors.L_name, doctors.F_name, doctors.gender, 
doctors.address, doctors.phone_number, doctors.school  

FROM bills

JOIN doctors ON doctors.doctor_id = bills.doctor_id
JOIN patients ON patients.patient_id = bills.patient_id
JOIN nurses ON nurses.nurse_id = patients.nurse_id
JOIN ailments ON ailments.ailment_id = patients.ailment_id;