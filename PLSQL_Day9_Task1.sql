/* To create new table that holds job and tier values. (Don't forget about foreign keys)
    Create trigger that on insert on name/surname table (created in Day 8 Task 4 & 5) creates entry in this table. */


-- Create the table
CREATE TABLE job_tier (
   job_id NUMBER NOT NULL,
   tier_id NUMBER NOT NULL,
   CONSTRAINT fk_job_tier_job_id FOREIGN KEY (job_id)
      REFERENCES jobs(id),
   CONSTRAINT fk_job_tier_tier_id FOREIGN KEY (tier_id)
      REFERENCES tiers(id)
);

-- Create the trigger
CREATE OR REPLACE TRIGGER job_tier_trigger
    BEFORE INSERT ON Student_23.Name_Surname
    FOR EACH ROW
BEGIN
    INSERT INTO job_tier (job_id, job, tier) 
        VALUES (:NEW.Salary, 'Employee', 
        CASE 
            WHEN :NEW.Salary BETWEEN 1000 AND 3500 THEN 'Analyst' 
            WHEN :NEW.Salary BETWEEN 3501 AND 6000 THEN 'Middle Management' 
            WHEN :NEW.Salary BETWEEN 6001 AND 10000 THEN 'Upper Management' 
            ELSE 'Unknown' 
        END);
END;
/

-- Insert some data
INSERT INTO Student_23.Name_Surname VALUES ('Sarah', 'john', 7500);
INSERT INTO Student_23.Name_Surname VALUES ('Iva', 'Maria', 3200);
INSERT INTO Student_23.Name_Surname VALUES ('Elby', 'Mathew',5000);

-- Check the job/tier table
SELECT * FROM job_tier;

