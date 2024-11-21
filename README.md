# Airline Reservation System
DBMS Mini Project: Airline Reservation System

The **Airline Reservation System** is a web-based application designed to simplify flight booking, manage airline schedules, and streamline passenger ticketing. This project combines PHP for backend logic, MySQL for database management, and HTML/CSS for the front-end interface.

## Features

- **User Registration & Login**: Allows passengers and administrators to sign up and access their respective dashboards.
- **Flight Booking**: Users can search for flights, view schedules, and book tickets.
- **Admin Panel**: Enables administrators to add, update, or delete flight details.
- **PNR Tracking**: Passengers can track ticket status using their PNR.
- **Responsive Design**: Ensures a user-friendly experience across devices.

## Technologies Used

- **Frontend**: HTML, CSS, JavaScript
- **Backend**: PHP
- **Database**: MySQL

## File Structure

- **PHP Files**:
  - `addflight.php`, `adminview.php`: Admin-related functionalities.
  - `login.php`, `signup.php`, `logout.php`: User authentication.
  - `flightdisplay.php`, `passDetails.php`: Flight details and booking logic.
- **SQL Files**:
  - `AirlineDB.sql`, `FinalDatabase.sql`: Database schema and initial data.
- **HTML Files**:
  - `homepage.html`, `services.html`, `contact.html`: Static pages for the application.
- **CSS File**:
  - `airline.css`: Styles for the application.
- **Others**:
  - `schema.png`: Database schema image.
  - `Airlines.docx`: Documentation or project details.

## Setup Instructions

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/saisnehasv/Airline_Reservation_System
   ```
2. **Database Setup**:
   - Import `AirlineDB.sql` or `FinalDatabase.sql` into your MySQL database.
   - Update `connection.php` with your database credentials.
3. **Run the Application**:
   - Place the project folder in the `htdocs` directory of your XAMPP installation.
   - Start the Apache and MySQL servers via the XAMPP control panel.
   - Access the application at `http://localhost/AirlineDB`.

## License

This project is licensed under [MIT License](LICENSE).

## Contact

For any questions or feedback, please contact: *[Your Name or Email]*
