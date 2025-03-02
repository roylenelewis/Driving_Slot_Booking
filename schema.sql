-- create all necessary tables --

CREATE TABLE Teachers (
    TeacherID INT AUTO_INCREMENT,
    Name VARCHAR(100),
    GenderPreference VARCHAR(10),
    CarModel VARCHAR(50),
    ChargePerSlot DECIMAL(5,2),
    TermsAndConditions TEXT,
    PRIMARY KEY (TeacherID)
);

CREATE TABLE Learners (
    LearnerID INT AUTO_INCREMENT,
    Name VARCHAR(100),
    Gender VARCHAR(10),
    PRIMARY KEY (LearnerID)
);

CREATE TABLE TimeSlots (
    SlotID INT AUTO_INCREMENT,
    TeacherID INT,
    Day VARCHAR(10),
    StartTime TIME,
    EndTime TIME,
    Status VARCHAR(10),
    PRIMARY KEY (SlotID),
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);

CREATE TABLE Bookings (
    BookingID INT AUTO_INCREMENT,
    LearnerID INT,
    SlotID INT,
    BookingDate DATE,
    EventDate DATE,
    PRIMARY KEY (BookingID),
    FOREIGN KEY (LearnerID) REFERENCES Learners(LearnerID),
    FOREIGN KEY (SlotID) REFERENCES TimeSlots(SlotID)
);

CREATE TABLE EmailNotifications (
    NotificationID INT AUTO_INCREMENT,
    BookingID INT,
    Recipient VARCHAR(100),
    NotificationType VARCHAR(50),
    PRIMARY KEY (NotificationID),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);
