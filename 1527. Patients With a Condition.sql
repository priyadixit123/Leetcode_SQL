https://leetcode.com/problems/patients-with-a-condition/description/


SOL:

SELECT patient_id, patient_name, conditions
FROM Patients
WHERE conditions REGEXP '\\bDIAB1';
