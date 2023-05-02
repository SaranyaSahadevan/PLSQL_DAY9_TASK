/* To add 2 new columns (timestamp and user_id) into student table. 
Create a trigger that on insert into student table will automatically add timestamp and username values for each inserted row. */


-- its showing i dont have privileges to run this query--


ALTER TABLE Teacher_1.student
ADD COLUMN timestamp DATE,
ADD COLUMN user_id INT;

CREATE OR REPLACE TRIGGER add_timestamp_user_id
BEFORE INSERT ON Teacher_1.student
FOR EACH ROW
BEGIN
  :new.timestamp := SYSDATE;
  :new.user_id := USER;
END;
/