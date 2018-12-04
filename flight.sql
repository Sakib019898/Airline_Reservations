create or replace procedure pr(
fn client.passport%type) IS 
  s_id schedule.schedule_id%type;
  o schedule.origin%type;
  d schedule.dest%type;
  a_t schedule.a_time%type;
  d_t schedule.d_time%type;
  n1 client.fname%type;
  n2 client.lname%type;
  flag int ;
  flag:=0;
	
	select country_code into c_code from client @sitelink1 where passport=fn;
	if %notfound
		select country_code into c_code from client @sitelink2 where passport=fn;
	
  if c_code=22 then
		cursor cr is 
			select schedule_id,origin,dest,a_time,d_time from schedule @sitelink1 where schedule_id=(select schedule_id from booking @sitelink1 where client_id=(select client_id from client where passport=fn));
   else if c_code=88
		cursor cr is 
			select schedule_id,origin,dest,a_time,d_time from schedule @sitelink2 where schedule_id=(select schedule_id from booking @sitelink2 where client_id=(select client_id from client @sitelink2 where passport=fn));
   
begin
     select fname,lname into n1,n2 from client where passport=fn;
     dbms_output.put_line('Name: ' || n1||' '|| n2);
	 open cr;
	     fetch cr into s_id,o,d,a_t,d_t;
		 
	 
	 dbms_output.put_line('Your Schedule ID:' || s_id);
         dbms_output.put_line('From:' || o);
         dbms_output.put_line('To:' || d);
         dbms_output.put_line('Flight time:' || a_t);
         dbms_output.put_line('Reachable time:' || d_t);
         
         
     close cr;

commit;
end;
/
set serveroutput on;
begin
  pr('FA35878');
end;
/
      
      