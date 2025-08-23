create database hosp;
use hosp;
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100) NOT NULL,
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
    DateOfBirth DATE,
    Phone VARCHAR(20),
    Address TEXT,
    BloodGroup VARCHAR(5),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100),
    Phone VARCHAR(20),
    Email VARCHAR(100)
);
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE NOT NULL,
    AppointmentTime TIME NOT NULL,
    Status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    Purpose TEXT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);
INSERT INTO Patients (FullName, Gender, DateOfBirth, Phone, Address, BloodGroup)
VALUES ('Ali Raza', 'Male', '1990-05-14', '03001234567', 'Karachi, Pakistan', 'O+');
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, AppointmentTime, Purpose)
VALUES (1, 2, '2025-08-20', '10:30:00', 'General Checkup');
SELECT a.AppointmentID, a.AppointmentDate, a.AppointmentTime, a.Status,
       d.FullName AS Doctor, a.Purpose
FROM Appointments a
JOIN Doctors d ON a.DoctorID = d.DoctorID
WHERE a.PatientID = 1;

UPDATE Appointments
SET Status = 'Completed'
WHERE AppointmentID = 5;
create database bookstore;
use bookstore;
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(150),
    publisher VARCHAR(150),
    category VARCHAR(100),
    price DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    isbn VARCHAR(20) UNIQUE,
    published_date DATE
);CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address TEXT
);
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Pending','Shipped','Delivered','Cancelled') DEFAULT 'Pending',
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
CREATE TABLE Order_Items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
CREATE TABLE Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    email VARCHAR(150),
    phone VARCHAR(20),
    address TEXT
);
CREATE TABLE Inventory_Log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    change_type ENUM('Added','Removed','Sold','Returned') NOT NULL,
    quantity INT NOT NULL,
    log_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
INSERT INTO Books (title, author, price, stock, isbn) 
VALUES ('Database Systems', 'Elmasri & Navathe', 59.99, 10, '9781234567890');
INSERT INTO Orders (customer_id, total_amount) VALUES (1, 119.98);
INSERT INTO Order_Items (order_id, book_id, quantity, price) 
VALUES (1, 2, 2, 59.99);
UPDATE Books SET stock = stock - 2 WHERE book_id = 2;
SELECT title, stock FROM Books WHERE stock > 0;

