CREATE function LostAndFound.CalculateShipping (
@HotelState varchar(2),
@shippingState varchar(20)
)
Returns integer
As

begin

if @HotelState=@shippingState  
	return 10
return 25	
End
GO