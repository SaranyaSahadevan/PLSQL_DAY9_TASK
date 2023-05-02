/* To create new procedure in package that updates salary to all existing rows on certain tier level, use this tier as input variable,
increase should be flat number (can be added as input variable). */



CREATE OR REPLACE PACKAGE salary_update_pkg AS 
   PROCEDURE update_salary(p_tier IN NUMBER, p_increase IN NUMBER);
END salary_update_pkg;
/

CREATE OR REPLACE PACKAGE BODY salary_update_pkg AS 
  PROCEDURE update_salary(p_tier IN NUMBER, p_increase IN NUMBER) IS
  BEGIN
    UPDATE student_23.user_names SET salary = salary + p_increase
    WHERE tier = p_tier;
  END;
END salary_update_pkg;
/

CREATE OR REPLACE TRIGGER salary_trigger
  BEFORE UPDATE OF name, surname ON student_23.user_names
  FOR EACH ROW
BEGIN
  SELECT tier INTO :NEW.tier FROM student_23.user_names WHERE id = :OLD.id;
END;
/