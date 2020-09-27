DROP TABLE db_profile_customer CASCADE CONSTRAINTS;
CREATE TABLE db_profile_customer
(attribute varchar2(15),
attribute_size number,
val integer,
PRIMARY KEY(attribute)
);

set serveroutput on;
declare 
cursor  c_cur is
SELECT column_name, data_length FROM user_tab_columns WHERE table_name = 'Customer';

c_name varchar2(15);
c_val integer;
c_len number;
card number;
tabSize number;

begin	
	open c_cur;
	  loop
		fetch c_cur into c_name,c_len;
		exit when c_cur%notFound;
		
		EXECUTE IMMEDIATE 'select count(distinct ' || c_name || ') from Customer' into c_val;
		insert into db_profile_customer values(c_name,c_len,c_val);
	
	  end loop;
	close c_cur;
	
select count(*) into card from Customer;
dbms_output.put_line('Card(Customer) = '||TO_CHAR(card));
	
--select sum(attribute_size) into tabSize from db_profile_customer;
--dbms_output.put_line('Size(Customer) = '||TO_CHAR(tabSize));
	
end;
/

select * from db_profile_customer;



