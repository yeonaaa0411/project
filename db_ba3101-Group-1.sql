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

DROP TABLE IF EXISTS `tbadmin`;
CREATE TABLE IF NOT EXISTS `tbadmin` (
  `Username` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Password` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbadmin`
--

INSERT INTO `tbadmin` (`Username`, `Password`) VALUES
('admin', '123');

-- --------------------------------------------------------

--
-- Table structure for table `tbclient`
--

DROP TABLE IF EXISTS `tbclient`;
-- Create the 'tb_admin' table
CREATE TABLE IF NOT EXISTS tb_admin (
  admin_ID INT AUTO_INCREMENT,
  admin_name VARCHAR(255) NOT NULL,
  admin_password VARCHAR(20) NOT NULL,
  PRIMARY KEY (admin_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Create the 'tb_department' table
CREATE TABLE IF NOT EXISTS tb_department (
  department_id INT AUTO_INCREMENT,
  department_name VARCHAR(255) NOT NULL,
  PRIMARY KEY (department_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Create the 'tb_event' table
CREATE TABLE IF NOT EXISTS tb_event (
  event_id INT AUTO_INCREMENT,
  event_title VARCHAR(255) NOT NULL,
  event_detail TEXT NOT NULL,
  event_date DATE NOT NULL,
  department_id INT,
  PRIMARY KEY (event_id),
  FOREIGN KEY (department_id) REFERENCES tb_department (department_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Create the 'tb_students' table
CREATE TABLE IF NOT EXISTS tb_students (
  student_id INT AUTO_INCREMENT,
  student_name VARCHAR(255) NOT NULL,
  student_password VARCHAR(20) NOT NULL,
  department_id INT,
  PRIMARY KEY (student_id),
  FOREIGN KEY (department_id) REFERENCES tb_department (department_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Create the 'tb_rso' table
CREATE TABLE IF NOT EXISTS tb_rso (
  rso_id INT AUTO_INCREMENT,
  rso_name VARCHAR(255) NOT NULL,
  rso_password VARCHAR(20) NOT NULL,
  department_id INT,
  PRIMARY KEY (rso_id),
  FOREIGN KEY (department_id) REFERENCES tb_department (department_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Create the 'tb_faculty' table
CREATE TABLE IF NOT EXISTS tb_faculty (
  faculty_id INT AUTO_INCREMENT,
  faculty_name VARCHAR(255) NOT NULL,
  faculty_password VARCHAR(20) NOT NULL,
  department_id INT,
  PRIMARY KEY (faculty_id),
  FOREIGN KEY (department_id) REFERENCES tb_department (department_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insert data into 'tb_admin' table
INSERT INTO tb_admin (admin_name, admin_password) VALUES
  ('Admin 1', 'admin1_password'),
  ('Admin 2', 'admin2_password');

-- Insert data into 'tb_department' table
INSERT INTO tb_department (department_name) VALUES
  ('Department 1'),
  ('Department 2');

-- Insert data into 'tb_event' table
INSERT INTO tb_event (event_title, event_detail, event_date, department_id) VALUES
  ('Event 1', 'Event 1 Details', '2023-10-25', 1),
  ('Event 2', 'Event 2 Details', '2023-11-15', 2);

-- Insert data into 'tb_students' table
INSERT INTO tb_students (student_name, student_password, department_id) VALUES
  ('Student 1', 'student1_password', 1),
  ('Student 2', 'student2_password', 1);

-- Insert data into 'tb_rso' table
INSERT INTO tb_rso (rso_name, rso_password, department_id) VALUES
  ('RSO 1', 'rso1_password', 2),
  ('RSO 2', 'rso2_password', 2);

-- Insert data into 'tb_faculty' table
INSERT INTO tb_faculty (faculty_name, faculty_password, department_id) VALUES
  ('Faculty 1', 'faculty1_password', 1),
  ('Faculty 2', 'faculty2_password', 2);


-- Create the 'tb_attendees' table with separate columns for each role
CREATE TABLE IF NOT EXISTS tb_attendees (
  attendee_id INT AUTO_INCREMENT,
  event_id INT NOT NULL,
  student_id INT,
  faculty_id INT,
  rso_id INT,
  PRIMARY KEY (attendee_id),
  FOREIGN KEY (event_id) REFERENCES tb_event (event_id),
  FOREIGN KEY (student_id) REFERENCES tb_students (student_id) ON DELETE CASCADE,
  FOREIGN KEY (faculty_id) REFERENCES tb_faculty (faculty_id) ON DELETE CASCADE,
  FOREIGN KEY (rso_id) REFERENCES tb_rso (rso_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
