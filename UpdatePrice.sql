select schedule_id,origin,dest from schedule;
create or replace procedure up_price(s_id int ,cl varchar2,p flight.first_class_price%type) IS 
  
begin
    
	if cl = 'First Class' then
	   update flight set first_class_price = p where schedule_id=s_id;
	elsif cl = 'Business Class' then
	   update flight set business_class_price = p where schedule_id=s_id;
	elsif cl = 'Economy Class' then
	   update flight set economy_class_price = p where schedule_id=s_id;
	else 
	  dbms_output.put_line('No class exist by that name');
	end if;
	
commit;
end;
/
set serveroutput on;
begin
  up_price(1,'Business Class',900);
end;
/
      
      