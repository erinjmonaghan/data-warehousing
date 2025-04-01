\c ncstaffsql

SELECT Dim_Managers.manager
FROM Facts_Staff
JOIN Dim_Managers ON Facts_Staff.manager_id = Dim_Managers.manager_id
ORDER BY mentees_staff_rating ASC 
LIMIT 1;