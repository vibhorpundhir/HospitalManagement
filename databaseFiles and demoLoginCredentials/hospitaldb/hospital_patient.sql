-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
-- Host: localhost    Database: hospital
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Table structure for table `patient`
DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE `patient` (
  `pid` VARCHAR(255) NOT NULL,          -- Patient ID as primary key
  `registration_date` DATE DEFAULT NULL,
  `first_name` VARCHAR(100) NOT NULL,
  `middle_name` VARCHAR(100) DEFAULT NULL,
  `last_name` VARCHAR(100) NOT NULL,
  `birthdate` DATE DEFAULT NULL,        -- Use DATE for birthdate instead of VARCHAR
  `gender` ENUM('male', 'female', 'other') DEFAULT NULL, -- Use ENUM for gender
  `email_id` VARCHAR(255) NOT NULL,
  `mobile_no` BIGINT(20) DEFAULT NULL,  -- BIGINT for large phone numbers
  `adhar_no` BIGINT(20) NOT NULL,       -- Use BIGINT for Aadhaar number
  `country` VARCHAR(100) DEFAULT 'India',
  `state` VARCHAR(100) DEFAULT NULL,
  `city` VARCHAR(100) DEFAULT NULL,
  `residential_address` VARCHAR(255) DEFAULT NULL,
  `permanent_address` VARCHAR(255) DEFAULT NULL,
  `blood_group` ENUM('A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-') DEFAULT NULL, -- ENUM for blood groups
  `chronic_diseases` VARCHAR(255) DEFAULT 'none',
  `medicine_allergy` VARCHAR(255) DEFAULT 'none',
  `doctor_id` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `unique_email` (`email_id`),  -- Explicit unique key for email
  UNIQUE KEY `unique_adhar` (`adhar_no`),  -- Aadhaar should be unique
  KEY `idx_doctor_id` (`doctor_id`),       -- Index on doctor ID for quicker lookups
  CONSTRAINT `fk_patient_doctor` FOREIGN KEY (`doctor_id`) REFERENCES `employee` (`eid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

-- Dumping data for table `patient`
LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` 
(`registration_date`, `pid`, `first_name`, `middle_name`, `last_name`, `birthdate`, `gender`, `email_id`, `mobile_no`, `adhar_no`, `country`, `state`, `city`, `residential_address`, `permanent_address`, `blood_group`, `chronic_diseases`, `medicine_allergy`, `doctor_id`) VALUES
('2020-06-21', 'P101', 'Ashlesha', 'Atul', 'Narkhede', '1990-04-12', 'female', 'ashlesha@gmail.com', 1989478593, 901238756123, 'India', 'Maharashtra', 'Nashik', 'Bhabha Nagar', 'Bhabha Nagar', 'A+', 'none', 'bluemox', 'EMP101'),
('2020-06-21', 'P102', 'Ritu', 'Yuvraj', 'Mahajan', '1990-05-02', 'female', 'ritu@gmail.com', 9823475901, 109478563215, 'India', 'Maharashtra', 'Nashik', 'Uttam Nagar', 'Uttam Nagar', 'B-', 'diabetes', 'none', 'EMP103'),
('2020-06-21', 'P103', 'Siddhi', 'Pramod', 'Patil', '1991-05-17', 'female', 'siddhi@gmail.com', 9847382091, 823947610019, 'India', 'Maharashtra', 'Nashik', 'Happy House Apartment', 'Happy House Apartment', 'O+', 'none', 'none', 'EMP102'),
('2020-06-21', 'P104', 'Kusum', 'Pawan', 'Hiray', '1973-06-28', 'female', 'kusum@gmail.com', 9478301834, 728001823453, 'India', 'Maharashtra', 'Nashik', 'Panchavati, Nashik', 'Panchavati, Nashik', 'AB+', 'diabetes', 'none', 'EMP101'),
('2021-12-06', 'P105', 'Anand', 'Nitin', 'Shirole', '2000-08-10', 'male', 'anand123@gmail.com', 9023710243, 450123948572, 'India', 'Maharashtra', 'Pune', 'Bibewadi', 'Bibewadi', 'AB+', 'none', 'none', 'EMP101');

/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
