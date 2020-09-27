CREATE OR REPLACE FUNCTION mobile_show(adid IN admin.admin_id%TYPE)

RETURN integer
IS
mobshow int;

BEGIN

  select mobile_no into mobshow 
  from Admin where admin_id = adid;

  RETURN mobshow;

END mobile_show;
/

SET SERVEROUTPUT ON;
BEGIN
DBMS_OUTPUT.PUT_LINE(mobile_show(2));
END;
/