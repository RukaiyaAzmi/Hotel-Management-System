create or replace procedure room_rate
is

cursor t is
select roomdetails.roomrate,review,roomtype from roomdetails inner join reservation
on reservation.roomno=roomdetails.roomno where reservation.c_id=4 ;

ther roomdetails.roomrate%Type;
ther1 roomdetails.review%Type;
ther2 roomdetails.roomtype%Type;

begin

    open t;
		
		loop
			fetch t into ther,ther1,ther2;
			exit when t%notfound;
			dbms_output.put_line(ther||' '||ther1||' '||ther2); 
		end loop;
	close t;

end;
/

SET SERVEROUTPUT ON;
BEGIN
room_rate;
END;
/