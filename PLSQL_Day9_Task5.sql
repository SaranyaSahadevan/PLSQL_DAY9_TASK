/* To Insert row with negative salary value into user/name table without dropping the trigger from previous task  */

Declare
  TriggerStatus varchar2(20);
Begin
  Select Status into TriggerStatus From User_DBA_Triggers Where trigger_name = 'Trg_Prevent_Negative_Salary';
  
  IF TriggerStatus = 'ENABLED' THEN
    EXECUTE IMMEDIATE 'ALTER TRIGGER Trg_Prevent_Negative_Salary DISABLE';
  END IF;
  
  Insert Into Student_23.Name_surname Values ('Sarah', 'John', -200);
  
  IF TriggerStatus = 'ENABLED' THEN
    EXECUTE IMMEDIATE 'ALTER TRIGGER Trg_Prevent_Negative_Salary ENABLE';
  END IF;
End;
/