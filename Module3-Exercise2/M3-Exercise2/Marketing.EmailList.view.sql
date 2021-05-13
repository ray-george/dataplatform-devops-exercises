create view Marketing.EmailList as 

select CustomerId, FirstName, LastName, Email, OptIn 
from Booking.Customers
where OptIn = 1