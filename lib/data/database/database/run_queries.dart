import 'package:sqflite/sqflite.dart';

class RunQueries {
  String queries = '''
CREATE TABLE IF NOT EXISTS "User" (
	"uid"	INTEGER NOT NULL,
	"name"	TEXT NOT NULL,
	"uImage"	TEXT,
	"password"	TEXT,
	"phone"	TEXT,
	"email"	TEXT,
	"address"	TEXT,
	"isAdmin"	INTEGER NOT NULL DEFAULT 0,
	"country"	INTEGER NOT NULL DEFAULT 0,
	PRIMARY KEY("uid" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Branch" (
	"id"	INTEGER NOT NULL,
	"branchName"	TEXT,
	"branchDesc"	TEXT,
	"branchAddress"	TEXT,
	"status"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Room" (
	"id"	INTEGER NOT NULL,
	"roomNub"	TEXT,
	"roomName"	TEXT,
	"status"	INTEGER,
	"smoke"	INTEGER,
	"roomType"	INTEGER,
	"priceRoom"	INTEGER,
	"maxCapcity"	INTEGER,
	"branchID"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Booking" (
	"id"	INTEGER NOT NULL,
	"uid"	INTEGER,
	"checkIn"	DATE,
	"checkOut"	DATE,
	"peopleNum"	INTEGER,
	"price"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "RoomBooked" (
	"id"	INTEGER NOT NULL,
	"roomId"	INTEGER,
	"bookingId"	INTEGER,
	"checkIn"	DATE,
	"checkOut"	DATE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "User" ("uid","name","uImage","password","phone","email","address","isAdmin","country") VALUES (1,'Admin',NULL,'123456789','01207090513','admin@gmail.com',NULL,1,0);
INSERT INTO "Branch" ("id","branchName","branchDesc","branchAddress","status") VALUES (1,'Assuit','5 Star Banch','assuit',1),
 (2,'Assuit 2','5 Star Banch','assuit',1),
 (3,'Assuit 3','5 Star Banch','assuit',1),
 (4,'Assuit 4','5 Star Banch','assuit',1),
 (5,'Assuit 5','5 Star Banch','assuit',1);
INSERT INTO "Room" ("id","roomNub","roomName","status","smoke","roomType","priceRoom","maxCapcity","branchID") VALUES (1,'1','1',1,0,1,50,1,1),
 (2,'2','2',1,0,1,50,1,1),
 (3,'3','3',2,0,2,70,2,1),
 (4,'4','4',2,0,2,70,2,1),
 (5,'5','5',3,0,3,100,4,1),
 (6,'6','6',3,0,3,100,4,1),
 (7,'1','1',1,0,1,50,1,2),
 (8,'2','2',1,0,1,50,1,2),
 (9,'3','3',2,0,2,70,2,2),
 (10,'4','4',2,0,2,70,2,2),
 (11,'5','5',3,0,3,100,4,2),
 (12,'6','6',3,0,3,100,4,2),
 (13,'1','1',1,0,1,50,1,3),
 (14,'2','2',1,0,1,50,1,3),
 (15,'3','3',2,0,2,70,2,3),
 (16,'4','4',2,0,2,70,2,3),
 (17,'5','5',3,0,3,100,4,3),
 (18,'6','6',3,0,3,100,4,3),
 (19,'1','1',1,0,1,50,1,4),
 (20,'2','2',1,0,1,50,1,4),
 (21,'3','3',2,0,2,70,2,4),
 (22,'4','4',2,0,2,70,2,4),
 (23,'5','5',3,0,3,100,4,4),
 (24,'6','6',3,0,3,100,4,4),
 (25,'1','1',1,0,1,50,1,5),
 (26,'2','2',1,0,1,50,1,5),
 (27,'3','3',2,0,2,70,2,5),
 (28,'4','4',2,0,2,70,2,5),
 (29,'5','5',3,0,3,100,4,5),
 (30,'6','6',3,0,3,100,4,5);

''';

  runQueries(Database db) {
    List<String> list = queries.split(';');
    for (String item in list) {
      print(item);
      db.execute(item);
    }
  }
}
