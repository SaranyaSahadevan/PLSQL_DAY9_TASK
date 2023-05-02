/*To create a trigger on insert and update for parent table, that will add a LV country prefix +371 for phone numbers that are 
8 characters long. */



-- its showing insufficient privileges--

CREATE OR REPLACE TRIGGER Prefix_Phone 
  BEFORE INSERT OR UPDATE ON Teacher_1.teacher
  FOR EACH ROW
BEGIN
  IF :NEW.phone IS NOT NULL
  AND LENGTH(:NEW.phone) = 8 
  THEN
    :NEW.phone := '+371' || :NEW.phone;
  END IF;
END;
/