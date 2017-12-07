CREATE PROCEDURE getSalesReportOfAMonth(IN month_in int, year_in int)
  BEGIN
    SELECT CONCAT (firstName, " ", lastName) AS EmployeeName, SUM(total_fare) AS TotalRevenue, SUM(booking_fee) AS FEES
    FROM Reservation R, Employees E, Person P
    WHERE month(R.date) = month_in and YEAR(R.date) = year_in AND
    R.employee_id = E.Employeeid AND E.person_id = P.id
    GROUP BY  E.Employeeid;
    END;
