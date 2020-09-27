SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER insert_into_site 
AFTER INSERT OR DELETE ON RoomDetails 
REFERENCING OLD AS old NEW AS new
FOR EACH ROW

BEGIN 

   IF INSERTING THEN
     IF :new.roomRate >= 14000 THEN
	insert into RoomDetails1@site_link1 values (:new.roomNo, :new.roomType, :new.roomRate, :new.review);
     ELSE
	insert into RoomDetails2@site_link2 values (:new.roomNo, :new.roomType, :new.roomRate, :new.review);
     END IF;

  ELSE
     IF :old.roomRate >= 14000 THEN
	delete from RoomDetails1@site_link1 where roomNo = :old.roomNo;
     ELSE
	delete from RoomDetails2@site_link2 where roomNo = :old.roomNo;
     END IF;

  END IF;

END; 
/ 