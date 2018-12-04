create or replace procedure sc(src schedule.origin%type, 
c schedule.dest%type) IS 
  s_id schedule.schedule_id%type;
  a_t schedule.a_time%type;
  d_t schedule.d_time%type;
  
  cursor cr is 
      select schedule_id,a_time,d_time from schedule where dest=c and origin=src ;
	
begin
    
	open cr;
	dbms_output.put_line('Schedules for destination '||c || ' From '|| src );
    loop     
    fetch cr into s_id,a_t,d_t;
	  exit when cr%notfound;
	  dbms_output.put_line('ID:' || s_id || ' Departure time:' || a_t || '  Arrival time:' || d_t );
                
     end loop;
     close cr;

commit;
end;
/
set serveroutput on;
begin
  sc('Moscow','Dhaka');
end;
/
      
      