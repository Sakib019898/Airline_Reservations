create or replace procedure cancel(ppt client.passport%type) IS 
   id client.client_id%type;  
  
begin
    
	  select client_id into id from client where passport=ppt;
       DELETE FROM booking WHERE client_id=id;
	   DELETE FROM client WHERE client_id=id;
	  dbms_output.put_line('Cancellation complete');
	    
   
commit;
end;
/
set serveroutput on;
begin
  cancel('FA93247');
end;
/
      
      