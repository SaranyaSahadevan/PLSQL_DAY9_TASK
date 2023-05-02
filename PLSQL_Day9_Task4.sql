/*To create a trigger on name/surname table, that will restrict negative salary value insert and update. */


Create Or Replace Trigger Trg_Prevent_Negative_Salary 
Before Insert Or Update On Student_23.User_Names
For Each Row
Begin
  If :New.Salary < 0 Then
    Raise_Application_Error(-100, 'Negative salary values are not allowed');
  End If;
End;
/


    
          
            
