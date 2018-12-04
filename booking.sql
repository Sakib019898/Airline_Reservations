create or replace procedure book(fn client.fname%type,lnl client.lname%type,pass client.passport%type, v_phone client.phone%type,
v_mail client.email%type, v_code client.country_code%type,
si booking.schedule_id%type,cls booking.clas%type) IS
  v_last_id booking.client_id%type;
  v_pass client.passport%type;
  chk int;
  flag int :=0;
  total_sit int;
  p_id flight.plane_id%type;
  p flight.first_class_price%type;
  p_n aircraft.plane_name%type;
	cursor cr is 
		select client_id from client @sitelink1 UNION select client_id from client @sitelink2;
	cursor cr1 is 
		select passport from client @sitelink1 UNION select passport from client @sitelink2;
	cursor cr2(p_idc booking.plane_id%type,clsc booking.clas%type) is 
		select seat_id from booking where plane_id=p_idc and clas=clsc;
  	  
begin
    open cr,cr1;
	
	loop     
		fetch cr1 into v_pass;
		exit when cr1%notfound;
		if(v_pass=pass) then 
			flag:=1;
	end loop;
	close cr1;
	
	loop     
		fetch cr into v_last_id;
		exit when cr%notfound;
	end loop;
	close cr;
	 v_last_id:=v_last_id+1;
	 dbms_output.put_line('chk:'||chk);
	 select plane_id into p_id from flight where schedule_id=si;
     
	 open cr2(p_id,cls);
	 loop     
     fetch cr2 into chk;
	  exit when cr2%notfound;
     end loop;
     close cr2;
	 chk :=	chk+1;
	 if cls = 'First Class' then
	   select first_class_sit into total_sit from aircraft where plane_id=p_id;
	   select first_class_price into p from flight where plane_id=p_id;
	   
	elsif cls = 'Business Class' then
	   select business_class_sit into total_sit from aircraft where plane_id=p_id;
	   select business_class_price into p from flight where plane_id=p_id;
	   
	elsif cls = 'Economy Class' then
	   select economy_class_sit into total_sit from aircraft where plane_id=p_id;
	   select economy_class_price into p from flight where plane_id=p_id; 
	 end if;

    if chk < total_sit then
		select plane_name into p_n from aircraft where plane_id=p_id;
		if v_code=22 then
			if flag=0 then
				insert into client @sitelink1 values(v_last_id,fn,lnl,v_phone,v_mail,pass,v_code);
			insert into booking(client_id,schedule_id,seat_id,plane_id,clas,priceUSD) @sitelink1 values(v_last_id,si,chk,p_id,cls,p );
		if v_code=88 then
			if flag=0 then
			insert into client @sitelink2 values(v_last_id,fn,lnl,v_phone,v_mail,pass,v_code);
			insert into booking(client_id,schedule_id,seat_id,plane_id,clas,priceUSD) @sitelink2 values(v_last_id,si,chk,p_id,cls,p );
	dbms_output.put_line(fn||' '|| lnl || ' booking complete...');
	dbms_output.put_line('Your id:'|| v_last_id) ;
	dbms_output.put_line('Your aircraft id:'||p_id);
	dbms_output.put_line('Your aircraft name:'||p_n);
	dbms_output.put_line('Your Class:'||cls);
	dbms_output.put_line('Your seat number:'||chk); 
	dbms_output.put_line('Your cost: $'||p);
	else 
	  dbms_output.put_line('No sit available in '|| cls);
	end if;
end;
/
set serveroutput on;
begin
 book('Nora','Fatehi','FA34567','+789789','nora@gmail.com',22,1,'First Class');      
end;
/
select * from client;
select * from booking;
      