USE HotelManagementDB;
GO
INSERT INTO Guests (FullName, Nationality, PassportNumber, DateOfBirth)
VALUES ('Michael Smith', 'American', 'A12345678', '1990-05-15');
INSERT INTO Guests (FullName, Nationality, PassportNumber, DateOfBirth)
VALUES 
('Emma Watson', 'British', 'B98765432', '1995-03-22'),
('Carlos Silva', 'Brazilian', 'C45612378', '1988-11-10'),
('Yuki Tanaka', 'Japanese', 'D78945612', '1992-07-30');
UPDATE Rooms
SET DailyRate = DailyRate * 1.15
WHERE RoomType LIKE '%Suite%';
UPDATE Reservations
SET ReservationStatus = CASE 
    WHEN CheckOutDate < GETDATE() THEN 'Completed'
    WHEN CheckInDate > GETDATE() THEN 'Upcoming'
    ELSE 'Active'
END;