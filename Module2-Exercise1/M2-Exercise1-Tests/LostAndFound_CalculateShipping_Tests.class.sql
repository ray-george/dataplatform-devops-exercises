EXEC tSQLt.NewTestClass 'LostAndFound_CalculateShipping_Tests';
GO

CREATE PROCEDURE LostAndFound_CalculateShipping_Tests.[test shipping function]
AS
BEGIN
  DECLARE @ExpectedShippingCost INTEGER;
  DECLARE @ActualShippingCost INTEGER;

  SELECT @ActualShippingCost = LostAndFound.CalculateShipping('NY','NY');

  SET @ExpectedShippingCost = 10;

  EXEC tSQLt.AssertEquals @ExpectedShippingCost, @ActualShippingCost;


  SELECT @ActualShippingCost = LostAndFound.CalculateShipping('NY','NV');
    SET @ExpectedShippingCost = 25;

  EXEC tSQLt.AssertEquals @ExpectedShippingCost, @ActualShippingCost;

END
GO