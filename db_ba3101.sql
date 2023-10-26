-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 23, 2023 at 09:48 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ba3101`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbadmin`
--


CREATE TABLE Students (
    SR_Code INT PRIMARY KEY,
    StudentsName VARCHAR(50),
    StudentsPassword VARCHAR(50)
);

CREATE TABLE RSO (
    RsoID INT PRIMARY KEY,
    RsoName VARCHAR(50),
    RsoPassword VARCHAR(50)
);

CREATE TABLE faculty (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(50),
    FactultyPassword VARCHAR(50)
);

CREATE TABLE events (
    EventID INT PRIMARY KEY,
    EventTitle VARCHAR(50),
    EventDetails VARCHAR(50),
    EventDate VARCHAR(50)
);

CREATE TABLE department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE admin (
    AdminID INT PRIMARY KEY,
    AdminName VARCHAR(50),
    AdminPassword VARCHAR(50)
);

CREATE TABLE Attendees (
    SR_Code INT PRIMARY KEY,
    AdminID INT,
    RsoID INT,
    FacultyID INT,
    DepartmentID INT,
    EventID INT,
    FOREIGN KEY (SR_Code) REFERENCES Students(SR_Code),
    FOREIGN KEY (AdminID) REFERENCES Admin(AdminID),  -- Assuming you have an Admin table with an AdminID primary key
    FOREIGN KEY (RsoID) REFERENCES Rso(RsoID),        -- Assuming you have an Rso table with an RsoID primary key
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID),  -- Assuming you have a Faculty table with a FacultyID primary key
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),  -- Assuming you have a Department table with a DepartmentID primary key
    FOREIGN KEY (EventID) REFERENCES Events(EventID)  -- Assuming you have an Events table with an EventID primary key
);



-- Insert data into 'admin' table
INSERT INTO admin(AdminID, AdminName, AdminPassword)
VALUES (101, 'Francis Balazon','Francis101 '), (102, 'Alimoren Dioneces','Dioneces102 '), 
(103, 'Richelle Sulit','Sulit103 '), (104, 'Ganiela Catapia','Ganiela104 '), (105, 'Lea Salonga','Lea105 ');

-- Insert data into 'department' table
INSERT INTO department(DepartmentID, DepartmentName)
VALUES (2202, 'CABE'), (2203, 'YPMAP'), (2201, 'CICS'), (2204, 'CICS'), (2205, 'CABE');

-- Insert data into 'tb_event' table
INSERT INTO events(EventID, EventTitle, EventDetails, EventDate)
VALUES (3101, 'SportFest','Gather Everyone','Oct 28 2023'),(3102, 'Night Fest','Gather Everyone','Oct 29 2023'),
(3103, 'Valentines Day','Gather Everyone','Feb 14 2023'),(3104, 'CICS DAY','Gather Everyone','Dec 13 2023'), 
(3105, 'Christmas Party','Gather Everyone','Dec 22 2023');

-- Insert data into 'tb_students' table
INSERT INTO students(SR_Code, StudentsName, StudentsPassword)
VALUES (21-39305,'Marvin M. Cruz','secret2101'),(21-45325,'Kyla M. Pusag','2302asd'),(21-56323,'Mikko C uson','Pogi123'),
(21-45242,'Verlon M Morales','AkolangtoMorales'),(21-63452,'Aeron M. Umali','aeronlangsakalam');

-- Insert data into 'tb_rso' table
INSERT INTO rso(RsoID, RsoName, RsoPassword)
VALUES (1101, 'CICS','1101CICS'),(1102, 'CABE','1101CABE'),(1103, 'YPMAP','1101YPMAP'),(1104, 'JPCS','1101JPCS'),(1105, 'CIT','1105CIT');

-- Insert data into 'faculty' table
INSERT INTO faculty(FacultyID, FacultyName, FacultyPassword)
VALUES (01, 'CICS','01BSUCICS'),(02, 'CICS','02BSUCICS'),(03, 'CICS','03BSUCICS'),(04, 'CICS','04BSUCICS'),(05, 'CICS','05BSUCICS');
