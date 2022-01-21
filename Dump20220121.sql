CREATE DATABASE  IF NOT EXISTS `englishcenter` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `englishcenter`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: englishcenter
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_user`
--

DROP TABLE IF EXISTS `account_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_user` (
  `idaccount` int NOT NULL AUTO_INCREMENT,
  `iduser` int NOT NULL,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `account_type` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`idaccount`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `fk_account_teacher_idx` (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_user`
--

LOCK TABLES `account_user` WRITE;
/*!40000 ALTER TABLE `account_user` DISABLE KEYS */;
INSERT INTO `account_user` VALUES (1,1,'admin','12345678','ADMIN'),(2,2,'luongdth','12345678','STAFF'),(3,1,'daotrang2120@gmail.com','GV13002021','TEACHER'),(4,2,'ngocp2809@gmail.com','GV28002000','TEACHER'),(5,3,'thuy.cn205@gmail.com','GV20001997','TEACHER'),(6,1,'nguyenvana@gmail.com','HV01002000','STUDENT'),(7,2,'nguyenvanb@gmail.com','HV06002021','STUDENT'),(8,3,'lethic@gmail.com','HV19002000','STUDENT'),(10,5,'env','12345678','STAFF'),(12,5,'alevan@gmail.com','GV14001996','TEACHER'),(13,5,'gnguyenthi@gmail.com','HV12001998','STUDENT'),(14,6,'anguyenthi@gmail.com','HV11002000','STUDENT'),(15,7,'ddovan@gmail.com','HV10002000','STUDENT'),(16,6,'hnguyenthi@gmail.com','GV15001996','TEACHER'),(18,9,'atavan@gmail.com','HV15002000','STUDENT'),(19,6,'thuycn','12345678','STAFF'),(21,10,'btranvan@gmail.com','HV11001999','STUDENT'),(22,11,'thuynv@gmail.com','HV13002000','STUDENT');
/*!40000 ALTER TABLE `account_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `idattendance` int NOT NULL AUTO_INCREMENT,
  `lesson` int DEFAULT NULL,
  `idschedule` int NOT NULL,
  `idstudent` int NOT NULL,
  `idteacher` int NOT NULL,
  `isattendant` int NOT NULL DEFAULT '1',
  `date` date NOT NULL,
  `note` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`idattendance`),
  KEY `fk_attendance_student_idx` (`idstudent`),
  KEY `fk_attendace_schedule_idx` (`idschedule`),
  KEY `fk_attendance_teacher_idx` (`idteacher`),
  CONSTRAINT `fk_attendace_schedule` FOREIGN KEY (`idschedule`) REFERENCES `schedule` (`idschedule`) ON DELETE CASCADE,
  CONSTRAINT `fk_attendance_student` FOREIGN KEY (`idstudent`) REFERENCES `student` (`idstudent`) ON DELETE CASCADE,
  CONSTRAINT `fk_attendance_teacher` FOREIGN KEY (`idteacher`) REFERENCES `teacher` (`idteacher`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin DELAY_KEY_WRITE=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (16,1,110,1,1,1,'2022-01-03',''),(17,2,87,1,2,1,'2022-01-05',''),(18,1,112,2,2,1,'2022-01-03','');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `idclass` int NOT NULL AUTO_INCREMENT,
  `classname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `startdate` date DEFAULT NULL,
  `tuitionfees` int DEFAULT NULL,
  `tuitionfeesales` int DEFAULT NULL,
  `idcourse` int NOT NULL,
  `idteacher` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`idclass`),
  KEY `fk_course_idx` (`idcourse`),
  KEY `fk_class_teacher_idx` (`idteacher`),
  CONSTRAINT `fk_class_teacher` FOREIGN KEY (`idteacher`) REFERENCES `teacher` (`idteacher`) ON DELETE CASCADE,
  CONSTRAINT `fk_course` FOREIGN KEY (`idcourse`) REFERENCES `course` (`idcourse`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,'L01','2022-01-02',5000000,0,1,1,1),(2,'L02','2022-01-03',6000000,0,2,2,1),(3,'L03','2022-01-03',7000000,500000,4,3,1),(4,'L04','2022-01-03',8000000,600000,5,1,1),(5,'L05','2022-01-03',8000000,500000,6,1,1);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classmember`
--

DROP TABLE IF EXISTS `classmember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classmember` (
  `idclass` int NOT NULL,
  `idstudent` int NOT NULL,
  `paidtuition` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`idclass`,`idstudent`),
  KEY `fk_class_idx` (`idclass`),
  KEY `fk_student_idx` (`idstudent`),
  CONSTRAINT `fk_class` FOREIGN KEY (`idclass`) REFERENCES `class` (`idclass`) ON DELETE CASCADE,
  CONSTRAINT `fk_student` FOREIGN KEY (`idstudent`) REFERENCES `student` (`idstudent`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classmember`
--

LOCK TABLES `classmember` WRITE;
/*!40000 ALTER TABLE `classmember` DISABLE KEYS */;
INSERT INTO `classmember` VALUES (1,1,5000000),(1,3,0),(2,2,1000000);
/*!40000 ALTER TABLE `classmember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classroom`
--

DROP TABLE IF EXISTS `classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classroom` (
  `idclassroom` int NOT NULL AUTO_INCREMENT,
  `classroom_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`idclassroom`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classroom`
--

LOCK TABLES `classroom` WRITE;
/*!40000 ALTER TABLE `classroom` DISABLE KEYS */;
INSERT INTO `classroom` VALUES (1,'Phòng 1'),(2,'Phòng 2'),(3,'Phòng 3'),(4,'Phòng 4'),(5,'Phòng 5'),(6,'Phòng 6');
/*!40000 ALTER TABLE `classroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `idcontact` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `message` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `iduser` int NOT NULL,
  PRIMARY KEY (`idcontact`),
  KEY `fk_contact_account_idx` (`iduser`),
  CONSTRAINT `fk_contact_account` FOREIGN KEY (`iduser`) REFERENCES `account_user` (`iduser`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `idcourse` int NOT NULL AUTO_INCREMENT,
  `courseName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `description` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `totallesson` int NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`idcourse`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'Tiếng Anh Cơ Bản','<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Khóa học\nđược thiết kế dành cho các học viên, sinh viên có nhu cầu học Tiếng Anh để củng\ncố kiến thức và nâng cao các kỹ năng nghe, nói, đọc, viết, sử dụng Tiếng Anh\ngiao tiếp trong cuộc sống và công việc.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Khóa học\nđược thiết kế phù hợp với đối tượng học viên, sinh viên Học viện Kỹ thuật mật\nmã có nội dung phong phú, chủ đề cập nhật, cung cấp đầy đủ các kỹ năng cần thiết,\nđáp ứng được nhu cầu của người dạy, người học.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Học viên\nsẽ được đào tạo bởi đội ngũ giáo viên có chuyên môn cao, nhiệt tình giảng\ndạy, thân thiện và giàu kinh nghiệm, tâm huyết.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Học viên\nsẽ được học tại phòng học quy chuẩn với trang thiết bị hiện đại, tạo hứng thú\nvà hiệu quả học tập tốt.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><b><span lang=\"EN-US\">1. Mục tiêu khóa học<o:p></o:p></span></b></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Hướng\ndẫn học viên phát âm và ngữ điệu chuẩn, phản xạ tốt trong giao tiếp;<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Củng cố\nkiến thức ngữ pháp và vốn từ vựng sát thực với môi trường giao tiếp hàng ngày;<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Tạo điều\nkiện cho học viên thực hành kỹ năng giao tiếp thường xuyên;<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Tự tin\nphỏng vấn, giao tiếp với đồng nghiệp, đối tác trong môi trường sử dụng Tiếng\nAnh.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><b><span lang=\"EN-US\">2. Đối\ntượng:</span></b><span lang=\"EN-US\"> Những học viên, sinh viên và người học muốn\nhệ thống lại từ đầu kiến thức Tiếng Anh, lấy kiến thức nền tảng để học các khóa\nhọc cao hơn.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><b><span lang=\"EN-US\">3. Cam kết khóa học:<o:p></o:p></span></b></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Hoàn\nthiện 4 kĩ năng nghe, nói, đọc, viết; rèn luyện khả năng giao tiếp và phản ứng\nvới các tình huống trong môi trường học tập một cách nhanh nhạy và linh hoạt;<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Tạo sự\ntự tin khi học tiếng Anh lên trình độ cao hơn;<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Nắm bắt\nđược hầu hết những cấu trúc, và các hiện tượng ngữ pháp;<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Nâng\ncao khả năng đọc hiểu, viết và nghe nói lên mức độ cao hơn.<o:p></o:p></span></p>',30,1),(2,'Tiếng Anh Giao Tiếp','<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Khi xã hội\nngày càng hội nhập và phát triển, Tiếng Anh trở thành ngôn ngữ giao tiếp toàn cầu\nthì những tình huống mà chúng ta tiếp xúc, giao tiếp với người nước ngoài ngày\ncàng phổ biến.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Khóa học\nTiếng Anh giao tiếp nhằm giúp học viên, sinh viên phản xạ nhanh và chuẩn xác\nkhi giao tiếp trực tiếp với đồng nghiệp và bạn bè quốc tế, khóa học phù hợp với\ncác cá nhân đang học tập và làm việc trong các trường học, cơ quan, cũng như\ncác tổ chức có nhu cầu trau dồi kỹ năng giao tiếp bằng Tiếng Anh.<o:p></o:p></span></p>\n\n<p class=\"MsoListParagraph\" align=\"left\" style=\"margin-left: 0in;\"><b><span lang=\"EN-US\">1. Mục\ntiêu khóa học<o:p></o:p></span></b></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Không chỉ\nlà các bài học về giao tiếp đơn thuần, khóa học tập trung luyện tập toàn bộ các\nkỹ năng Nghe, Nói, Đọc, Viết thông qua các tình huống thực tế. Khóa học chuẩn bị\ncho học viên, sinh viên đầy đủ các kỹ năng Tiếng Anh cần thiết để học tập, làm\nviệc trong môi trường quốc tế. Cụ thể:<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Kỹ\nnăng đọc nhanh để nắm ý;<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Kỹ\nnăng ghi chú nhanh;<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Kỹ\nnăng thuyết trình một cách thuyết phục;<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Kỹ\nnăng sử dụng Tiếng Anh trong các tình huống sinh hoạt hàng ngày một cách tự\nnhiên nhất;<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Rèn\nluyện tư duy hiện đại dưới một phương pháp học tiên tiến;<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Cách\nphát âm và ngữ điệu chuẩn, phản xạ tốt trong giao tiếp;<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Củng cố\nvốn ngữ pháp và từ vựng sát thực với môi trường giao tiếp hàng ngày;<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Tăng\ncường vốn hiểu biết về văn hóa, phong tục, tập quán của nước bản xứ.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><b><span lang=\"EN-US\">2.&nbsp; Đối tượng:</span></b><span lang=\"EN-US\"> Khóa học được thiết kế phù hợp với những đối tượng sau:<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Người\nhọc đã từng học Tiếng Anh nhưng kiến thức căn bản chưa chắc, không giao tiếp được\nbằng Tiếng Anh;<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Người\nhọc muốn học tập và sinh sống tại các quốc gia sử dụng tiếng Anh.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><b><span lang=\"EN-US\">3. Cam kết khóa học:<o:p></o:p></span></b></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Nắm chắc\nkiến thức Tiếng Anh căn bản theo lộ trình cụ thể, tự tin giao tiếp bằng Tiếng\nAnh trong các tình huống xã hội;<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Có khả\nnăng diễn đạt ý bằng các cấu trúc phong phú, phức tạp hơn<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Ứng xử\nlinh hoạt trong các tình huống giao tiếp;<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">-&nbsp; Phát triển lối suy nghĩ logic bằng Tiếng Anh\ngiúp bạn phản xạ nhanh hơn;<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Nắm vững\ncác quy tắc nhấn trọng âm, phát âm chuẩn;<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Mở rộng\nphạm vi và độ chính xác của vốn từ vựng, ngữ pháp thông qua các bài tập dựa\ntrên các tình huống thực tế;<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Luyện\nnói với nhiều chủ đề thực tế đa dạng và trong các tình huống thực tế khác nhau;<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Phát\ntriển kỹ năng thuyết trình, nói trước đám đông;<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Tự tin\nphỏng vấn và làm việc ở các công ty sử dụng tiếng Anh, giao tiếp trôi chảy với\nngười nước ngoài.<o:p></o:p></span></p>',18,1),(3,'TOIEC 4  Kỹ Năng','<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Bạn là\nsinh viên đang lo lắng vì không đạt tiêu chuẩn TOEIC 4 kỹ năng để tốt nghiệp? Bạn\nlà người đang tìm kiếm cơ hội làm việc tại những công ty lớn nhưng trình độ tiếng\nanh hạn chế. Khi tiếng Anh kém khiến bạn bỏ lỡ nhiều cơ hội, hãy đến Anh ngữ\nN2T, tham gia ngay Khóa học TOEIC 4 kỹ năng - Khóa học giúp bạn thành thạo 4 kỹ\nnăng Nghe - Nói - Đọc - Viết trong thời gian ngắn nhất.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">1. ĐỐI\nTƯỢNG THAM GIA KHÓA HỌC<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Khóa học\nTOEIC 4 kỹ năng được xây dựng dành cho những bạn có \"dấu hiệu\" sau:<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Sinh\nviên các trường yêu cầu chuẩn đầu ra TOEIC 4 kỹ năng.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Những\nngười đã đi làm có nhu cầu nâng cao kỹ năng ngoại ngữ, đáp ứng yêu cầu công việc.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">2. LỘ\nTRÌNH HỌC&nbsp; HỌC TOEIC 4 KỸ NĂNG<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Khóa học\nTOEIC 4 kỹ năng (48 buổi) chia làm 03 giai đoạn chính:<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Giai đoạn\n1(15 Buổi): XÂY DỰNG NỀN TẢNG KIẾN THỨC CƠ BẢN<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Hệ thống\nhóa toàn bộ chủ điểm ngữ pháp chắc chắn gặp trong đề thi TOEIC.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Chia sẻ\ncác mẹo làm bài cực nhanh, tiết kiệm thời gian ngay cả học viên mất gốc tiếng\nAnh cũng có thể áp dụng được.&nbsp; <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Hướng dẫn\nphương pháp cơ bản làm bài đọc: phân tích tránh bẫy, các tìm và chọn key words\nkhi làm bài,...<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Cung cấp\n1500 từ vựng trọng tâm thuộc các chủ điểm bài thi TOEIC.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">&nbsp;Giai đoạn 2(15 Buổi): LUYỆN TẬP CHUYÊN SÂU -\nTĂNG TỐC ĐẠT 500+ TOEIC<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Hướng dẫn\nchiến thuật làm bài + từ vựng dành riêng cho part 1 + 2.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Học âm\ncơ bản theo đúng bản phiên âm quốc tế IPA giúp học viên dễ dàng tránh bẫy và đạt\nđiểm số cao bài nghe part 3 + 4. <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Mở rộng\nvốn từ cơ bản và tốc độ làm bài ngữ pháp part 5 + 6. <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Luyện tập\nchuyên sâu và toàn diện kỹ năng đọc hiểu nhằm đạt hiệu quả tối đa khi làm part\n7.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Bổ sung\nhơn 3000 từ vựng học thuật, đa dạng hóa vốn từ không chỉ hỗ trợ cho kỳ thi\nTOEIC mà còn rất hữu dụng trong học tập và công việc. <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Giai đoạn\n3 (18 buổi): HỌC CHUYÊN SÂU 2 KỸ NĂNG SPEAKING &amp; WRITING<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Chuẩn\nhóa ngữ âm theo bảng phiên âm quốc tế IPA, từ phát âm, ngữ điệu, ending sound,\ntạo độ trôi chảy khi giao tiếp.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Chinh phục\n6 phần trong TOEIC Speaking: (Read a Text, Describe a picture, Respond to the\nquestions, Respond to the questions using information given, Propose a\nsolution, Express an opinion) và TOEIC Writing.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">3. ƯU ĐIỂM\nVƯỢT TRỘI CỦA KHÓA TOEIC 4 KỸ NĂNG<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Xóa mù\ntiếng Anh, củng cố lại kiến thức tiếng Anh cơ bản.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Lộ\ntrình học học tinh gọn chỉ trong 48 buổi thành thạo cả 4 kỹ năng.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Nâng\ncao kỹ năng làm đề, trang bị kỹ năng giao tiếp, ứng dụng thực tế.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Cam kết\nhọc viên đạt 700+ TOEIC đầu ra bằng hợp đồng đào tạo.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Học\nviên ứng dụng được cả 4 kỹ năng Nghe - Nói - Đọc - Viết sau khi kết thúc khóa học.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">4. CAM KẾT\nĐÀO TẠO<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Anh ngữ\nN2T cam kết: Chỉ sau một khóa học, học viên đạt ngay 700+ TOEIC đầu ra.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Học\nviên tự tin làm chủ 4 kỹ năng Nghe - Nói - Đọc - Viết, vừa nâng cao điểm số, vừa\ngiúp khẳng định bản thân trong môi trường công sở.<o:p></o:p></span></p>',48,1),(4,'TOIEC 0-450','<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Khóa học\nTOEIC cho người mất căn bản - TOEIC 0 - 450 của N2T được xây dựng theo lộ trình\ntối ưu gồm 28 buổi trong vòng 3,5 tháng. Chương trình học liên tục cập nhật và\nđổi mới, đảm bảo học viên có được kiến thức và kết quả học tập cao nhất.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Khóa học\nTOEIC 450 dành riêng cho người mất gốc là lớp học nổi bật của trung tâm luyện\nthi toeic giá rẻ tại Hà Nội.<o:p></o:p></span></p>\n\n<p class=\"MsoListParagraph\" align=\"left\" style=\"text-indent: -0.25in;\"><!--[if !supportLists]--><b><span lang=\"EN-US\">1.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</span></span></b><!--[endif]--><b><span lang=\"EN-US\">ĐỐI TƯỢNG THAM GIA KHÓA HỌC TOEIC 0-450<o:p></o:p></span></b></p>\n\n<p class=\"MsoNormal\" align=\"left\" style=\"margin-left: 0.25in;\"><span lang=\"EN-US\">- Người mất gốc tiếng Anh, chưa từng học và thi TOEIC.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\" style=\"margin-left: 0.25in;\"><span lang=\"EN-US\">- Học viên cần học lại từ đầu theo một lộ trình xuyên suốt và tiết\nkiệm thời gian.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\" style=\"margin-left: 0.25in;\"><span lang=\"EN-US\">- Học sinh chuyên ban A đã quên kiến thức tiếng Anh, cần lấy lại căn\nbản để thi TOEIC.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\" style=\"margin-left: 0.25in;\"><span lang=\"EN-US\">- Học viên từng tự học và đi học nhưng không đạt được mục tiêu điểm\nTOEIC như mong muốn.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\" style=\"margin-left: 0.25in;\"><span lang=\"EN-US\">- Học viên cần đạt mục tiêu TOEIC 500+ để ra trường, nhận được công\nviệc tốt có thu nhập cao hơn.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><b><span lang=\"EN-US\">2. Lộ trình học khóa toeic 0-450<o:p></o:p></span></b></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Khóa học\nTOEIC 0-450 được xây dựng theo lộ trình tinh gọn giúp bạn hoàn thành mục tiêu\n450+ TOEIC chỉ trong 28 buổi học.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Giai\nđoạn 1 (15 buổi): XÂY DỰNG NỀN TẢNG KIẾN THỨC CƠ BẢN<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Hệ thống\nhóa toàn bộ chủ điểm ngữ pháp chắc chắn gặp trong đề thi TOEIC.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Chia sẻ\ncác mẹo làm bài nhanh, tiết kiệm thời gian ngay cả học viên mất gốc tiếng Anh\ncũng có thể áp dụng được. <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Hướng dẫn\nphương pháp cơ bản làm bài đọc: phân tích tránh bẫy, các tìm và chọn key words\nkhi làm bài,...<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Cung cấp\n1500 từ vựng trọng tâm thuộc các chủ điểm bài thi TOEIC<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Giai\nđoạn 2 (13 buổi): LUYỆN TẬP CHUYÊN SÂU - TĂNG TỐC ĐẠT 450 TOEIC<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Hướng dẫn\nchiến thuật làm bài giúp tiết kiệm thời gian trong phòng thi<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Cung cấp\ntừ vựng dành riêng cho part 1 + 2.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Học âm\ncơ bản theo đúng bản phiên âm quốc tế IPA giúp học viên dễ dàng tránh bẫy và đạt\nđiểm số cao bài nghe part 3 + 4. <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Mở rộng\nvốn từ cơ bản và tốc độ làm bài ngữ pháp part 5 + 6. <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Luyện tập\nchuyên sâu và toàn diện kỹ năng đọc hiểu nhằm đạt hiệu quả tối đa khi làm part\n7.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Bổ sung\nhơn 3000 từ vựng học thuật, đa dạng hóa vốn từ không chỉ hỗ trợ cho kỳ thi\nTOEIC mà còn rất hữu dụng trong học tập và công việc. <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><b><span lang=\"EN-US\">3. ƯU ĐIỂM VƯỢT TRỘI CỦA KHÓA HỌC TOEIC 0 - 450<o:p></o:p></span></b></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Lộ\ntrình học rõ ràng tinh gọn, đạt mục tiêu 500+ trong thời gian ngắn nhất với 28\nbuổi học trong vòng 3,5 tháng.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Giáo\ntrình và phương pháp giảng dạy học “độc quyền”, bám sát dạng đề thi và cung cấp\nchiến thuật làm bài hiệu quả giúp các bạn đạt được kết quả tối thiểu TOEIC 450\ntrong thời gian nhanh nhất.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Ký hợp\nđồng đào tạo bằng văn bản cam kết đầu ra: N2T sẽ đào tạo lại miễn phí 1 năm nếu\nhọc viên không đạt 450 điểm sau khi thi chứng chỉ tại IIG.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Giảng\nviên trực tiếp đứng lớp, ra đề kiểm tra cũng như quản lý chất lượng lớp học.\nCùng với đó là đội ngũ trợ giảng hùng hậu, nhiệt tình luôn sẵn sàng hỗ trợ và\ngiải đáp thắc mắc cho học viên.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Môi\ntrường học tập nghiêm túc, học thật - thi thật, rèn cho các học viên tính kỷ luật\nbản thân.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Chất\nlượng đào tạo hàng đầu, học phí tối ưu: N2T luôn áp dụng mức học phí thấp, hỗ\ntrợ học phí cho những học viên là học sinh, sinh viên và trao học bổng định kỳ\nhàng tháng cho những bạn đạt mục tiêu.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><b><span lang=\"EN-US\">4. CAM KẾT ĐÀO TẠO KHI ĐĂNG KÝ KHÓA HỌC TOEIC 0-450<o:p></o:p></span></b></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Ký hợp\nđồng đào tạo: <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Cam kết\nchỉ sau 1 khóa học (28 buổi), đạt ngay 450+ TOEIC đầu ra.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Đào tạo\nlại miễn phí nếu học viên không đạt chuẩn đầu ra (450/990).<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Nắm chắc\ntất cả các chủ đề ngữ pháp, vốn từ vựng cần thiết trong kỳ thi TOEIC.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Rèn\nluyện kỹ năng nghe chuẩn xác.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Nắm vững\nformat, đồng thời nắm được phương pháp nâng điểm cực nhanh trong thời gian ôn\nthi TOEIC cực ngắn.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Đến 80%\nhọc viên chỉ đăng kí khóa học TOEIC 450 nhưng sau khóa học đã đạt với số điểm\nTOEIC 500- 650.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><b><span lang=\"EN-US\">5. Học phí và ưu đãi<o:p></o:p></span></b></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Các ưu\nđãi và quà tặng khác (áp dụng cộng gộp)<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Nhóm 2\nbạn giảm 100.000VNĐ/bạn<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Nhóm\n03 bạn giảm 200.000VNĐ/bạn<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Học\nviên đã học ưu đãi tới 65% học phí<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><b><span lang=\"EN-US\">6. TÀI LIỆU HỌC MIỄN PHÍ<o:p></o:p></span></b></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Hỗ trợ\nmiễn phí giáo trình, tài liệu trong suốt quá trình học.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Bộ\ngiáo trình do Ms. Đào Trang biên soạn.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Bộ đề\nluyện tập ngoại khóa nhằm rèn luyện kỹ năng phản xạ và vốn từ vựng tiếng Anh.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Các\nvideo bài giảng phục vụ cho việc ôn tập bài cũ&nbsp;<o:p></o:p></span></p>',28,1),(5,'TOIEC 450-750','<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Chứng chỉ\nTOEIC đang là một điều kiện không thể thiếu để xét chuẩn đầu ra của các trường\nĐại học lớn. Hơn thế nữa, bằng TOEIC còn nổi lên như một tiêu chuẩn phổ biến để\nđánh giá năng lực, trình độ thông thạo tiếng Anh của người lao động trong những\nnăm gần đây. Vậy nên nếu số điểm TOEIC của bạn càng cao bạn sẽ mở ra cơ hội cho\nchính bản thân, bạn sẽ có lợi thế lớn trong các cuộc phỏng vấn vào những công\nty lớn. Hiểu được điều đó, Anh ngữ N2T đã cho ra đời và phát triển KHÓA HỌC\nTOEIC 450 - 750.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Khóa học\nTOEIC 450 - 750 là khóa học dành cho những bạn đã có nền tảng tiếng Anh cơ bản,\nmong muốn đạt mục tiêu 750 TOEIC. Khóa học này sẽ giúp bạn phát triển khả năng\nxử lý các phần trong bài thi một cách trơn tru nhất, tránh những sai sót không\nđáng có, cung cấp các mẹo và chiến thuật làm bài thi nhằm tối ưu mục tiêu tăng\nđiểm. Khóa học tập trung khai thác thói quen ra đề TOEIC và xu hướng tránh bẫy\nTOEIC thường gặp. Với lộ trình học tiêu chuẩn và phương pháp học thông minh,\nAnh ngữ N2T xin cam kết với bạn mục tiêu 750 TOEIC sẽ nằm trong tầm tay, thậm\nchí cao hơn nữa trong thời gian ngắn nhất.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">1. ĐỐI\nTƯỢNG THAM GIA KHÓA HỌC<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Học\nviên đã hoàn thành khóa TOEIC 0 – 450+ tại Anh Ngữ N2T, hoặc có trình độ test đầu\nvào tại trung tâm đạt tối thiểu 450 TOEIC.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Muốn đạt\nchứng chỉ TOEIC với điểm số từ 750 trở lên nhưng không có lộ trình học đúng đắn,\ncụ thể, rõ ràng và chi tiết.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">&nbsp; KHÓA HỌC TOEIC 450-750 LUÔN FULL SỚM, VÌ VẬY\nHÃY NHANH TAY ĐẶT TRƯỚC 500K ĐỂ GIỮ CHỖ<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">2. ƯU ĐIỂM\nVƯỢT TRỘI CỦA KHÓA HỌC TOEIC 450 - 750<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Chương\ntrình học rút gọn trong 20 buổi, học viên hoàn toàn có thể chinh phục TOEIC 750\nmột cách dễ dàng.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Lộ\ntrình học được thiết kế độc quyền với 3 ưu điểm: Tinh gọn, hiệu quả, dễ hiểu.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- N2T ký\nhợp đồng đào tạo cam kết học viên sẽ đạt được điểm số TOEIC 750 đầu ra. Nếu\nkhông đạt được số điểm như trong cam kết, học viên sẽ được học lại miễn phí 01\nlần.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Giảng\nviên trực tiếp đứng lớp, ra đề kiểm tra cũng như quản lý chất lượng lớp học.\nCùng với đó là đội ngũ trợ giảng nhiệt tình, giàu kinh nghiệm, luôn theo sát hỗ\ntrợ và giải đáp mọi thắc mắc của học viên trong quá trình học.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Môi\ntrường học tập: Nghiêm túc, học thật - thi thật rèn cho các học viên tính kỷ luật\nbản thân cao. <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">3. CAM KẾT\nĐÀO TẠO<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">K</span><span lang=\"EN-US\">ý</span><span lang=\"EN-US\"> hợp đồng đào tạo: <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">&nbsp;- Cam kết chỉ sau 1 khóa học (20 buổi), đạt\nngay 750 TOEIC đầu ra.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">&nbsp;- Đào tạo lại miễn phí nếu học viên không đạt\nchuẩn đầu ra.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">&nbsp;Nắm chắc tất cả các chủ đề ngữ pháp, vốn từ vựng\ncần thiết trong kỳ thi TOEIC.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">&nbsp;R</span><span lang=\"EN-US\">è</span><span lang=\"EN-US\">n luyện kỹ năng nghe chuẩn xác.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">&nbsp;Nắm vững format, đồng thời nắm được phương\npháp nâng điểm cực nhanh trong thời gian ôn thi TOEIC cực ngắn.<o:p></o:p></span></p>',20,1),(6,'TOIEC 750+','<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Chứng chỉ\nTOEIC đang là một điều kiện không thể thiếu để xét chuẩn đầu ra của các trường\nĐại học lớn. Hơn thế nữa, bằng TOEIC còn nổi lên như một tiêu chuẩn phổ biến để\nđánh giá năng lực, trình độ thông thạo tiếng Anh của người lao động trong những\nnăm gần đây. Vậy nên nếu số điểm TOEIC của bạn càng cao bạn sẽ mở ra cơ hội cho\nchính bản thân, bạn sẽ có lợi thế lớn trong các cuộc phỏng vấn vào những công\nty lớn. Hiểu được điều đó, Anh ngữ N2T đã cho ra đời và phát triển KHÓA HỌC\nTOEIC 750+.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">Khóa học\nTOEIC 750+ là khóa học dành cho những bạn đã có khả năng đạt được 500+ trở lên,\nmong muốn đạt mục tiêu 750+ TOEIC. Khóa học này sẽ giúp bạn phát triển khả năng\nxử lý các phần trong bài thi một cách trơn tru nhất, tránh những sai sót không\nđáng có, cung cấp các mẹo và chiến thuật làm bài thi nhằm tối ưu mục tiêu tăng\nđiểm. Khóa học tập trung khai thác thói quen ra đề TOEIC và xu hướng tránh bẫy\nTOEIC thường gặp. Với lộ trình học tiêu chuẩn và phương pháp học thông minh,\nAnh ngữ N2T xin cam kết với bạn mục tiêu 750+ TOEIC sẽ nằm trong tầm tay, thậm\nchí cao hơn nữa trong thời gian ngắn nhất.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">1. ĐỐI\nTƯỢNG THAM GIA KHÓA HỌC<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Muốn đạt\nchứng chỉ TOEIC với điểm số từ 750+ nhưng không có lộ trình học đúng đắn, cụ thể,\nrõ ràng và chi tiết.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">&nbsp; KHÓA HỌC TOEIC 750+ LUÔN FULL SỚM, VÌ VẬY HÃY\nNHANH TAY ĐẶT TRƯỚC 500K ĐỂ GIỮ CHỖ<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">2. ƯU ĐIỂM\nVƯỢT TRỘI CỦA KHÓA HỌC TOEIC 750+<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Lộ\ntrình học được thiết kế độc quyền với 3 ưu điểm: Tinh gọn, hiệu quả, dễ hiểu.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- N2T ký\nhợp đồng đào tạo cam kết học viên sẽ đạt được điểm số TOEIC 750+ đầu ra. Nếu\nkhông đạt được số điểm như trong cam kết, học viên sẽ được học lại miễn phí\nkhóa học.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Giảng\nviên trực tiếp đứng lớp, ra đề kiểm tra cũng như quản lý chất lượng lớp học.\nCùng với đó là đội ngũ trợ giảng nhiệt tình, giàu kinh nghiệm, luôn theo sát hỗ\ntrợ và giải đáp mọi thắc mắc của học viên trong quá trình học.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">- Môi\ntrường học tập: Nghiêm túc, học thật - thi thật rèn cho các học viên tính kỷ luật\nbản thân cao. <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">3. CAM KẾT\nĐÀO TẠO<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">K</span><span lang=\"EN-US\">ý</span><span lang=\"EN-US\"> hợp đồng đào tạo: <o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">&nbsp;- Cam kết chỉ sau 1 khóa học (25 buổi), đạt\nngay 750+ TOEIC đầu ra.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">&nbsp;- Đào tạo lại miễn phí nếu học viên không đạt\nchuẩn đầu ra.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">&nbsp;Nắm chắc tất cả các chủ đề ngữ pháp, vốn từ vựng\ncần thiết trong kỳ thi TOEIC.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">&nbsp;R</span><span lang=\"EN-US\">è</span><span lang=\"EN-US\">n luyện kỹ năng nghe chuẩn xác.<o:p></o:p></span></p>\n\n<p class=\"MsoNormal\" align=\"left\"><span lang=\"EN-US\">&nbsp;Nắm vững format, đồng thời nắm được phương\npháp nâng điểm cực nhanh trong thời gian ôn thi TOEIC cực ngắn.<o:p></o:p></span></p>',25,1),(17,'demo','<p>dsfsfs</p>',0,0);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll`
--

DROP TABLE IF EXISTS `payroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payroll` (
  `idteacher` int NOT NULL,
  `idclass` int NOT NULL,
  `idsalary` int NOT NULL,
  `numberOfTeaching` int NOT NULL,
  `totalMoney` int DEFAULT NULL,
  `month` int NOT NULL,
  KEY `fk_payroll_class_idx` (`idclass`),
  KEY `fk_payroll_teacher_idx` (`idteacher`),
  CONSTRAINT `fk_payroll_class` FOREIGN KEY (`idclass`) REFERENCES `class` (`idclass`) ON DELETE CASCADE,
  CONSTRAINT `fk_payroll_teacher` FOREIGN KEY (`idteacher`) REFERENCES `teacher` (`idteacher`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll`
--

LOCK TABLES `payroll` WRITE;
/*!40000 ALTER TABLE `payroll` DISABLE KEYS */;
/*!40000 ALTER TABLE `payroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register_student`
--

DROP TABLE IF EXISTS `register_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `register_student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `birthday` date NOT NULL,
  `gender` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `question` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `registerday` date NOT NULL,
  `idcourse` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_register_course_idx` (`idcourse`),
  CONSTRAINT `fk_register_course` FOREIGN KEY (`idcourse`) REFERENCES `course` (`idcourse`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register_student`
--

LOCK TABLES `register_student` WRITE;
/*!40000 ALTER TABLE `register_student` DISABLE KEYS */;
INSERT INTO `register_student` VALUES (3,'Nguyễn Văn D','2000-01-03','Nam','Hà Nội','0968735420','nguyenvand@gmail.com',NULL,'2021-11-13',4);
/*!40000 ALTER TABLE `register_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salaryunit`
--

DROP TABLE IF EXISTS `salaryunit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salaryunit` (
  `idsalaryUnit` int NOT NULL AUTO_INCREMENT,
  `idcourse` int NOT NULL,
  `salary` int NOT NULL,
  PRIMARY KEY (`idsalaryUnit`),
  KEY `fk_salaryunit_course_idx` (`idcourse`),
  CONSTRAINT `fk_salaryunit_course` FOREIGN KEY (`idcourse`) REFERENCES `course` (`idcourse`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salaryunit`
--

LOCK TABLES `salaryunit` WRITE;
/*!40000 ALTER TABLE `salaryunit` DISABLE KEYS */;
INSERT INTO `salaryunit` VALUES (1,1,100000),(2,2,120000),(3,3,80000),(4,4,110000),(5,5,150000),(6,6,120000);
/*!40000 ALTER TABLE `salaryunit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `idschedule` int NOT NULL AUTO_INCREMENT,
  `idclass` int NOT NULL,
  `times` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `idweeksday` int NOT NULL,
  `idclassroom` int NOT NULL,
  PRIMARY KEY (`idschedule`),
  KEY `fk_weeksday_idx` (`idweeksday`),
  KEY `fk_class_idx` (`idclass`),
  KEY `fk_classroom_idx` (`idclassroom`),
  CONSTRAINT `fk_schedule_class` FOREIGN KEY (`idclass`) REFERENCES `class` (`idclass`) ON DELETE CASCADE,
  CONSTRAINT `fk_schedule_classroom` FOREIGN KEY (`idclassroom`) REFERENCES `classroom` (`idclassroom`) ON DELETE CASCADE,
  CONSTRAINT `fk_schedule_weeksday` FOREIGN KEY (`idweeksday`) REFERENCES `weeksday` (`idweeksday`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (87,1,'8h-10h',4,1),(109,4,'14h-16h',2,1),(110,1,'15h-17h',2,2),(111,2,'15h-18h',3,1),(112,2,'15h-18h',2,1);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `idstaff` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `photo` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `idposition` int DEFAULT NULL,
  PRIMARY KEY (`idstaff`),
  KEY `fk_staff_position_idx` (`idposition`),
  CONSTRAINT `fk_staff_position` FOREIGN KEY (`idposition`) REFERENCES `staff_position` (`idstaff_position`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Tạ Ngọc Tuệ','2000-02-15','Nam','Thái Bình','0967325834','tangoctue1502@gmail.com',NULL,1),(2,'Đỗ Thị Hiền Lương','2001-02-27','Nữ','Thái Bình','0968567715','doluong1502@gmail.com',NULL,1),(5,'Nguyễn Văn E','1990-04-11','Nam','Hà Nội','0987654321','nguyenvane@gmail.com',NULL,2),(6,'Chu Ngọc Thuỷ','1997-05-20','Nam','Hà Nội','0987654321','thuycn@gmailcom',NULL,1);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_position`
--

DROP TABLE IF EXISTS `staff_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_position` (
  `idstaff_position` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`idstaff_position`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_position`
--

LOCK TABLES `staff_position` WRITE;
/*!40000 ALTER TABLE `staff_position` DISABLE KEYS */;
INSERT INTO `staff_position` VALUES (1,'ADMIN'),(2,'STAFF');
/*!40000 ALTER TABLE `staff_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `idstudent` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `photo` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`idstudent`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Nguyễn Văn A','2000-02-01','Nam','Hà Nội','0987654321','nguyenvana@gmail.com',NULL),(2,'Nguyễn Văn B','2021-11-06','Nam','Hà Nội','0968753241','nguyenvanb@gmail.com',NULL),(3,'Lê Thị C','2000-07-19','Nữ','Hà Nội','0987654321','lethic@gmail.com',NULL),(5,'Nguyễn Thị G','1998-06-12','Nữ','Hà Nội','09876543321','gnguyenthi@gmail.com',NULL),(6,'Nguyễn Thị A','2000-02-11','Nữ','Hà Nội','0987654321','anguyenthi@gmail.com',NULL),(7,'Đỗ Văn D','2000-04-10','Nam','Hà Nội','0987654321','ddovan@gmail.com',NULL),(9,'Tạ Văn A','2000-02-15','Nam','Hà Nội','0967854321','atavan@gmail.com',NULL),(10,'Trần Văn B','1999-08-11','Nam','Hà Nội','09876321','btranvan@gmail.com',NULL),(11,'Nguyễn Văn Thuỷ','2000-07-13','Nam','Hà Nội','0967328541','thuynv@gmail.com',NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `idteacher` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `photo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `qualification` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'trình độ chuyên môn',
  PRIMARY KEY (`idteacher`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,'Đào Thị Trang','2021-11-13','Nữ','Thái Bình','0369607516','daotrang2120@gmail.com',NULL,'Giảng viên Tiếng Anh'),(2,'Phạm Thị Ngọc','2000-09-28','Nữ','Nam Định','0356491576','ngocp2809@gmail.com',NULL,'Giảng viên Tiếng Anh'),(3,'Chu Ngọc Thuỷ','1997-05-20','Nam','Hà Nội','0354596538','thuy.cn205@gmail.com',NULL,'Giảng viên Tiếng Anh'),(5,'Lê Văn A','1999-02-10','Nam','Hà Nội','0987654321','alevan@gmail.com',NULL,'Giảng viên Tiếng Anh'),(6,'Nguyễn Thị H','1996-03-15','Nữ','Hà Nội','0987654332','hnguyenthi@gmail.com',NULL,'Giảng viên Tiếng Anh');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tuition`
--

DROP TABLE IF EXISTS `tuition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tuition` (
  `idtuition` int NOT NULL AUTO_INCREMENT,
  `idclass` int NOT NULL,
  `idstudent` int NOT NULL,
  `paidtuition` int NOT NULL,
  `arrearage` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtuition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tuition`
--

LOCK TABLES `tuition` WRITE;
/*!40000 ALTER TABLE `tuition` DISABLE KEYS */;
/*!40000 ALTER TABLE `tuition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weeksday`
--

DROP TABLE IF EXISTS `weeksday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weeksday` (
  `idweeksday` int NOT NULL,
  `weeksday_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`idweeksday`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weeksday`
--

LOCK TABLES `weeksday` WRITE;
/*!40000 ALTER TABLE `weeksday` DISABLE KEYS */;
INSERT INTO `weeksday` VALUES (1,'Chủ Nhật'),(2,'Thứ 2'),(3,'Thứ 3'),(4,'Thứ 4'),(5,'Thứ 5'),(6,'Thứ 6'),(7,'Thứ 7');
/*!40000 ALTER TABLE `weeksday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'englishcenter'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-21 22:05:09
