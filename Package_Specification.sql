CREATE OR REPLACE PACKAGE c_package AS 
   -- Show Prices 
   PROCEDURE show_price(src schedule.origin%type, 
	c schedule.dest%type) 
   
   -- Cancel booking
   PROCEDURE cancel(ppt client.passport%type) 
   
   -- Flight Schedules
   PROCEDURE sc(src schedule.origin%type, c schedule.dest%type)

   
  
END c_package;