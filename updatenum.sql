create or replace procedure updateNumber( v_email client.email%type, v_num client.phone%type)
is 
  v_id client.client_id%type;
begin
     select client_id into v_id from client@server_1 where email=mail;
      EXCEPTION
      WHEN NO_DATA_FOUND then
          v_id := NULL;
      if v_id is null then
       select client_id into v_id from client@server_2 where email=mail;
       end if;
      update  
      update client set phone = phn where client_id=v_id;


	
commit;
end;
/
set serveroutput on;
begin
	
  updateNumber('sofia@gmail.com','+99977777');
  
end;
/
commit;
      
      