create or replace procedure Bill_proc
(msg in VARCHAR2)
is
b_id Bill.bill_id%type;
b_cid Bill.c_id%type;
b_roomno Bill.roomNo%type;
b_amount Bill.amount%type;

begin

select max(amount)into b_amount from Bill;
b_amount := b_amount+1;

insert into Bill values(b_id,b_cid,b_roomNo,b_amount,msg);

end;
/
