# Car Booking Database
A MySQL database schema for managing car driving slot bookings.

## Overview
This database is designed to support a car driving slot booking system where learners can book driving lessons with teachers. The system includes features for managing teachers, learners, time slots, bookings, and email notifications.

## Database Schema
The database consists of the following tables:

- **Teachers**: Stores information about the teachers, including their name, gender preference, car model, charge per slot, and terms and conditions.
- **Learners**: Stores information about the learners, including their name and gender.
- **TimeSlots**: Stores available time slots for each teacher, including the day, start time, end time, and status.
- **Bookings**: Stores bookings made by learners, including the learner ID, slot ID, booking date, and event date.
- **EmailNotifications**: Stores email notifications sent for bookings, including the booking ID, recipient, and notification type.

## SQL Code
The SQL code to create the database schema is provided in the `schema.sql` file. You can execute this script in your MySQL environment to set up the database.

## Example Queries
Example queries for inserting data, retrieving available slots, booking a slot, and updating slot status are provided in the `queries.sql` file.

## Setup Instructions
1. **Install MySQL**: Ensure MySQL is installed on your system.
2. **Create a Database**: Create a new MySQL database for the car booking system.
3. **Execute Schema Script**: Run the `schema.sql` script to create the tables.
4. **Insert Sample Data**: Run the `insert_data.sql` script to populate the tables with sample data.
5. **Test Queries**: Use the `queries.sql` file to test various queries.

## Features
- **Teacher Management**: Manage teacher profiles and preferences.
- **Learner Management**: Manage learner profiles.
- **Time Slot Management**: Manage available time slots for each teacher.
- **Booking Management**: Manage bookings made by learners.
- **Email Notifications**: Send email notifications for bookings.

## Future Enhancements
- **User Authentication**: Implement user authentication for secure access.
- **Web Interface**: Develop a web interface for users to interact with the system.
- **Automated Slot Updates**: Automate slot status updates after events.
