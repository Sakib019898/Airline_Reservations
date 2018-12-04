CREATE OR REPLACE PACKAGE BODY c_package AS 
   PROCEDURE show_price(src schedule.origin%type, 
	c schedule.dest%type) IS 
	s_id schedule.schedule_id%type;
	a_t schedule.a_time%type;
	d_t schedule.d_time%type;
	f_p flight.first_class_price%type;
	b_p flight.business_class_price%type;
	e_p flight.economy_class_price%type;
	p_n aircraft.plane_name%type;
	p_id flight.plane_id%type;
  
	cursor cr is 
      
		select schedule_id,plane_id,first_class_price,business_class_price,economy_class_price from flight where schedule_id in (select schedule_id from schedule where dest=c and origin=src) ;
	
	begin
    
		open cr;
		dbms_output.put_line('Prices for destination '||c || ' From'|| src );
		loop     
		fetch cr into s_id,p_id,f_p,b_p,e_p;
		exit when cr%notfound;
	  
		select a_time,d_time into a_t,d_t from schedule where schedule_id=s_id ;
		select plane_name into p_n from aircraft where plane_id=P_id;
	  
		dbms_output.put_line('ID:' || s_id);
		dbms_output.put_line('Departure time:' || a_t );
		dbms_output.put_line('Arrival time:' || d_t);
		dbms_output.put_line('Aircraft:' || p_n );
		dbms_output.put_line('First class price :' || f_p);
		dbms_output.put_line('Business class price :' || b_p);
		dbms_output.put_line('Economy class price :' || e_p);
		dbms_output.put_line(chr(10));
         
          
		end loop;
		close cr;

		commit;
	end; 
   
   PROCEDURE cancel(ppt client.passport%type) IS 
	id client.client_id%type;  
  
	begin
    
		select client_id into id from client where passport=ppt;
		DELETE FROM booking WHERE client_id=id;
		DELETE FROM client WHERE client_id=id;
		dbms_output.put_line('Cancellation complete');
	    
   
		commit;
	end;  
  PROCEDURE sc(src schedule.origin%type, 
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

   
END c_package; 