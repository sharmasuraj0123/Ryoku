CREATE PROCEDURE deleteEmployee(IN personId INT, IN empID INT)
  BEGIN
    DELETE FROM Employees WHERE EmployeeID = 'empID';
    DELETE  FROM Person WHERE  id = personId;
  END;
