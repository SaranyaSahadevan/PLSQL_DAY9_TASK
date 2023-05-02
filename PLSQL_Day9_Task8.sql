/* To Create a synonym on the parent table.
Create a function that receives parent email as a parameter and returns an age of the oldest child of this parent. If there are several parents with provided email – throw the exception.
Inside the function you should use synonym, instead of parent table name. */


--Create Synonym
CREATE SYNONYM Parent_Table FOR Teacher_1.Parent;

--Create Function
CREATE OR REPLACE FUNCTION getOldestChildAge (parent_email VARCHAR2)
  RETURN NUMBER
IS
  oldest_age NUMBER;
BEGIN
  SELECT MAX(age) INTO oldest_age
    FROM Parent_Table
   WHERE email = parent_email;
  
  IF SQL%ROWCOUNT > 1
  THEN
    RAISE_APPLICATION_ERROR(-20001, 'More than one parent with provided email');
  END IF;
  
  RETURN oldest_age;
END;
/