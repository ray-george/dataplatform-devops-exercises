EXEC tSQLt.NewTestClass 'Marketing_EmailList_Tests';
GO

CREATE PROCEDURE Marketing_EmailList_Tests.[test one user opted in]
AS
BEGIN
	EXEC tSQLt.FakeTable 'Booking.Customers';

	INSERT INTo Booking.Customers (CustomerId, FirstName, LastName, Email, OptIn)
							VALUES(1, 'Raymond','George','raymond.george@aimco.ca',1);

	SELECT CustomerId, FirstName, LastName, Email, OptIn
	INTO Actual
	FROM Marketing.EmailList

	SELECT 
		1 AS CustomerId,
		'Raymond' AS FirstName,
		'George' as LastName,
		'raymond.george@aimco.ca' as Email,
		1 as OptIn
	INTO Expected

	EXEC tSQLt.AssertEqualsTable Expected, Actual;
END
GO

CREATE PROCEDURE Marketing_EmailList_Tests.[test no Customers Opted in]
AS
BEGIN
	EXEC tSQLt.FakeTable 'Booking.Customers';

	INSERT INTo Booking.Customers (CustomerId, FirstName, LastName, Email, OptIn)
							VALUES(1, 'Raymond','George','raymond.george@aimco.ca',0);

	SELECT CustomerId, FirstName, LastName, Email, OptIn
	INTO Actual
	FROM Marketing.EmailList

	EXEC tSQLt.AssertEmptyTable Actual;
END
GO

CREATE PROCEDURE Marketing_EmailList_Tests.[test multiple Customers Opted in]
AS
BEGIN
	EXEC tSQLt.FakeTable 'Booking.Customers';

	INSERT INTo Booking.Customers (CustomerId, FirstName, LastName, Email, OptIn)
							VALUES(1, 'Raymond','George','raymond.george@aimco.ca',1)
							     ,(2, 'Raymond','George','raymond.george@aimco.ca',1);

	SELECT CustomerId, FirstName, LastName, Email, OptIn
	INTO Actual
	FROM Marketing.EmailList

	SELECT TOP 0 *
	INTO Expected
	FROM Marketing.EmailList

	 insert INTO Expected (CustomerId, FirstName, LastName, Email, OptIn)
	 Values (1, 'Raymond','George','raymond.george@aimco.ca',1)
		   ,(2, 'Raymond','George','raymond.george@aimco.ca',1);


	EXEC tSQLt.AssertEqualsTable Actual, Expected;
END
GO