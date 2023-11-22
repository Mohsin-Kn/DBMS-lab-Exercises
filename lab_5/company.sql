
drop database if exists company;
create database company;
use company;



--
-- Table structure for table `profile`
--
--
CREATE TABLE `profile`(
  `user_id` int(11) PRIMARY KEY,
  `first_name` varchar(80) NOT NULL,
  `last_name` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `password` varchar(80) NOT NULL
);


--
-- Table structure for table `accounts`
--


CREATE TABLE `accounts` (
  `id` int(11) PRIMARY Key,
  `designation` varchar(30) NOT NULL,
  `allowances` int(11) NOT NULL
 );

CREATE TABLE `departments` (
  `id` int(11) PRIMARY Key,
  `dept_name` varchar(30) NOT NULL);





--
-- Dumping data
--

INSERT INTO `profile` (`user_id`, `first_name`, `last_name`, `email`, `password`) VALUES
(1207, 'Sami', 'Ullah', 'sami@gmail.com', 'home123@'),
(1301, 'Amir', 'Abbas', 'amir@gmail.com', 'pakistan123#'),
(1305, 'Haroon', 'Khan', 'haroon@gmail.com', 'Uet123*'),
(1368, 'Noman', 'Rahat', 'noman@gmail.com', 'hello123');


INSERT INTO `accounts` (`id`, `designation`, `allowances`) VALUES 
('1', 'manager', '25000'), 
('2', 'operation manager', '15000');

INSERT INTO `departments` (`id`, `dept_name`) VALUES 
('1', 'sales'), 
('2', 'technical');

COMMIT;


