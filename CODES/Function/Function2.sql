CREATE OR REPLACE FUNCTION employ_room(rid IN RoomDetails.roomNo%TYPE)

RETURN varchar2
IS
rm varchar2 (20);

BEGIN
  select count(emp_id) into rm from employee where roomno=rid;

  RETURN rm;

END;
/

SET SERVEROUTPUT ON;
BEGIN
DBMS_OUTPUT.PUT_LINE(employ_room(1));
END;
/