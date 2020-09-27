CREATE OR REPLACE FUNCTION nationality_show(cname IN Customer.name%TYPE)

RETURN varchar2
IS
natshow varchar2 (20);

BEGIN

  select nationality into natshow 
  from Customer where name = cname;

  RETURN natshow;

END nationality_show;
/

SET SERVEROUTPUT ON;
BEGIN
DBMS_OUTPUT.PUT_LINE(nationality_show('Laboni'));
END;
/