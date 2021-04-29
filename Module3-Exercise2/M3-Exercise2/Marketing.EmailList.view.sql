create view Marketing.Email as 

select CustomerId, FirstName, LastName, Email, OptIn from Booking.Customers
where OptIn = 1