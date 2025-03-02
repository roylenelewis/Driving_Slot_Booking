
-- Get available slots for a specific teacher
SELECT *
FROM TimeSlots
WHERE TeacherID = 1 AND Status = 'Available';

-- Get available slots for all teachers
SELECT T.Name AS TeacherName, TS.*
FROM TimeSlots TS
JOIN Teachers T ON TS.TeacherID = T.TeacherID
WHERE TS.Status = 'Available';

-- Block a slot
UPDATE TimeSlots
SET Status = 'Blocked'
WHERE SlotID = 2;

-- update status after the completion of event --
-- Create an event to update slot status after the event date
CREATE EVENT UpdateSlotStatus
ON SCHEDULE EVERY 1 DAY
DO
UPDATE TimeSlots TS
JOIN Bookings B ON TS.SlotID = B.SlotID
SET TS.Status = 'Available'
WHERE B.EventDate < CURDATE();

-- All Learners and Their Bookings --
SELECT L.Name AS LearnerName, B.BookingID, B.EventDate
FROM Learners L
JOIN Bookings B ON L.LearnerID = B.LearnerID;

-- All Teachers and Their Available Slots
SELECT T.Name AS TeacherName, TS.SlotID, TS.Day, TS.StartTime, TS.EndTime
FROM Teachers T
JOIN TimeSlots TS ON T.TeacherID = TS.TeacherID
WHERE TS.Status = 'Available';

-- All Bookings for a Specific Date
SELECT B.BookingID, L.Name AS LearnerName, T.Name AS TeacherName, TS.Day, TS.StartTime, TS.EndTime
FROM Bookings B
JOIN Learners L ON B.LearnerID = L.LearnerID
JOIN TimeSlots TS ON B.SlotID = TS.SlotID
JOIN Teachers T ON TS.TeacherID = T.TeacherID
WHERE B.EventDate = '2023-04-08';

-- All Booked Slots for a Teacher
SELECT TS.SlotID, TS.Day, TS.StartTime, TS.EndTime
FROM TimeSlots TS
WHERE TS.TeacherID = 1 AND TS.Status = 'Booked';

-- All Available Slots for a Specific Day
SELECT TS.SlotID, TS.Day, TS.StartTime, TS.EndTime
FROM TimeSlots TS
WHERE TS.Day = 'Saturday' AND TS.Status = 'Available';

-- All Blocked Slots
SELECT TS.SlotID, TS.Day, TS.StartTime, TS.EndTime
FROM TimeSlots TS
WHERE TS.Status = 'Blocked';

-- Blocked Slots for a Specific Teacher
SELECT TS.SlotID, TS.Day, TS.StartTime, TS.EndTime
FROM TimeSlots TS
WHERE TS.TeacherID = 1 AND TS.Status = 'Blocked';

-- All Email Notifications for Bookings
SELECT EN.NotificationID, EN.Recipient, EN.NotificationType
FROM EmailNotifications EN
JOIN Bookings B ON EN.BookingID = B.BookingID;

-- Email Notifications for a Specific Booking
SELECT EN.NotificationID, EN.Recipient, EN.NotificationType
FROM EmailNotifications EN
WHERE EN.BookingID = 1;

-- Teachers with Male Preference
SELECT T.Name AS TeacherName
FROM Teachers T
WHERE T.GenderPreference = 'Male';

-- Teachers with Female Preference
SELECT T.Name AS TeacherName
FROM Teachers T
WHERE T.GenderPreference = 'Female';

-- Check if a learner matches a teacher's gender preference
SELECT *
FROM Learners L
JOIN Bookings B ON L.LearnerID = B.LearnerID
JOIN TimeSlots TS ON B.SlotID = TS.SlotID
JOIN Teachers T ON TS.TeacherID = T.TeacherID
WHERE L.Gender = T.GenderPreference;

-- Booking History for a Learner --
SELECT B.BookingID, B.EventDate, T.Name AS TeacherName, TS.Day, TS.StartTime, TS.EndTime
FROM Bookings B
JOIN Learners L ON B.LearnerID = L.LearnerID
JOIN TimeSlots TS ON B.SlotID = TS.SlotID
JOIN Teachers T ON TS.TeacherID = T.TeacherID
WHERE L.LearnerID = 1;

-- Booking History for a Teacher --
SELECT B.BookingID, B.EventDate, L.Name AS LearnerName, TS.Day, TS.StartTime, TS.EndTime
FROM Bookings B
JOIN TimeSlots TS ON B.SlotID = TS.SlotID
JOIN Teachers T ON TS.TeacherID = T.TeacherID
JOIN Learners L ON B.LearnerID = L.LearnerID
WHERE T.TeacherID = 1;




