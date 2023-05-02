/* To Create a synonym on the student table.
Create an anonymous block that prints out all students (name, surname, email), who were born after 31.12.2009. */

-- create synonym
CREATE SYNONYM Students FOR Teacher_1.Students;

-- anonymous block to print students born after 31.12.2009
BEGIN
  FOR rec IN (SELECT First_name, last_name, email 
              FROM Teacher_1.Student
              WHERE Date_of_birth > TO_DATE('31.12.2009', 'DD.MM.YYYY'))
  LOOP
    DBMS_OUTPUT.PUT_LINE(rec.First_name || ' ' || rec.last_name || ', ' || rec.email);
  END LOOP;
END;
