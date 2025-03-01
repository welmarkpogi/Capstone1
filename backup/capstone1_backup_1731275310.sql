# ABMS : MySQL database backup
#
# Generated: Sunday 10. November 2024
# Hostname: localhost
# Database: capstone1
# --------------------------------------------------------


#
# Delete any existing table `announcements`
#

DROP TABLE IF EXISTS `announcements`;


#
# Table structure of table `announcements`
#



CREATE TABLE `announcements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `thumbnail` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4;

INSERT INTO announcements VALUES("42","Update","Way Office ugma kay holiday","20241103063643173061220367270beb555b6.jpg","2024-11-03 13:36:43","","");
INSERT INTO announcements VALUES("43","Sample","Sample ra mo gana ba ang vedio eyyy","20241103063842173061232267270c629dfdc.jpg","2024-11-03 13:38:42","","");



#
# Delete any existing table `certificate_requests`
#

DROP TABLE IF EXISTS `certificate_requests`;


#
# Table structure of table `certificate_requests`
#



CREATE TABLE `certificate_requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resident_id` int(10) unsigned NOT NULL,
  `payment_id` int(10) unsigned DEFAULT NULL,
  `certificate_id` int(10) unsigned NOT NULL,
  `status` enum('resolved','rejected','pending') NOT NULL DEFAULT 'pending',
  `memo` varchar(100) DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `url` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `resident_id` (`resident_id`),
  KEY `payment_id` (`payment_id`),
  KEY `certificate_id` (`certificate_id`),
  CONSTRAINT `certificate_requests_ibfk_1` FOREIGN KEY (`resident_id`) REFERENCES `residents` (`id`),
  CONSTRAINT `certificate_requests_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`),
  CONSTRAINT `certificate_requests_ibfk_3` FOREIGN KEY (`certificate_id`) REFERENCES `certificates` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

INSERT INTO certificate_requests VALUES("13","16","18","1","resolved","For employment","{}","generate_brgy_cert.php?id=16&request_id=13","2024-11-05 15:08:13","2024-11-05 15:11:01","");



#
# Delete any existing table `certificates`
#

DROP TABLE IF EXISTS `certificates`;


#
# Table structure of table `certificates`
#



CREATE TABLE `certificates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `url` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

INSERT INTO certificates VALUES("1","Barangay Certificate","generate_brgy_cert.php");
INSERT INTO certificates VALUES("2","Cutting Permit","generate_cuttingpermit.php");
INSERT INTO certificates VALUES("3","4ps Certification","generate_fpscert.php");
INSERT INTO certificates VALUES("4","Certificate of Indigency","generate_indi_cert.php");
INSERT INTO certificates VALUES("5","Business Clearance","generate_business_permit.php");
INSERT INTO certificates VALUES("6","Cutting Permit","generate_cuttingpermit.php");



#
# Delete any existing table `payments`
#

DROP TABLE IF EXISTS `payments`;


#
# Table structure of table `payments`
#



CREATE TABLE `payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `resident_id` int(10) unsigned DEFAULT NULL,
  `details` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `mode` enum('online','cash') NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `resident_id` (`resident_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`resident_id`) REFERENCES `residents` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

INSERT INTO payments VALUES("6","11","1","Barangay Clearance Payment","200.00","online","2022-05-22 17:35:30","","");
INSERT INTO payments VALUES("7","11","1","Certificate of Indigency Payment","200.00","online","2022-05-22 17:52:50","","");
INSERT INTO payments VALUES("8","11","1","Certificate of Indigency Payment","2.00","online","2022-05-22 17:53:39","","");
INSERT INTO payments VALUES("9","11","6","Business Permit Payment","2.00","online","2022-05-22 18:23:47","","");
INSERT INTO payments VALUES("10","11","2","4PS Certification Payment","21.00","online","2022-05-22 18:34:12","","");
INSERT INTO payments VALUES("11","11","13","Barangay Clearance Payment","12.00","online","2022-05-22 20:56:10","","");
INSERT INTO payments VALUES("12","11","13","Barangay Clearance Payment","12.00","online","2022-05-22 20:56:26","","");
INSERT INTO payments VALUES("13","11","13","Barangay Clearance Payment","12.00","online","2022-05-22 20:56:36","","");
INSERT INTO payments VALUES("14","11","1","Cutting Permit Payment","123.00","online","2022-05-22 21:04:13","","");
INSERT INTO payments VALUES("15","11","9","Barangay Clearance Payment","222.00","online","2022-05-24 23:38:50","","");
INSERT INTO payments VALUES("16","11","9","Barangay Clearance Payment","12.00","online","2022-05-24 23:40:10","","");
INSERT INTO payments VALUES("17","11","9","Business Permit Payment","12312.00","online","2022-06-03 23:31:50","","");
INSERT INTO payments VALUES("18","11","16","Barangay Clearance Payment","125.00","cash","2024-11-05 15:11:01","","");



#
# Delete any existing table `purok`
#

DROP TABLE IF EXISTS `purok`;


#
# Table structure of table `purok`
#



CREATE TABLE `purok` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `details` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

INSERT INTO purok VALUES("1","Purok 1","Camolinas");
INSERT INTO purok VALUES("2","Purok 2","Atabay");
INSERT INTO purok VALUES("3","Purok 3","Puso");
INSERT INTO purok VALUES("4","Purok 4","Caumbay");
INSERT INTO purok VALUES("5","Purok 5","Kasadya");
INSERT INTO purok VALUES("6","Purok 6","Kalan");
INSERT INTO purok VALUES("7","Purok 7","Housing");
INSERT INTO purok VALUES("8","Purok 8","Ubos");
INSERT INTO purok VALUES("9","Purok 9","Sambagan");



#
# Delete any existing table `residents`
#

DROP TABLE IF EXISTS `residents`;


#
# Table structure of table `residents`
#



CREATE TABLE `residents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `national_id` varchar(100) DEFAULT NULL,
  `account_id` int(10) unsigned NOT NULL,
  `citizenship` varchar(50) DEFAULT NULL,
  `picture` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `firstname` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `middlename` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `lastname` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `alias` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `birthplace` varchar(80) CHARACTER SET utf8mb4 DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `civilstatus` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `gender` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `purok_id` int(10) unsigned NOT NULL,
  `voterstatus` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `identified_as` varchar(30) CHARACTER SET utf8mb4 DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `occupation` varchar(100) DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `resident_type` int(11) DEFAULT 1,
  `is_4ps` tinyint(1) DEFAULT 0,
  `is_pwd` tinyint(1) DEFAULT 0,
  `is_senior` tinyint(1) DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  KEY `purok_id` (`purok_id`),
  CONSTRAINT `residents_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `users` (`id`),
  CONSTRAINT `residents_ibfk_2` FOREIGN KEY (`purok_id`) REFERENCES `purok` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

INSERT INTO residents VALUES("16","123","107","filipino","","Welmark","Centillas","Sevellita","Migs","Caumbay Cordova","2024-11-03","1","Single","Male","3","Yes","","123456","welmarksevellita@gmail.com","Student","Caumbay","1","0","1","0","","2024-11-03 13:23:34","","");



#
# Delete any existing table `tbl_support`
#

DROP TABLE IF EXISTS `tbl_support`;


#
# Table structure of table `tbl_support`
#



CREATE TABLE `tbl_support` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;




#
# Delete any existing table `tblblotter`
#

DROP TABLE IF EXISTS `tblblotter`;


#
# Table structure of table `tblblotter`
#



CREATE TABLE `tblblotter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `complainant` varchar(100) DEFAULT NULL,
  `respondent` varchar(100) DEFAULT NULL,
  `victim` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `details` varchar(10000) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

INSERT INTO tblblotter VALUES("10","Joe Rizal","Nora Selos","Joe Rizal","Amicable","Pob 1 Catbalogan, Samar","2020-11-02","00:30:00"," Sustento sa Anaak ","Scheduled");
INSERT INTO tblblotter VALUES("19","Girl Topak","Boy Topak","Girl Topak","Incident","Manila","2021-01-13","11:11:00","Mga Topakin na Pamilya","Active");
INSERT INTO tblblotter VALUES("26","baliw","luka","marites","Amicable","Looc","2021-04-30","13:09:00","Donec sollicitudin molestie malesuada. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Sed porttitor lectus nibh. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.","Settled");
INSERT INTO tblblotter VALUES("27","Ian","annie may","Riza","Amicable","Arado City","2022-04-18","15:59:00","Gin Suntok","Scheduled");



#
# Delete any existing table `tblbrgy_info`
#

DROP TABLE IF EXISTS `tblbrgy_info`;


#
# Table structure of table `tblbrgy_info`
#



CREATE TABLE `tblbrgy_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province` varchar(100) DEFAULT NULL,
  `town` varchar(100) DEFAULT NULL,
  `brgy_name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `city_logo` varchar(100) DEFAULT NULL,
  `brgy_logo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

INSERT INTO tblbrgy_info VALUES("1","Cebu","Cordova","Barangay Poblacion","0919-4567893","Location of Poblacion, Cordova, Cebu, Philippines
Poblacion is one of the Barangays of Cordova.
Cordova is in the Province of Cebu
The province of Cebu is in Region 7 “ Central Visayas.
History of Poblacion, Cordova, Cebu, Philippines
Contribute your knowledge about the history of Poblacion

People of Poblacion, Cordova, Cebu, Philippines
Total Population of Poblacion

Elected Government Officials of Poblacion, Cordova, Cebu, Philippines
Republic Act No. 11462 Approved: 03 December 2019: 
That the barangay and sangguniang kabataan elections on the second Monday of May 2020 shall be postponed to December 5, 2022. The elected barangay officials as of May 14, 2018 will serve until December of 2022.","03112024061056BPC-Logo.jpg","03112024061056BPC-Logo.jpg","03112024061056BPC-Logo.jpg");



#
# Delete any existing table `tblchairmanship`
#

DROP TABLE IF EXISTS `tblchairmanship`;


#
# Table structure of table `tblchairmanship`
#



CREATE TABLE `tblchairmanship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

INSERT INTO tblchairmanship VALUES("2","Presiding Officer");
INSERT INTO tblchairmanship VALUES("3","Committee on Appropriation");
INSERT INTO tblchairmanship VALUES("4","Committee on Peace & Order");
INSERT INTO tblchairmanship VALUES("5","Committee on Health");
INSERT INTO tblchairmanship VALUES("6","Committee on Education");
INSERT INTO tblchairmanship VALUES("7","Committee on Rules");
INSERT INTO tblchairmanship VALUES("8","Committee on Infrastructure ");
INSERT INTO tblchairmanship VALUES("9","Committee on Solid Waste");
INSERT INTO tblchairmanship VALUES("10","Committee on Sports");
INSERT INTO tblchairmanship VALUES("11","No Chairmanship");



#
# Delete any existing table `tbldocuments`
#

DROP TABLE IF EXISTS `tbldocuments`;


#
# Table structure of table `tbldocuments`
#



CREATE TABLE `tbldocuments` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `requested_documents` varchar(50) DEFAULT NULL,
  `purpose` varchar(50) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO tbldocuments VALUES("1","amar","amar@gmail.com","910201645","certificate","school","2022-04-20 06:00:00");



#
# Delete any existing table `tblfpscert`
#

DROP TABLE IF EXISTS `tblfpscert`;


#
# Table structure of table `tblfpscert`
#



CREATE TABLE `tblfpscert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `current_location` varchar(100) DEFAULT NULL,
  `applied` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO tblfpscert VALUES("1","RENATO R. ALMO","Metro Manila","2022-04-15");
INSERT INTO tblfpscert VALUES("2","Annie May Barrera","Manila","2022-04-18");
INSERT INTO tblfpscert VALUES("3","trytr","5454","2022-05-21");



#
# Delete any existing table `tblofficials`
#

DROP TABLE IF EXISTS `tblofficials`;


#
# Table structure of table `tblofficials`
#



CREATE TABLE `tblofficials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `chairmanship` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `termstart` date DEFAULT NULL,
  `termend` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

INSERT INTO tblofficials VALUES("1","Ritchell S. Basillote","2","4","2021-04-29","2021-05-01","Active");
INSERT INTO tblofficials VALUES("4","Mark Anthony Degamo","3","7","2021-04-03","2021-04-24","Active");
INSERT INTO tblofficials VALUES("5","Levi Berdin","4","8","2021-04-03","2022-03-24","Active");
INSERT INTO tblofficials VALUES("6","Bernie Empaces","5","9","2021-10-13","2022-10-26","Active");
INSERT INTO tblofficials VALUES("7","Joseph Vilonta","6","10","2020-05-21","2021-04-03","Active");
INSERT INTO tblofficials VALUES("10","John doe","9","13","2020-06-18","2021-04-03","Active");
INSERT INTO tblofficials VALUES("12","AMY  ZARAGOSA","11","15","2020-07-08","2021-04-03","Active");
INSERT INTO tblofficials VALUES("13","Welmark Sevellita","11","16","2020-10-07","2021-04-03","Active");
INSERT INTO tblofficials VALUES("14","Ernie Jeash Villahermosa","5","","2022-05-18","2022-05-20","Active");
INSERT INTO tblofficials VALUES("15","Ernie Jeash Villahermosa","5","","2022-05-18","2022-05-20","Active");
INSERT INTO tblofficials VALUES("16","Ernie Jeash Villahermosa","5","","2022-05-18","2022-05-20","Active");
INSERT INTO tblofficials VALUES("17","Lorenz Inoc","5","10","2022-05-18","2022-05-20","Active");
INSERT INTO tblofficials VALUES("18","Glourios Hope Cuyos","5","10","2022-05-18","2022-05-20","Active");
INSERT INTO tblofficials VALUES("20","Liera Mae Y. Casquejo","2","12","2024-11-05","2024-11-05","Active");



#
# Delete any existing table `tblpermit`
#

DROP TABLE IF EXISTS `tblpermit`;


#
# Table structure of table `tblpermit`
#



CREATE TABLE `tblpermit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `owner1` varchar(200) DEFAULT NULL,
  `owner2` varchar(80) DEFAULT NULL,
  `nature` varchar(220) DEFAULT NULL,
  `applied` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;




#
# Delete any existing table `tblposition`
#

DROP TABLE IF EXISTS `tblposition`;


#
# Table structure of table `tblposition`
#



CREATE TABLE `tblposition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(50) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

INSERT INTO tblposition VALUES("4","Barangay Captain","1");
INSERT INTO tblposition VALUES("12","Barangay Kagawad","7");
INSERT INTO tblposition VALUES("14","SK Chairman","9");
INSERT INTO tblposition VALUES("15","Secretary","10");
INSERT INTO tblposition VALUES("16","Treasurer","11");



#
# Delete any existing table `tblprecinct`
#

DROP TABLE IF EXISTS `tblprecinct`;


#
# Table structure of table `tblprecinct`
#



CREATE TABLE `tblprecinct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `precinct` varchar(100) DEFAULT NULL,
  `details` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

INSERT INTO tblprecinct VALUES("1","09097750237","DSWD Poblacion");



#
# Delete any existing table `tblrequest`
#

DROP TABLE IF EXISTS `tblrequest`;


#
# Table structure of table `tblrequest`
#



CREATE TABLE `tblrequest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `pcs` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `applied` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO tblrequest VALUES("1","Annie May Barrera","6","coconut","buri","2022-04-15");
INSERT INTO tblrequest VALUES("2","RENATO R. ALMO","6","nara","Dist. 8","2022-04-15");
INSERT INTO tblrequest VALUES("3","Ian Figuracion","100","Flywood","Arado City","2022-04-18");
INSERT INTO tblrequest VALUES("4","trytr","12","12","122","2022-05-22");



#
# Delete any existing table `users`
#

DROP TABLE IF EXISTS `users`;


#
# Table structure of table `users`
#



CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_type` enum('administrator','staff','user') NOT NULL,
  `avatar` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4;

INSERT INTO users VALUES("11","admin","5b2d560b3f2640cadc2ff50ca64bdd936f77eb2d","administrator","data:image/jpeg;base64,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","2021-05-03 10:33:03");
INSERT INTO users VALUES("106","mark","d033e22ae348aeb5660fc2140aec35850c4da997","administrator","data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/4gHYSUNDX1BST0ZJTEUAAQEAAAHIAAAAAAQwAABtbnRyUkdCIFhZWiAH4AABAAEAAAAAAABhY3NwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAA9tYAAQAAAADTLQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAlkZXNjAAAA8AAAACRyWFlaAAABFAAAABRnWFlaAAABKAAAABRiWFlaAAABPAAAABR3dHB0AAABUAAAABRyVFJDAAABZAAAAChnVFJDAAABZAAAAChiVFJDAAABZAAAAChjcHJ0AAABjAAAADxtbHVjAAAAAAAAAAEAAAAMZW5VUwAAAAgAAAAcAHMAUgBHAEJYWVogAAAAAAAAb6IAADj1AAADkFhZWiAAAAAAAABimQAAt4UAABjaWFlaIAAAAAAAACSgAAAPhAAAts9YWVogAAAAAAAA9tYAAQAAAADTLXBhcmEAAAAAAAQAAAACZmYAAPKnAAANWQAAE9AAAApbAAAAAAAAAABtbHVjAAAAAAAAAAEAAAAMZW5VUwAAACAAAAAcAEcAbwBvAGcAbABlACAASQBuAGMALgAgADIAMAAxADb/2wBDAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRT/2wBDAQMEBAUEBQkFBQkUDQsNFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBT/wAARCAD6AdQDASIAAhEBAxEB/8QAGwAAAwEBAQEBAAAAAAAAAAAAAAECAwQFBgn/xAA2EAABBAEDAwMDAwMEAQUBAAABAAIRITEDEkFRYXEEIoETMpGhscFC0eEFFPDxMyMkNFJicv/EABgBAQEBAQEAAAAAAAAAAAAAAAEAAgME/8QAHxEBAQEBAQACAwEBAAAAAAAAAAERITFBYQJRcRKB/9oADAMBAAIRAxEAPwD8vzaEIU9BhEgBCIlSCZ6yYShAzakMWn5QbPJQDFYUADHVPM2jiqQB1pZpMTIFokHqkOo/VOI8qZMQRzISkiCqi8wlEgk2staAN3HwnNZhTJrBVbTRIvhOMmIHN/ugX8KbIiITzQUorbEEwSeAmbnak3OZTs9lkqOYRPe0AHbYpIAAGBXdCOdoISFt/wDqnG4SQiBERaUQEnlVtJsZ6FLbIMGlUH+r9kVJDYJT+mfhExkJkUpJdp3Js+UEEjqrLI7qoIHCt/Z+WUkz3Q1sO/wtRpkioCYZAzfZScrh7hArwiIPKs/+SOVUAag/hO4OEGjKNsc/C0cwGOEtsGM+VnVfpA0+pKe27vpCvZ7bTYzbnP4Uv6zLAAeFJnFrYtkir6jCTgSDSNPjFzSBUoILYqVq5k9v1SIgd0hmBEZ+FJZa1OmXtglS4EOglMoRtg5uOVLbdF0tdhgTSQaJoSe6bTGQGbVlsnp5VFsCAEtp8p0faA0WQSgTghWAfHcIa0otTMsrMoiJ6rU3nwoiSWhP+iktgSpcLWjmEA9eYSAgCplOpPF/9p0IMJ7eQiLr/pWgmkGj/wBI2yeflPYQLpPb0VupBP8AwoVx4QnGWKEIWnQJkQiKQoaOiB+CjCoN5KKgB0Si0NBJT231HZCNuMpgACSSkGlpuAqIApFXkA+3BpBJAgX5UzeDKZBANR8oEptkCAm4gwJrspaDcTKqIylFEtoINDp5QAbr9VQbYGOcLJwgMTnwmBd33RZKYET/AHUsOJF2nt6UkTBiiqImOiF4YBmCkR+UwJJKNlGo8qQggRKUxW0+VYGK/Ce0C5tBS0TZM+E9oOYPlMwee1I2XRKtWJDeFQHBKe0qi2o4UsSAN1FVHIAnunEVEAp7CcLN60V90y2GzBKbWkuifyqDCZgq6PpyOa36gAHCZaGarSMeU4P1+aVOAGo2pWtSy2qghGwxBtUSIrCRb/8ApZOANGIn4QWGbyFQgmrATIzUoHjMWSImEwyanjC0GleRPlItLSQeeU/xZqDYog+FIG3Jz2WjW+6MczCewiz+yFjI6YzKz1Gw4cyuhzQTER1WWo2GnsqVWIDLkmgkWQ4kGFWRmAApDtzZFDstaElpDpwmAMHB5RuEFMxfbqodJwg5tL6cjumfcKohNpqHBSTGKvwkByceFrIHEDuoJg4BCliSN03PdIsMzmOypvuF4VBognCtxMiyX3JKYZVCFWeECSeydCHNJrnqUtpE3WCtDDiIg8Ic2456K34WVAdAoflCtra5QtcTkGUGBSAEQurQFowjnunFiCoErBAAESpg9ECsZ7oqHCA2RKYgm8oBQTz46JgxmipNcqoJ7IzgOSbCAZ6V1SaB1j4SEk3Kp+l9r3d0zTcSpABjPlUaFGe8oxDOED5lO4kkeUgDOalB6BeBSoT0gdEgIFKs+VLCEThXEiP3SbZspgcWb4UooCBTk2tmCTKQaRATEiRxwsrptdBjAQCYooEtcSCCO6AYH79U5q0jQzfRU01/ZJoANX5ROJtWalNmLV7twkBSBWfhW1t0itQDxCoiQLDUthkn8J7SIP8ACIrYbRtyJQesYTBPXCRbHQIWstQBzzaGNaMJPkOJ2yVbBAxSfg4BBkZIVNG6CYnlZtaQa6rRtIHQWwcKmgT5Q23gkDwqIE+08oNDiRzCn7h/Kp0mEFxo0fCJgnE/TIBJKW2BZrur30ScpH7VJB9wJCh/2RfytNTsBBUvdMDspf1zNMgnPZOC4YkJgQOL7JNkCxA8LSxJABsUkZJgKiATNnyjm8JBbI5rsk0XITdjIlA/5Clz1W0m+FDjBHJ6QqcbEGAk4GABKFelk5T+6IKQAFT5Vhpc7AEKCIO667oc0k8+UAe8hW5u5pjATqz9JgAXnghEiBMyra32A/sk0A7qIlGwXjOz/wAlC1aABeUK0ccG6DQ+ERZQZCUQeq9BPiUDIRik2yPhVqgGeqIkzH5TiiEAUDyhbgqRz8JgYi0QIwkGzEgkfspKDeUgRXCbobUFA8WsowZkzAHZIQQbAlAaanKbgCVeINnlMWR+qP8AnVF9FI6NIEYJEo/qnhMePhChEEjt0T5jCIgRhMTdqRgyQBnsrDsyPkqAJwrAkgfspKIAAMJdia7JAwntkzz2Ql1HVKYgHxSMY+ZREEHjohr+Ftg4KpsD5TieEHJTlpaMYCIvoAt2aQAJ+FytJBmYWw9S4ESa7q+hsjQaTS/FQn9ETRVM1QWArUEOgjKrGmY0dotsFSdKeV1bJs47qnaRJESOiGXnO0juPNI+kYgX4XQ7TP1SEyHMOPCDOsBog9ZA6JjTzVLoLA672oY07iBgdkFzO0AzEgymGGSOnVdDtP3ZmeU/owLvuhOQsdIsJucRETu6BdRYAJCX05zJi1X7V45SSRQlTM0RA7ldTtLOAEfSkN57K8ZcjmmBFCUtQQ2QLXa7SrI/CwOiHNNKp64jXNpMdJg2VpqaQDqH5WbQC9wFK+EHTHIPhIuBFZAVFstGcqNtkQExXo2yZikRZjCCXCBFoszI/wAqZ4ckt/5akWe5TDpbYH4SJEf4UeGKz4wrEjvPdQQIBn9EwQPtAVV4pxGAP0Utj5Wg9wkWeigFxMKi1UEHspDSSSBXFpzPSUD3HKJoREIWoZIwPwhG1h5tkQTSNsFATbHK9TYNc/CbYDeqYzXhIAd/ws8BkbalLn+6e3aYz4TAEQcqiKeMynBiB+AgDqK6hUGm4QUAGT1TgjEDynFkDIVBsz3RasKC4Y+UCBEifhAgVX4VDqL7FXwiJ9tUmBATAgdEXj8QolFWnEVmUxIwIREYVoswhz+qBIxQ7oieVbWSKtR9AkGQmZyfhPaIgxKVOH+EBMbruzyqBI4TiJP7JAScT4Vqw4nMfATBIahzY/qT2mc/5U14A6lTJcZkDspbxI+FdBHvIBN4TBkdAlE2gAkjojC309rTJFrrY/TgDcuH6ZypDSDMWqbS9jTLCQS4EYhdDXMw18npC8KXt6hUNR7STJCh8vQO1+s4F0nFq9kt4NYK8c+ocNQw4krRnq3gZn4TdPHqN0+hjrS0GjMCe5XmM9c4ZE2uvT/1AEgGvCP89PPl0/TnqJ5Kn6JMgT8hMerEQSPK109ZmpFkeFZjWRkzSgEWD3FqDpuaMZ5XYABe6kP0gT7c/ugWbHIdPc2hhNmgTgR5XWzSJEG+SYtV9LbMYTkZkcR9OQCQPNrI6TYOZ6QvS+mSwj9VzO0tjiSbnoq7eK8eV6jTAc0sErAaLQ7qei9P1OiGtJ+TS5m6ZOBlZ+he+Oc6BcDACzdpARx8LtcC1oH8LJwMkQIjkK/zfha5jpzY/ZZnTAJml3fQBDYGeQsn6MyItUHjla0efhLaQ49OBC6msAP2yp1NL3N6dVeBzObtAOfhAEA1+Vvskkx+Ejp7e0q9LFszZVmKI63K12BpP7lBYDI/ZawMSOwHlMgzj5W/0ZaaWZZHBhZSQ93BEeUI+niCELWfSefAQbqbQWwQTc8pg1Vhdd/Q9INnm0QRz5TA3VghU75MDlG2pIgT/CvaGizKTWyLiFUGOijpAEWI8IAueVQEVGEx0yhnUwTfPZOLVQY7JmSEa0zLb4VAF0xxyCpawk1S2YOtLWrGYrurgD/mEBoizXYJR0EhHqogc4Qeg5VbYAT2wBypIa2RKtjYmaCBEBULzKzpgBmiZCRaiBHhXA8yo++oaDQmvCprYGE4jslbSARR4V0kWkn+ye3uqa2RQpG2sUg4kUZOVREigENAjHwqg3/CgREIuiE2td0rumAREFQaB5DYP4TZqNBwPlZSN0H9E4aTmFS4sbgjspeAQYUMozMFMmcwflaTm1P/ACE89VY9vgodTinVKRD4VsAM57qCIP7K9OQZNBE9X9dEOLf7rdhBDatczHGKiO66NKiCRJ7Jodek8m6E91u3c6jYBz0XMxokAQZP4XQGu08/os406dPUDdtiVuX7gBAM9lysdLRRJELoYZgAQeStSZD2qOltaSTJI6LJ4biY8croe4kxG4GpC5XnbqUT0go+2pjm9Rph8iOLIC5xpNAJA7CV1+pkFpP9lyhzjuseVnusmzRY4kzHwsX6EknldmmGtY6TlZa8C7nqVZ86rc+HO1oa2CQeyzfpZrPRbtYXmIEdUFu6RBjplTHnrlDRgQD3Uv0pG6IjkLqbpkxt4yrOlLSaP8o1WRwN0y4dO3JQ5gcYAEro2e4ggYruqDIMk2VofxzHTO0FMaVRtbVXytxpQdvHRW3SDRee6NWa5maWzTMRJVO9PuBPIXWdIAVAd05SGkZqPyqdDhHpxGB+J/lC7j6bqwk9kJyfs4+XLe0gI2xgQtA0gdSjYdtUt3g4gRPZG2M/3Vhkf5T27eJVwIFYH4VAggUhok5VbCK/RB9SKAgIIINhVtdF8Hom1pHNJ8SOITdMStGsk90th3YBRzTiA2CJvwrDDtEC1QYSIi1QaR4UqmDt7pQ5bR0CTG2Zyoe1MAi0nA7gAtA2qlJrRJNz5TWsRElWdOR/ZPnkkqiKRUzDCE2jqtNstx8BGwifHKzOpmG/KbtO5ICtrRVBVUYM900xnsqkiYHRaE3WYWeTByjycaAhvKYIivwkJPQpQYx8I/qObr8JFwmMoMkdlIaZ4tI6smspihMqSJOYCbWg/wBQJVgqxIOcrdrC4iqChmnZwQt26e4NBkcpniz4R/tmlziQtG+jY4NEz4Kgs36hJBIFwt2Nk042rTPsn/6ftEz+qpnoOZBtaBmZOOVqwFsneJ/KJmnIxb6MtdYPhW30kEQJB6Bb/VgTuBOYT+s6byVr05HKfTao1W7YDRmV1jRLmiHiBmFQcXNgQIUh73OEQRFo35ZxoxpDgbhasoY/KzGrEA1XKr6waKnuJWvTmNg/bMiT0lZ6z4AODOCUm6wJI/qWXqXMcw7gDByFzpy/Cdcl4MURxK5mHY1wHt60tdTWa1o2mZ4WI1QHEmuyZlZxclpBYfKnU1TtgyeqNPWuavgqdbVJkHH8ItFH1WtoZISabgEtJUagAhwEkflJr3B88flUlZtaueGAZpNry5sTE8AqHghtRJ6JRBrpaMsalUYLbylrNOo1m37geQp3B2pE/otdNrnVz3OVdFVtEBxsjomQJoEk4gUkN26CcXBC1e9stcQQRSM5p3g2FjqAvujTPuIJE9QFLny4gGDmFem1oJkyc0tZjCN7ZMz+YQtDqN06xziUK2B8wQBeZ6oaATUfhW0DwlMVQW/EgiBbY8qgwkTVojdCREGpnoVLRtBEJhllJpdy21bmkCc9lfHqmJDNwwqbpgymCCYwU+IFd1ncaJrQOCpiRYpV5mSgCv7ppwmirN9FcEUMpxt7oMk9O6pfhGBx15RtAqbhTQq090Ht25UeJEtEJtEYj8JGXnKsOoQflEq4Mz/ZABEhMY4nuk50mInwpT7IVgqxjoVO3oZJuE5g4lPxxbDaIbcpDEkflSXTivCRf2Wdpz9LJAOfwoc8TUKHaoaJJhcup60WGie61lqdjtZjG+6AufV/1ACmCY5XC55eZJlJdJ+MjOtn+r1HHMdgszqOdlxUoWwe49SjcepSQpNGep1NM+15Hyu3Q/1hzKeJ7hechFmp7mn67S1iSDZOCV0N1SSIoL5sEgyKK69D1zmkB9gchYv4nXt/XIBq+6009TcAaNdV57dcPbIuuq6NLW2iOi5tbK7RqAVFQqDqiwub60xmEzqExH6Ia35dmlrEix+UnGx7h+Vzh3SfCe+B2CWZc9dbCATuN/lM6kNr3eAuZuoAy7lPeCLvhPIfY6dx+nM1+qjX1KhpEdVidUgDaPlZO1PE9VnYNaF4dAnyuV2oRqbajqqaZBWT/bqAk2U1af1drmgHPHRaO9xJJwFz6jJLS10coMgUMI4FFxa7oO6Pr7gBMQsXOOceeVjvDQSSRfCWHezVbH3YyqBcXUYBxa4Q4tbij1WrNYhvHSVf9WtjABszKvT9VNCyAuV+oRgyMRwnpgEySKNAIlNx1t9QS4tIMnuqbrUWGZXMSCQY27eCFsHQKpPGc+WgeyjOLpQ7WMEtNfqszqwbg+U2Plk/bCB8tBqPI5KFLIc0EgnwhWX9nXlCjKZduEg+e6CBHbmU2gQIgdl03F4iCBHATbJdM2m9gBnPZABBr29kelIcS4jHdDQeXOI6K4gSgAuE/kI4lNjbiT3TDJIyEMbRik6ubHVGnSJmR1TDNo/spA9xnBWzRHZWdI2+0ZPypZHuEz8YVumJEkJMDbPThPg8S1sm1L2GCY7LQ2wZCks3AWfEK39lAYAYBk9JVhvY0p+ntM2VoT0TkwxJad2KCYEiYynRGL7JgV9yvgpAqIykQG9fynUZOOEtsTEo8UZudQpY62uzTvnotniGyRAGV5Wo7fqOd1Kfx/HVaepqu1DJPwpawvNBPTZvMYXfo6UNA6Lds/ESa59P0ZNuNdlqPSNiIXbpaJe6x+FqfSgCTjouf+rflufi8/8A2zQPtBKD6Zhst/C7dTTDBQz+yxMcI2t5JHM707DilB9ONpoLrLQSpLAPCf8AVZ/zHG7QvP6QoOku5wBWTtMn/C1/q6zfxcew9FJBHC6nNisFQQCBJ/ytf6Zxnp6rtN0gr09D1DdRpcD7ui8zUZtM8JaeodN4cFWaJx7jdaAAMwra+SSDfK4muO0GwSFYfg8LGGOv607qyqLyWg9VziiDEKy4E5hZpvW31ifHQ4VfVgAgcLAECSTHlMmqNrQ2t2vMH+CpLzOc9Asw8gd+VL3bgTiFmpbSbA/ZY67hublp57J7g6CCJWGvqndfShKp3kVUXOic8KjqEgyZ6BZfVkDp2KZf8Dsr6on7USIs3OFjqmG+08qy8AGyetLJ5loINIi1q0kgAn8Jltm5A4CxaS3jjqr3+2Epe4ObiVQJ3C8c8Ln32RcpjWmpEeVYNjpL4dMT4VO1TuBwVy7z1kodqyD06I0Ok68GKITLy4dDC5924Ck26u0G0faxq3XIEbZ/VCwDzFH8IW+rIcnjraOlCQiIb1Q0E5x0VbPhQyTBofyk3k9UFkCJgdke4UJB6q34VMnhAk4tSAIAJtMAm5gdFQ/ahcgV1QTEjlAaTg4+FJbGVExxyrDyPKTBM8q6BFSOieUAEgC0g6vumeqeagT2VNAJgCPKpF4TjDb6IZUxNDlW4bupjok6DUAHqn4Wo3AOz8Jk0DB/KsskCInsp2mTQgLM3xqp3WBKoOddkAcQg4uE23kiE+co9ABcZx4CTjwI7ygvG7oOZUmDJEQiWrXL6t+3SOOi85d3rz7Plcui2XLrPNV9b6GmA3MeV3aTbHXusNNgaDBC6tMbACSuN7XX8Z+3Vpj2yIPxEJOcGSCKS0dUEEfmsrQMBOYCm/453agFRlZOcTf2g9l0/Sbu79Vnq6DhOIV6ZK53RHVSRMqyyDHPITGmXHEIZtYExk13UlwdyDHULV7C2eR4WRElaz5CXfhZOYOyt0CjlSapLF6kwRYELBzYK6TFysdQS8LcrFehpCGNAqlQUtcKE0VU/wDYWL6WjMUrqP8A6nKzDpAAgdymDJAnlXtSyG5IJ+VIcXExhVOeBkWs5IFcqGYqZMfwlJaTAvlLcZnlIvJ7AUiJL3RF8rMjcm+gEnmrFqXRMNEFNuo2DJlYzwBE5UkcAwVZ+1uNHarRcKTqAgnqsnA9OUAYEKzGdqi6uUB2Twlni0TAi5HCkrcIrKQeQ6f3pSQTyfBQPutQ1oXnnKAZBCmBPQ8Wjdt4hXDWm4nJQ7UgwKWO7a7v0VMJccqzeppvJ4B/VCz3E4n4QtZRrsBM8kcUgkuyEBhgQ4g9EbXNPA+FkzcAJdhJxJFwfCbQYJN9kFlGKT4Lf2ILQTz2R9w6qYk2ZKsU3H5VltQ2UblItvhW6oHVIkuEEx2V41xWm3JGeUTDpGO6bBtrriENbDiRZx1hUz5BteASSL7qxAbIsrFwh2FYc4n2t/KvsgiJJMVSkDccq956SrAAAiu0KRCgITj/AKRtkmOOyDmCTKqt0UCavqsyZqfhXMmySfwkYaKkwlE5oHlTVzXVBs2ZWT3R9zpCPlph69s6Ujquf07eYHyuj1B3N2xlZaQ2w2YPK3bwfLoaJ/qtXLto5T0WzUT8LR7vpCYscLnyujNz3NEAAGMrI+p19O4J8J/7vUc47dOT+FgfXOG72gRwV0kYrpH+pkUWH4XXo+u03s9wJXnbtRzA8t9p4VMAeBMjwn/hn5fb1Gv0tadvt+VQ+np5hc+l6XUDQ7gqNcgVMrO/p0/4rX1dMHEjsvP1vUsaTtFqngPdEwO4WbhAJDfaMmFr/TnazPqXahnbxwoL3uIpaHVbG7afwk3W7wpjpMJwU6L2/m1Z9wkLMO98YIWTXSTMAWnuxKzabC0MbUW8H2c+0icdE90CQLUmoQCMj9UGqc53Ge6C9zRhRbknAjumUasahm8hM6gcIg/CzmiJMd1IoTkIyK1ZfDbyCiZMkghZugCSI5RFTMqHVRMH9Ahoji1FgyCVIeSQVNLe0kYCGg7rMDup+oSCDPlLfAn91A3SXBKADeU2uDsGBynAAMFQIhIirz1TI2xWVJA4AmUImnP4zSrdAiO2UAAz04lAnbVdk1akmGgm47qgZxhAgt4KkAhxER3CU0a0mZhCkGb/AHCE8D0mS2y35AQ5pNgjvaTiR/YqQ8iv1WfuKc5VDBCCQBmD0UkkmQTCQhwl36q078Q25VEAHqp7hUB7g4lUQ+mSZx5TLKu/BVFwLrypyavwrxZi2jeKFpktGR+Spa6Tkq+DDo7K8X9TDXEYhabdo6KGNDqyehVPd3x2UhQuEmug9Sgt3WVAcciQrY01cQRXtd0TJgEkCO6gOgjMi5KT3fUJAieydWKp0eFDwbiZ8IbAnr0T1LZ4tHykAFwMSsPUCXMEWSunduA5HZYaumN04IWsCQ0A4mFD9MHUkVCTtT6Qjrz1RpE1OOgRZldHV6ed7Q0SV1amm8HcW4WPpTtIOQu/U9SdVm0CAia1nHlamiHXEXwsz6FjiSbcu1zZKGaN4/K1OD/OuE6BcQDJHRdXpP8ATH6j6aWtXUNMAXUdV2aXr2aLQMAdE37P4/jKw1dI6GjsMx+y8f1EyYwvZ9X6zT1NP227K8bXfdmVmTW/ymOeKiyraCKBcG/oqbtN4W30vbuArqntcccTvSBrpBB6BTqMn7sx0wuo5KAKMyEdGOZvsEcdVJZvIK6HMi54WI5hM50NGDabNqiKswfKlnlXE2fysj0nOG24lONtlIn2dEpMYsKSsmO/ISOScobAtOJOaVQkxBIBhKe1eUOFERCQHt/unkWAj2mLSY3cw3fFqw2jArqp08/5V8H1IEhZubC1INm1k8GQIM9lTgwE1AylEtTgmJGEnUeo6hKEkCAU2nuDKUAtoYUjNJnQ0JnFpGJEQgktKjdHtjCz/C1nyBKQioz5U7rquyATMYViaV2Uv+6LHhSCSewQPyFIR/8AqEJ30QnQ9ExPKCJEEAQoNzyRlOa6dSifa9NwuvwlhTvgwbTjc7+UfKON3jyqggcz1Q2YkkQpDgXQJhKVJKpjYbB/BUl20xJK0mRMfhGYd/QbAvbSpzSZMV+6UjNgdOSqBm4VqPSBAzX5SeXb5cPxyipkgwOEnO5JvyqpYIfiApLpgGvKQabJOe6GtkmUQ+FskE88JiZlpk8hPaWuNRPdKdomM55T/FDHtJn8INgmSUAg4kSpcS0kYApK1TPdByM4UuEzA+Vc7BchFk5pXU5xpgC/tWTmtY6Gkgd11uJcC1c+qwAj9in1rW2m6RfwupjvZ9uFxaR4iui6dN0GJo9UeNz1sDNjHMKriqhJpMURHQocDEttM/JtzvH1NUB7vaBOUjp6bnS14jorfpRTgZ6rm1dNgcSXSR0TeqeNz6dwHtxPBXHr6e03av8A3ZZQmFhr+rBuD8oxm1H0XPxR8rp9K9zdT6bvtK5BrOcJOFek+HB17uE+VjXZrsDXe3BwsXAVavUfuMgnusHEtND5VSTyHTdeFgRK0e4xAwkxhPuiyhzq2mZnphWTI48SpaAOZ7Kstwsj4TuMQP0QZ6wge090Ahwv5TGoe2QP5SsXhM+3A+ETzn9kUcItJMhSAcSPwqJdMjCTXHdhG1WgtgCRPaVAJBm/CtwmyVEw6cpg/gdzgFRHug8chaH7cws3CDJM1+FIGSeimAIjnoma+VJIGP1TPpE7GIUi38/mFe6Tt/ZKCKi1rajdg1+eVIE2M+FTr6kpFxBI5RIDExcd5Cki+iHTOSU5kWPBV6QATxHdUQ4FSadcpyDwT26KRTP9UISkdQPiUI4sehNzEDolM0f0USHEU4BWIweUswGZkZ4Ve45EkJNEAk4WkwDcni1ncaxjrOhk3XUrAPc07m3GV1PG8QVzn0zhQd7VqZQ6A7cATlal5H9+qxZQjlUROBKl/GzGteAQUD2zkXdKbHNJmTZtSP6k0Ut+8Z+EEl1nHQJtAcPHVZ9agaTIn8qw8AwT3kpAyftj/wDpQ9xbhpMLU/QW50DqUA+zBnkSuF3+oAPDRpk9ZXY3UDoMFvMEqwwwwlwivKTmOBJkqG+pYXmQboLV0QeB5RdRtdtbZEqt8dlhvAIEgk8Ss/V6x0wA2TPATOp1SW5z1WOq3cyeQsPRP1SHNJJb5wup8OZBx1R2Fhoui5hbbyYhczf/AEyRIhbMdEDPZW41PHVpapJzHyt/rhowHfwuVj2zMSJWhINHCNa2o9R6vTa07hJ7LjPqNwPA7LbV027twAMLJ4Y5sFoHhbnerXPrarQIEklYjVaGmV1HT0yRwsdRrJMX5T9isyWmHBaD3YAWWxvAWrWbR1PQquObZr/bc0st3uFhM0sz1ys3p2gyTBMd1p0UsAndBIK12jmfwrkHSHSPlPExCNp5whoIJquEfZ6l0zlNgLgiTJ6/sqaTMQq9GgxMcILoiEgJc7iOUHMAlZ4YRviO6CbFQm47TYTMkAp1m/SACXf2UkQT1C0AqY/VZAkvrCtH8EzMCFJwRgLQiqBjuodVwJUulO4KHQKKbjffqkbOeUkgNufwnkG0FsiAK7FABAsq99HSDhu6oyc5RGExQMCVJLpB+6CkRXKZaMqsWcJ8SMgYTm7HZOY4nqUAncJx3Ct0kC5uCEIM9J8IUz11vc4ucWi8qmS5omZKAd+YBREkdlknzBEkK5nypNC5KJrNrWcKnHbAFouyTJ8pEzBkThUJJjPOEeQe1JbY48KxAnvhJ0E90xZmQIVvEZjGAkCRQBQ91mMJhvsvPlVmrTLqHJ5QGxYkDoFIk5VtMdgOqMsvDpsHukikOcS0kUENuhaTvsP7LXfRnHGz0zHajveTqAzC6NbUYxpaXBpIgFHp2kS6AHE5U67Xarmt2As5JOFXvqP07C4MLiCAPbGF0PdRmh3Ufa0cQs9Z4Gmd+OvVFmtbjBuno/VBBdObwUvU6xbrANoxS20dFkNcDJ6lTq+l36zXyNvQLUyMq9GJ0ySPcTnqt3mBH7pMDWtAAiOFP2gilm7bxrHPrGXAKWaxYQDd8o1HS+DgILSR1HlFljTo09UnqAFu128AgEDsvOBLJjBXX6bX3DMAUiRqcaS0Eg0ein6LdSttrR0HEFB1C0CBPhb/AIr6wd6YG/tHSVB0mtAuyt9XWMcfyubeXHsnQlzQIohKkHrM+Vk/UjKMZtDnTgyVLfcQFG6Tdq9E75BuE+B0tdDQIgDFJmYmb6KGugWfwqbBCwgXQCKKd9LURImL6LQWIKkg+M9UYOPwg7SOnhBFdSrwYDbqoRwqmwI4UBxyZTNQYMdCs+qAt3GLzlN1ACLQ01yiLOPlbnPAlwAPRI+yEy2aNAqDgfuVXqxQB3dfCh9Zn4WmIOCpcCW0ZR6sZk3OEHtZCboIsmlABdMGFeHDaZEccqYjkFMUIq0hc3fUpUIOgkc8qjMEBOADMwkQSrYkukuBlVJNVKl4JPPdKYMz+i16OnPtIgnsEAz0/KDBgYQCCVYQHkCjSEAThteEIyJ3X1CBNdVLPuKomI8/wsaN0wbzk4hDnQ0VB7lA4SkwE7jM6GmyJkBXMCZpZ6VuK0dhnyrCRaAavmk7DpMI1BExSTfvI4VTinSRSo+1v+U9UARAjCepTTFWmeaLxLXEgxjsUHrz3Sih4V6ggkcf9I+j6nc6G9Ak7VaBLjA6lDOVyetPsatfQldjH7oeI2ooatvE9Fjon/248LDR/wDkjyVQ+O5xA6rPU95De60d9zfCAAdOYvqqd6vaUtY2gEE0IAhLk+FP9ARJM1uzF7qkAYUP1JcfClYatOKM6z/rQ5wLu37qgK4U6YkFatAh1KOoNxNQk5u01U8pO+2eU22R8I8K/qvaIyDyj6xuaSafcfKoAF2FqeKVLtbceVA1eg+IVEAccqNXhN4tQ57iJNKQJzJR/V8KnAfTBi1WZ0MnDNwcwk15aawtC0TgZWT6cVqdHrdurNSLWg1IGVx8/K0ZgJwV1bwYA5TJhw/VY9FqOFjFpvcIwpBkRKcAk0oaPd8q84lTW0x+UTAAJKpgBYZE2lGUXnEC6KNFUbHHVJn3JOwfP8rXIvDJFAwoMD+FT8hGq0A4HC5j5IUwdUGxKbs/Cz4Hj+U+LSB/XgqSYbi1f9UcWoj3hW/LUhCrIo4KnM3XRW/KzdTfla9VUHe6IlAIJOBF5Q0D6RMXGUNHtKqKCQKgie6znbi1oz7Vm/7vhUGnJ4pMGO57JkfspZbhK0VDUcOiE2W1Cv8AMGv/2Q==","2024-11-03 12:50:39");
INSERT INTO users VALUES("107","Migs","7b669e244506916aa2fdc1d60b9bc4e001df533f","user","data:image/jpeg;base64,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","2024-11-03 13:23:34");
INSERT INTO users VALUES("108","Treasurer","4b631f2e707953a1e67f3bcd8fab6d29f57506f5","administrator","data:image/jpeg;base64,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","2024-11-05 11:46:08");
INSERT INTO users VALUES("109","Secretary","a4b375f6f6b544055bf0a12c52f9ebb5c1332332","administrator","","2024-11-05 12:12:24");
INSERT INTO users VALUES("110","Clerk","6ccb4b7c39a6e77f76ecfa935a855c6c46ad5611","staff","","2024-11-05 12:16:14");

