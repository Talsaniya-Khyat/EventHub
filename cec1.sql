SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE DATABASE CEC1; 
USE CEC1;

CREATE TABLE events ( event_id int(11) NOT NULL, event_title varchar(50) NOT NULL, event_price int(11) DEFAULT NULL, participants int(100) DEFAULT 0, img_link text DEFAULT NULL, type_id int(11) DEFAULT NULL, PRIMARY KEY (event_id) ) ENGINE = InnoDB DEFAULT CHARSET = latin1;
INSERT INTO events (event_id, event_title, event_price, participants, img_link, type_id) VALUES (1, 'MASTERs EYEs', 100, 0, 'images/tinywow_Master eye_25575826.png', 1), (2, 'AGAR ART', 250, 0, 'images/tinywow_agarart_25573696.png', 1), (3, 'LANGUAGE MYSTERY', 50, 0, 'images/tinywow_LM_25575623.png', 1), (4, 'VIRTUAL STOCK MARKET', 100, 0, 'images/tinywow_VSM_25577941.png', 1), (5, 'BGMI', 100, 0, 'images/tinywow_BGMI_25574983.png', 2), (6, 'VALORANT', 100, 0, '"D:\XMAP\htdocs\DBMS project\images\VALO.png"', 2), (7, 'FREE FIRE', 100, 0, '"D:\XMAP\htdocs\DBMS project\images\BGMI.png"', 2), (8, 'BEG BORROW STEAL', 150, 0, '"D:\XMAP\htdocs\DBMS project\images\BBS.png"', 3 ), (9, 'IPL AUCTION ', 100, 0, '"D:\XMAP\htdocs\DBMS project\images\IPL.png"', 3), (10, 'TEASURE HUNT ', 100, 0, '"D:\XMAP\htdocs\DBMS project\images\TEASURE HUNT.png"', 3), (11, 'SHARK TANK', 100, 0, '"D:\XMAP\htdocs\DBMS project\images\SHARK.png"', 3);

CREATE TABLE event_info ( event_id int(10) NOT NULL, Date date DEFAULT NULL, time varchar(20) NOT NULL, location varchar(300) NOT NULL, PRIMARY KEY (event_id) ) ENGINE = InnoDB DEFAULT CHARSET = latin1;
INSERT INTO event_info (event_id, Date, time, location) VALUES (1, '2023-03-17', '3.00pm', 'AIML LAB NLB'), (2, '2023-03-17', '1.00pm', 'NLB Lab'), (3, '2023-03-18', '11.00am', 'ROBOTICS LAB NLB'), (4, '2023-03-17', '9.30am', 'SOS CR7'), (5, '2023-03-17', '10.00am', 'SOT CR10'), (6, '2023-03-18', '11.00am', 'CAD Lab'), (7, '2023-03-18', '9.30am', 'SOT CR10'), (8, '2023-03-17', '12.00pm', 'Gardern'), (9, '2023-03-19', '12.00pm', 'SOT CR 10'), (10, '2023-03-18', '4.00pm', 'GSFC Campus'), (11, '2023-03-19', '10.30am', 'SOT Auditorium');

CREATE TABLE event_type ( type_id int(10) NOT NULL primary key , type_title text NOT NULL ) ENGINE = InnoDB DEFAULT CHARSET = latin1;
INSERT INTO event_type (type_id, type_title) VALUES (1, 'INERTIA'), (2, 'CONTROLLOR CARNIVAL'), (3, 'SWOOSH');

CREATE TABLE participant ( Rollno varchar(20) NOT NULL, name varchar(100) NOT NULL, branch varchar(11) NOT NULL, sem int(11) NOT NULL, email varchar(300) NOT NULL, phone varchar(12) NOT NULL, college varchar(20) NOT NULL, PRIMARY KEY (Rollno) ) ENGINE = InnoDB DEFAULT CHARSET = latin1;
INSERT INTO participant (Rollno, name, branch, sem, email, phone, college) VALUES ('21BT04007', 'Anshumi', 'CSE', 4, 'anshumi@gmail.com', '123456789', 'GSFC'), ('21bt04122', 'Sneh', 'CSE ', 4, 'sneh@GMAIL.COM', '999999999', 'GSFC'), ('21bt04129', 'Khyat' , 'CSE', 5, 'Khyat@gmail.com', '888888888', 'GSFC');

CREATE TABLE registered ( rid int(11) NOT NULL primary key AUTO_INCREMENT, Rollno varchar(20) DEFAULT NULL, event_id int(11) DEFAULT NULL ) ENGINE = InnoDB DEFAULT CHARSET = latin1;
INSERT INTO `registered` (`rid`, `Rollno`, `event_id`) VALUES (1, '21BT04007', 1), (2, '21bt04122', 11), (3, '21bt04129', 7); 

DELIMITER $$
CREATE TRIGGER `count` AFTER INSERT
ON `registered` FOR EACH ROW update events
SET events.participants = events.participants+1
WHERE events.event_id = new.event_id $$ DELIMITER;

CREATE TABLE staff_coordinator ( stid int(11) NOT NULL, name varchar(100) NOT NULL, phone varchar(10) DEFAULT NULL, event_id int(11) DEFAULT NULL, PRIMARY KEY (stid) ) ENGINE = InnoDB DEFAULT CHARSET = latin1;
INSERT INTO staff_coordinator (stid, name, phone, event_id) VALUES (1, 'SWATI SAXENA', '000000000', 1), (2, 'ZALAK KANSAGRA', '111111111', 2), (3, 'NEHA PUJARA ', '222222222', 3), (4, 'ARCHANA MAGARE', '333333333', 4), (5, 'ATUL KOLTE', '444444444', 5), (6, 'KALYANI JOSHI', '55555555', 6), (7, 'HETAL JETHANI ', '666666666', 7), (8, 'SHWETA RAJPUT', '777777777', 8), (9, 'NISHANT MAHADIK', '888888888', 9), (10, 'MIHIR TRIVEDI ', '999997888', 10), (11, 'Dr SAURABH SHAH', '989898989', 11);

CREATE TABLE student_coordinator ( sid int(11) NOT NULL primary key AUTO_INCREMENT , st_name varchar(100) NOT NULL, phone varchar(10) DEFAULT NULL, event_id int(11) DEFAULT NULL ) ENGINE = InnoDB DEFAULT CHARSET = latin1;
INSERT INTO student_coordinator (sid, st_name, phone, event_id) VALUES (1, 'kareena', '6956436610', 1), (2, 'akshar', '7956436123', 2), (3, 'Vraj', '8956436456', 3), (4, 'Vaishnavi', '6956436789', 4), (5, 'Tanvi', '7956436101', 5), (6, 'Siddharth', '8123436610', 6), (7, 'Manthan', '6456436610', 7), (8, 'Shamik', '7789436610', 8), (9, 'khyat', '7956412310', 9), (10, 'Anshumi', '7956445610', 10), (11, 'Sneh ', '6956473510', 11);

ALTER TABLE event_info MODIFY event_id int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 15;

ALTER TABLE registered MODIFY rid int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 11;

ALTER TABLE staff_coordinator MODIFY stid int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 15;

ALTER TABLE student_coordinator MODIFY sid int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 15; COMMIT;