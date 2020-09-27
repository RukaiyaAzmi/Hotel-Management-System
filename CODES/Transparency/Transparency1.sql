-- RoomDetails = UN (RoomDetails1,RoomDetails2)

--site_link1
-- RoomDetails1 @site_link1
select * from RoomDetails1 union select * from RoomDetails2 @site_link2;

--site_link2
-- RoomDetails2 @site_link2
select * from RoomDetails1 @site_link1 union select * from RoomDetails2;