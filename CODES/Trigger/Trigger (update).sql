SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER update_RoomDetails 
AFTER UPDATE OF roomRate ON RoomDetails 
REFERENCING OLD AS old NEW AS new
FOR EACH ROW

BEGIN 
   
 IF :old.roomRate< 14000 and :new.roomrate >= 14000 THEN
    insert into RoomDetails1@site_link1 values (:new.roomNo, :new.roomType, :new.roomRate, :new.review);
    delete from RoomDetails2@site_link2 where roomNo = :new.roomNo;
	
 ELSIF :old.roomRate >= 14000 and :new.roomRate < 14000 THEN	
       insert into RoomDetails2@site_link2 values (:new.roomNo, :new.roomType, :new.roomRate, :new.review);
       delete from RoomDetails1@site_link1 where roomNo = :new.roomNo;
		
 ELSIF :old.roomRate >= 14000 and :new.roomRate >= 14000 THEN	
       update RoomDetails@site_link1 set roomRate = :new.roomRate;
	
 ELSE
       update RoomDetails2@site_link2 set roomRate = :new.roomRate;
		
 END IF;
   
END; 
/ 