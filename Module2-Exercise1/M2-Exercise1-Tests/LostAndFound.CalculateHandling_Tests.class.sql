EXEC tSQLt.NewTestClass 'LostAndFound_CalculateHandling_Tests';
GO

CREATE PROCEDURE  LostAndFound_CalculateHandling_Tests.[test handling function]
AS
BEGIN
  DECLARE @ExpectedRewardsBalance INTEGER;
  DECLARE @ActualRewardsBalance INTEGER;+


   SELECT @ActualRewardsBalance = LostAndFound.CalculateHandling(12000);
   SET @ExpectedRewardsBalance = 0;

    EXEC tSQLt.AssertEquals @ExpectedRewardsBalance, @ActualRewardsBalance;


  SELECT @ActualRewardsBalance = LostAndFound.CalculateHandling(9000);
  SET @ExpectedRewardsBalance = 37;
  ; 
  EXEC tSQLt.AssertEquals @ExpectedRewardsBalance, @ActualRewardsBalance;


END
GO

CREATE PROCEDURE  LostAndFound_CalculateHandling_Tests.[test handling boarder 10000]
AS
BEGIN
  DECLARE @ExpectedRewardsBalance INTEGER;
  DECLARE @ActualRewardsBalance INTEGER;
  


  SELECT @ActualRewardsBalance = LostAndFound.CalculateHandling(10000);
  SET @ExpectedRewardsBalance = 37;

    EXEC tSQLt.AssertEquals @ExpectedRewardsBalance, @ActualRewardsBalance;



END
GO