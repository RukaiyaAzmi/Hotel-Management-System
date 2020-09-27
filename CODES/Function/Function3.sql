CREATE OR REPLACE FUNCTION review_show(rid IN RoomDetails.roomNo%TYPE)

RETURN varchar2
IS
revshow varchar2 (20);

BEGIN

  select review into revshow 
  from RoomDetails where roomNo = rid;

  RETURN revshow;

END review_show;
/

SET SERVEROUTPUT ON;
BEGIN
DBMS_OUTPUT.PUT_LINE(review_show(1));
END;
/