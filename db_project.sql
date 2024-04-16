# HeidiSQL Dump 
#
# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     db_project
# Server version:               5.0.51b-community-nt
# Server OS:                    Win32
# Target compatibility:         ANSI SQL
# HeidiSQL version:             4.0
# Date/time:                    2024-04-16 16:22:38
# --------------------------------------------------------

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ANSI,NO_BACKSLASH_ESCAPES';*/
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;*/


#
# Database structure for database 'db_project'
#

CREATE DATABASE /*!32312 IF NOT EXISTS*/ "db_project" /*!40100 DEFAULT CHARACTER SET latin1 */;

USE "db_project";


#
# Table structure for table 'tbl_admin'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_admin" (
  "admin_id" int(10) unsigned NOT NULL auto_increment,
  "admin_name" varchar(50) default NULL,
  "admin_email" varchar(50) default NULL,
  "admin_password" varchar(50) default NULL,
  PRIMARY KEY  ("admin_id"),
  UNIQUE KEY "admin_id" ("admin_id"),
  KEY "admin_id_2" ("admin_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_admin'
#

LOCK TABLES "tbl_admin" WRITE;
/*!40000 ALTER TABLE "tbl_admin" DISABLE KEYS;*/
REPLACE INTO "tbl_admin" ("admin_id", "admin_name", "admin_email", "admin_password") VALUES
	('1','Admin','admin@gmail.com','admin@123');
/*!40000 ALTER TABLE "tbl_admin" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_booking'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_booking" (
  "booking_id" int(10) unsigned NOT NULL auto_increment,
  "booking_date" varchar(50) default '0',
  "booking_status" varchar(50) default '0',
  "booking_amount" varchar(50) default '0',
  "user_id" int(10) unsigned NOT NULL,
  "deliveryboy_id" int(10) unsigned default '0',
  PRIMARY KEY  ("booking_id"),
  UNIQUE KEY "booking_id" ("booking_id"),
  KEY "booking_id_2" ("booking_id")
) AUTO_INCREMENT=9;



#
# Dumping data for table 'tbl_booking'
#

LOCK TABLES "tbl_booking" WRITE;
/*!40000 ALTER TABLE "tbl_booking" DISABLE KEYS;*/
REPLACE INTO "tbl_booking" ("booking_id", "booking_date", "booking_status", "booking_amount", "user_id", "deliveryboy_id") VALUES
	('8','2024-04-16','2','100.00','4','0');
/*!40000 ALTER TABLE "tbl_booking" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_cart'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_cart" (
  "cart_id" int(10) unsigned NOT NULL auto_increment,
  "cart_status" varchar(50) default '0',
  "cart_qty" int(10) default '1',
  "food_id" int(10) unsigned default NULL,
  "booking_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("cart_id"),
  UNIQUE KEY "cart_id" ("cart_id"),
  KEY "cart_id_2" ("cart_id")
) AUTO_INCREMENT=14;



#
# Dumping data for table 'tbl_cart'
#

LOCK TABLES "tbl_cart" WRITE;
/*!40000 ALTER TABLE "tbl_cart" DISABLE KEYS;*/
REPLACE INTO "tbl_cart" ("cart_id", "cart_status", "cart_qty", "food_id", "booking_id") VALUES
	('13','1',1,'38','8');
/*!40000 ALTER TABLE "tbl_cart" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_category'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_category" (
  "category_id" int(10) unsigned NOT NULL auto_increment,
  "category_name" varchar(50) default NULL,
  PRIMARY KEY  ("category_id"),
  UNIQUE KEY "category_id" ("category_id"),
  KEY "category_id_2" ("category_id")
) AUTO_INCREMENT=12;



#
# Dumping data for table 'tbl_category'
#

LOCK TABLES "tbl_category" WRITE;
/*!40000 ALTER TABLE "tbl_category" DISABLE KEYS;*/
REPLACE INTO "tbl_category" ("category_id", "category_name") VALUES
	('11','biriyani');
/*!40000 ALTER TABLE "tbl_category" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_complaints'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_complaints" (
  "complaints_id" int(10) unsigned NOT NULL auto_increment,
  "complaints_title" varchar(50) default NULL,
  "complaints_details" varchar(50) default NULL,
  "complaints_replay" varchar(50) default NULL,
  "complaints_date" date default NULL,
  "user_id" int(10) unsigned NOT NULL,
  "complaint_status" varchar(50) default '0',
  PRIMARY KEY  ("complaints_id"),
  UNIQUE KEY "complaints_id" ("complaints_id"),
  KEY "complaints_id_2" ("complaints_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_complaints'
#

LOCK TABLES "tbl_complaints" WRITE;
/*!40000 ALTER TABLE "tbl_complaints" DISABLE KEYS;*/
REPLACE INTO "tbl_complaints" ("complaints_id", "complaints_title", "complaints_details", "complaints_replay", "complaints_date", "user_id", "complaint_status") VALUES
	('1','not good','bdfksdj',NULL,'2024-04-30','4','0');
/*!40000 ALTER TABLE "tbl_complaints" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_deliveryboy'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_deliveryboy" (
  "deliveryboy_id" int(10) unsigned NOT NULL auto_increment,
  "deliveryboy_name" varchar(50) default NULL,
  "deliveryboy_contact" varchar(50) default NULL,
  "deliveryboy_address" varchar(50) default NULL,
  "deliveryboy_email" varchar(50) default NULL,
  "deliveryboy_photo" varchar(50) default NULL,
  "deliveryboy_proof" varchar(50) default NULL,
  "deliveryboy_password" varchar(50) default NULL,
  "deliveryboy_status" varchar(50) default NULL,
  "place_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("deliveryboy_id"),
  UNIQUE KEY "deliveryboy_id" ("deliveryboy_id"),
  KEY "deliveryboy_id_2" ("deliveryboy_id")
) AUTO_INCREMENT=5;



#
# Dumping data for table 'tbl_deliveryboy'
#

LOCK TABLES "tbl_deliveryboy" WRITE;
/*!40000 ALTER TABLE "tbl_deliveryboy" DISABLE KEYS;*/
REPLACE INTO "tbl_deliveryboy" ("deliveryboy_id", "deliveryboy_name", "deliveryboy_contact", "deliveryboy_address", "deliveryboy_email", "deliveryboy_photo", "deliveryboy_proof", "deliveryboy_password", "deliveryboy_status", "place_id") VALUES
	('4','ajith','98765434567','thattedathil(h),thrissur','ajith@gmail.com','DeliveryboyPhoto_1573.jpeg','','ajith1234','online','75');
/*!40000 ALTER TABLE "tbl_deliveryboy" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_district'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_district" (
  "district_id" int(10) unsigned NOT NULL auto_increment,
  "district_name" varchar(50) NOT NULL,
  PRIMARY KEY  ("district_id"),
  UNIQUE KEY "district_id" ("district_id"),
  KEY "district_id_2" ("district_id")
) AUTO_INCREMENT=19;



#
# Dumping data for table 'tbl_district'
#

LOCK TABLES "tbl_district" WRITE;
/*!40000 ALTER TABLE "tbl_district" DISABLE KEYS;*/
REPLACE INTO "tbl_district" ("district_id", "district_name") VALUES
	('18','idukki');
/*!40000 ALTER TABLE "tbl_district" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_food'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_food" (
  "food_id" int(10) unsigned NOT NULL auto_increment,
  "food_name" varchar(50) default NULL,
  "food_details" varchar(50) default NULL,
  "food_rate" varchar(50) default NULL,
  "food_is_active" varchar(50) default NULL,
  "kudumbasree_id" int(10) unsigned default '0',
  "hotel_id" int(10) unsigned default '0',
  "selfemployee_id" int(10) unsigned default '0',
  "subcategory_id" int(10) unsigned default NULL,
  "food_image" varchar(50) default NULL,
  PRIMARY KEY  ("food_id"),
  UNIQUE KEY "food_id" ("food_id"),
  KEY "food_id_2" ("food_id")
) AUTO_INCREMENT=39;



#
# Dumping data for table 'tbl_food'
#

LOCK TABLES "tbl_food" WRITE;
/*!40000 ALTER TABLE "tbl_food" DISABLE KEYS;*/
REPLACE INTO "tbl_food" ("food_id", "food_name", "food_details", "food_rate", "food_is_active", "kudumbasree_id", "hotel_id", "selfemployee_id", "subcategory_id", "food_image") VALUES
	('38','biriyani','biriyani','100',NULL,'0','4','0','22','FoodPhoto_2033.jpg');
/*!40000 ALTER TABLE "tbl_food" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_hotel'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_hotel" (
  "hotel_id" int(10) unsigned NOT NULL auto_increment,
  "hotel_name" varchar(50) default NULL,
  "hotel_contact" varchar(50) default NULL,
  "hotel_address" varchar(50) default NULL,
  "hotel_email" varchar(50) default NULL,
  "hotel_photo" varchar(50) default NULL,
  "hotel_proof" varchar(50) default NULL,
  "hotel_password" varchar(50) default NULL,
  "hotel_status" varchar(50) default '0',
  "place_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("hotel_id"),
  UNIQUE KEY "hotel_id" ("hotel_id"),
  KEY "hotel_id_2" ("hotel_id")
) AUTO_INCREMENT=5;



#
# Dumping data for table 'tbl_hotel'
#

LOCK TABLES "tbl_hotel" WRITE;
/*!40000 ALTER TABLE "tbl_hotel" DISABLE KEYS;*/
REPLACE INTO "tbl_hotel" ("hotel_id", "hotel_name", "hotel_contact", "hotel_address", "hotel_email", "hotel_photo", "hotel_proof", "hotel_password", "hotel_status", "place_id") VALUES
	('4','savitha hotel','9876767897','savitha,idukki.','savitha12@gmail.com','HotelPhoto_2083.jpg','','savitha12345','online','75');
/*!40000 ALTER TABLE "tbl_hotel" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_kudumbasree'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_kudumbasree" (
  "kudumbasree_id" int(10) unsigned NOT NULL auto_increment,
  "kudumbasree_name" varchar(50) default NULL,
  "kudumbasree_contact" varchar(50) default NULL,
  "kudumbasree_address" varchar(50) default NULL,
  "kudumbasree_email" varchar(50) default NULL,
  "kudumbasree_photo" varchar(50) default NULL,
  "kudumbasree_proof" varchar(50) default NULL,
  "kudumbasree_password" varchar(50) default NULL,
  "kudumbasree_status" varchar(50) default NULL,
  "place_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("kudumbasree_id"),
  UNIQUE KEY "kudumbasree_id" ("kudumbasree_id"),
  KEY "kudumbasree_id_2" ("kudumbasree_id")
) AUTO_INCREMENT=3;



#
# Dumping data for table 'tbl_kudumbasree'
#

LOCK TABLES "tbl_kudumbasree" WRITE;
/*!40000 ALTER TABLE "tbl_kudumbasree" DISABLE KEYS;*/
REPLACE INTO "tbl_kudumbasree" ("kudumbasree_id", "kudumbasree_name", "kudumbasree_contact", "kudumbasree_address", "kudumbasree_email", "kudumbasree_photo", "kudumbasree_proof", "kudumbasree_password", "kudumbasree_status", "place_id") VALUES
	('2','thanal','9876543455','thanal,idukki','thanal@gmail.com','KudumbasreePhoto_1324.jpeg','','thanal1234','online','75');
/*!40000 ALTER TABLE "tbl_kudumbasree" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_place'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_place" (
  "place_id" int(10) unsigned NOT NULL auto_increment,
  "place_name" varchar(50) default NULL,
  "district_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("place_id"),
  UNIQUE KEY "place_id" ("place_id"),
  KEY "place_id_2" ("place_id")
) AUTO_INCREMENT=76;



#
# Dumping data for table 'tbl_place'
#

LOCK TABLES "tbl_place" WRITE;
/*!40000 ALTER TABLE "tbl_place" DISABLE KEYS;*/
REPLACE INTO "tbl_place" ("place_id", "place_name", "district_id") VALUES
	('75','kattappana','18');
/*!40000 ALTER TABLE "tbl_place" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_review'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_review" (
  "review_id" int(10) unsigned NOT NULL auto_increment,
  "review_name" varchar(50) default NULL,
  "review_details" varchar(50) default NULL,
  "food_id" int(10) unsigned default NULL,
  "review_count" int(100) default NULL,
  PRIMARY KEY  ("review_id"),
  UNIQUE KEY "review_id" ("review_id"),
  KEY "review_id_2" ("review_id")
);



#
# Dumping data for table 'tbl_review'
#

# No data found.



#
# Table structure for table 'tbl_selfemployee'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_selfemployee" (
  "selfemployee_id" int(10) unsigned NOT NULL auto_increment,
  "selfemployee_name" varchar(50) default NULL,
  "selfemployee_contact" varchar(50) default NULL,
  "selfemployee_address" varchar(50) default NULL,
  "selfemployee_email" varchar(50) default NULL,
  "selfemployee_photo" varchar(50) default NULL,
  "selfemployee_proof" varchar(50) default NULL,
  "selfemployee_password" varchar(50) default NULL,
  "selfemployee_status" varchar(50) default NULL,
  "place_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("selfemployee_id"),
  UNIQUE KEY "selfemployee_id" ("selfemployee_id"),
  KEY "selfemployee_id_2" ("selfemployee_id")
) AUTO_INCREMENT=5;



#
# Dumping data for table 'tbl_selfemployee'
#

LOCK TABLES "tbl_selfemployee" WRITE;
/*!40000 ALTER TABLE "tbl_selfemployee" DISABLE KEYS;*/
REPLACE INTO "tbl_selfemployee" ("selfemployee_id", "selfemployee_name", "selfemployee_contact", "selfemployee_address", "selfemployee_email", "selfemployee_photo", "selfemployee_proof", "selfemployee_password", "selfemployee_status", "place_id") VALUES
	('4','anu','98898765666','puthanpurayil(h),malappuram','anu@gmail.com','SelfemployeePhoto_1130.jpg','','anu1234','online','75');
/*!40000 ALTER TABLE "tbl_selfemployee" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_subadmin'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_subadmin" (
  "subadmin_id" int(10) unsigned NOT NULL auto_increment,
  "subadmin_name" varchar(50) default NULL,
  "subadmin_contact" varchar(50) default NULL,
  "subadmin_email" varchar(50) default NULL,
  "subadmin_photo" varchar(50) default NULL,
  "subadmin_proof" varchar(50) default NULL,
  "subadmin_password" varchar(50) default NULL,
  "district_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("subadmin_id"),
  UNIQUE KEY "subadmin_id" ("subadmin_id"),
  KEY "subadmin_id_2" ("subadmin_id")
) AUTO_INCREMENT=21;



#
# Dumping data for table 'tbl_subadmin'
#

# No data found.



#
# Table structure for table 'tbl_subcategory'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_subcategory" (
  "subcategory_id" tinyint(3) unsigned NOT NULL auto_increment,
  "subcategory_name" varchar(50) default NULL,
  "category_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("subcategory_id"),
  UNIQUE KEY "category_id" ("subcategory_id"),
  KEY "category_id_2" ("subcategory_id")
) AUTO_INCREMENT=23;



#
# Dumping data for table 'tbl_subcategory'
#

LOCK TABLES "tbl_subcategory" WRITE;
/*!40000 ALTER TABLE "tbl_subcategory" DISABLE KEYS;*/
REPLACE INTO "tbl_subcategory" ("subcategory_id", "subcategory_name", "category_id") VALUES
	(22,'chicken','11');
/*!40000 ALTER TABLE "tbl_subcategory" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_user'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_user" (
  "user_id" int(10) unsigned NOT NULL auto_increment,
  "user_name" varchar(50) default NULL,
  "user_contact" varchar(50) default NULL,
  "user_address" varchar(50) default NULL,
  "user_email" varchar(50) default NULL,
  "user_password" varchar(50) default NULL,
  "place_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("user_id"),
  UNIQUE KEY "user_id" ("user_id"),
  KEY "user_id_2" ("user_id")
) AUTO_INCREMENT=5;



#
# Dumping data for table 'tbl_user'
#

LOCK TABLES "tbl_user" WRITE;
/*!40000 ALTER TABLE "tbl_user" DISABLE KEYS;*/
REPLACE INTO "tbl_user" ("user_id", "user_name", "user_contact", "user_address", "user_email", "user_password", "place_id") VALUES
	('4','anjali s','98765457893','kakkanamparabil(h)','anjali@gmail.com','anjali1234','75');
/*!40000 ALTER TABLE "tbl_user" ENABLE KEYS;*/
UNLOCK TABLES;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE;*/
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;*/
