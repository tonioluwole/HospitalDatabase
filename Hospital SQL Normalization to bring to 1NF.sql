-- Filename: Hospital SQL Normalization to bring to 1NF.sql
-- Description: script to normalize data of all 5 entites and bring them to 1NF
-- CST 8215
-- Author: Olutoni Oluwole
-- Today's Date: 28 Nov 2020

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
JOIN ailments ON ailments.ailment_id = patients.ailment_id





