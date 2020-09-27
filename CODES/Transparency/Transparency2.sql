--update RoomDetails set  roomRate = 15000 where roomNo = 3;
declare
v_roomType RoomDetails.roomType%TYPE;
v_review RoomDetails.review%TYPE;
begin
select roomType,review into v_roomType , v_review 
from RoomDetails1 @site_link1
where roomNo = 3;

insert into RoomDetails2 @site_link2  values (3, v_roomType, 14000, v_review);

delete RoomDetails1  @site_link1 where roomNo=3;

commit;
end;
/