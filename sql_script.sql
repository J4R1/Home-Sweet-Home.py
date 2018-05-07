drop database if exists r10;

create database r10;
CREATE USER 'dbuser10'@'localhost' IDENTIFIED BY 'dbpass';
GRANT SELECT, INSERT, UPDATE, DELETE ON r10.* TO dbuser10@localhost;
use r10;
CREATE TABLE OBJECT
(
  OBJECT_ID INT NOT NULL,
  DESCRIPTION VARCHAR(100) NOT NULL,
  NAME VARCHAR(30) NOT NULL,
  PRIMARY KEY (OBJECT_ID)
);

CREATE TABLE ROOM
(
  ROOM_ID INT NOT NULL,
  NAME VARCHAR(50),
  OBJECT_ID INT,
  DESCRIPTION VARCHAR(100),
  PRIMARY KEY (ROOM_ID),
  FOREIGN KEY (OBJECT_ID) REFERENCES OBJECT(OBJECT_ID)
);

CREATE TABLE ACCESS
(
  ROOM_ID_1 INT NOT NULL,
  ACCESSROOM_ID_2 INT NOT NULL,
  DIRECTIONS VARCHAR(50),
  LOCKED TINYINT(4),
  LOCKED_NOTE VARCHAR(50),
  PRIMARY KEY (ROOM_ID_1, ACCESSROOM_ID_2),
  FOREIGN KEY (ROOM_ID_1) REFERENCES ROOM(ROOM_ID),
  FOREIGN KEY (ACCESSROOM_ID_2) REFERENCES ROOM(ROOM_ID)
);

CREATE TABLE PLAYER
(
  PLAYER_ID INT NOT NULL,
  NAME VARCHAR(30) NOT NULL,
  TURNS_LEFT INT NOT NULL,
  ROOM_ID INT NOT NULL,
  PRIMARY KEY (PLAYER_ID),
  FOREIGN KEY (ROOM_ID) REFERENCES ROOM(ROOM_ID)
);


INSERT INTO object VALUES (1,"Wounded child", "Son");
INSERT INTO object VALUES (2,"The Key to the Shed", "Shed key");
INSERT INTO object VALUES (3,"Jump Starter to start the Car", "Jump starter");
INSERT INTO object VALUES (4,"The Key to the Hen House", "Hen house key");
INSERT INTO object VALUES (5,"Cables fot the Jump Starter", "Jump starting cables");
INSERT INTO object VALUES (6,"Pack of Bandages", "Bandages");
INSERT INTO object VALUES (7,"Kitchen knife", "Knife");







INSERT INTO ROOM VALUES (1, "Yard 1", NULL,"The Drive way. You can see the front door of the house and also the road to backside of the house.");
INSERT INTO ROOM VALUES (2, "Hallway 1", NULL,"In the hallway you can see family portrait.");
INSERT INTO ROOM VALUES (3, "Hallway 2", NULL,"Just a crossroad to get in to different room");
INSERT INTO ROOM VALUES (4, "Bedroom 1", NULL,"A childs bedroom");
INSERT INTO ROOM VALUES (5, "Appliance Room", 2,"The appliance room. There is a key cabinet.");
INSERT INTO ROOM VALUES (6, "Bathroom", 6,"The bathroom.");
INSERT INTO ROOM VALUES (7, "Living room 1", NULL,"Part of the living room.");
INSERT INTO ROOM VALUES (8, "Living room 2", NULL,"Part of the living room.");
INSERT INTO ROOM VALUES (9, "Childs room", 1,"Your child has been stabbed.");
INSERT INTO ROOM VALUES (10, "Parents room", NULL,"The parents bedroom, nothing interesting here");
INSERT INTO ROOM VALUES (11, "Kitchen", 7,"The kitchen. A new set of knives and an unfinished meal");
INSERT INTO ROOM VALUES (12, "Yard 2", 4,"Part of the yard next to a hen house.");
INSERT INTO ROOM VALUES (13, "Yard 3", NULL,"Part of the yard next to a shed, and there is a swing.");
INSERT INTO ROOM VALUES (14, "Shed", 3,"A messy shed. BUT there is the jump starter");
INSERT INTO ROOM VALUES (15, "Car", NULL,"The car");
INSERT INTO ROOM VALUES (16, "Hen house", 5,"The Hen house. And look there is cables hanging from the wall");

INSERT INTO PLAYER VALUES (1, "Player", 50, 1);


INSERT INTO ACCESS VALUES (1,2,"N",0,NULL);
INSERT INTO ACCESS VALUES (1,13,"E",0,NULL);
INSERT INTO ACCESS VALUES (1,15,"W",0,NULL);
INSERT INTO ACCESS VALUES (2,1,"S",0,NULL);
INSERT INTO ACCESS VALUES (2,3,"W",0,NULL);
INSERT INTO ACCESS VALUES (2,11,"N",0,NULL);
INSERT INTO ACCESS VALUES (3,2,"E",0,NULL);
INSERT INTO ACCESS VALUES (3,4,"S",0,NULL);
INSERT INTO ACCESS VALUES (3,5,"N",0,NULL);
INSERT INTO ACCESS VALUES (3,6,"W",0,NULL);
INSERT INTO ACCESS VALUES (4,3,"N",0,NULL);
INSERT INTO ACCESS VALUES (5,3,"S",0,NULL);
INSERT INTO ACCESS VALUES (6,3,"E",0,NULL);
INSERT INTO ACCESS VALUES (7,8,"E",0,NULL);
INSERT INTO ACCESS VALUES (7,9,"S",0,NULL);
INSERT INTO ACCESS VALUES (7,11,"W",0,NULL);
INSERT INTO ACCESS VALUES (8,7,"W",0,NULL);
INSERT INTO ACCESS VALUES (8,10,"S",0,NULL);
INSERT INTO ACCESS VALUES (8,12,"E",0,NULL);
INSERT INTO ACCESS VALUES (9,7,"N",0,NULL);
INSERT INTO ACCESS VALUES (9,10,"E",0,NULL);
INSERT INTO ACCESS VALUES (10,8,"N",0,NULL);
INSERT INTO ACCESS VALUES (10,9,"W",0,NULL);
INSERT INTO ACCESS VALUES (11,2,"S",0,NULL);
INSERT INTO ACCESS VALUES (11,7,"E",0,NULL);
INSERT INTO ACCESS VALUES (12,8,"W",0,NULL);
INSERT INTO ACCESS VALUES (12,13,"S",0,NULL);
INSERT INTO ACCESS VALUES (12,16,"N",1,"Locked");
INSERT INTO ACCESS VALUES (13,1,"W",0,NULL);
INSERT INTO ACCESS VALUES (13,12,"N",0,NULL);
INSERT INTO ACCESS VALUES (13,14,"S",1, "Locked");
INSERT INTO ACCESS VALUES (14,13,"N",0,NULL);
INSERT INTO ACCESS VALUES (15,1,"E",0,NULL);
INSERT INTO ACCESS VALUES (16,12,"S",0,NULL);