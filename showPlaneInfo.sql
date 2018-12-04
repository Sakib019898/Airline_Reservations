create or replace procedure showPlaneInfo(mail client.email%type ) IS 
  f varchar2(20);
  l varchar2(20);
  p_n aircraft.plane_name%type;
  p_id int;
  cls varchar2(20);
  p numeric(10,5);
  st_id int;
  
begin
    
	 select fname,lname into f,l from client @sitelink1 where email=mail;
	 if %notfound then
		select fname,lname into f,l from client @sitelink2 where email=mail;
	    dbms_output.put_line('Information of ' || f || ' '|| l );
      
	  select seat_id,plane_id,clas,priceUSD into st_id,p_id,cls,p from booking @sitelink1 where client_id=(select client_id from client where email=mail);
	  select plane_name into p_n from aircraft @sitelink1 where plane_id=p_id;
	  
	  dbms_output.put_line('Aircraft id :' || p_id);
	  dbms_output.put_line('Aircraft name:' || p_n );
	  dbms_output.put_line('Seat number :' || st_id);
	  dbms_output.put_line('Class :' || cls);
	  dbms_output.put_line('Price : $' || p);
	  dbms_output.put_line(chr(10));
         
   
commit;
end;
/
set serveroutput on;
begin
  showPlaneInfo('sakib@gmail.com');
end;
/
      
      