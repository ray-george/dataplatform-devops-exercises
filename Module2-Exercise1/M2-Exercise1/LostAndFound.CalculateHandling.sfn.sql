CREATE function LostAndFound.CalculateHandling (
@RewardsBalance INT
)
Returns integer
As

begin

declare @handling integer 

set @handling= 37

if @RewardsBalance > 10000 RETURN 0

return @handling


End
GO