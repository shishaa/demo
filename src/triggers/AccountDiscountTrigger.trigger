trigger AccountDiscountTrigger on Account (after delete, after insert, after undelete, 
after update, before delete, before insert, before update) 

{
   AccountDiscountHandlerClass handler =new AccountDiscountHandlerClass();
   
   if(trigger.isBefore)
   {
     if(trigger.isInsert)
     {
       //handler.isOnBefore(trigger.new);    
     }
   }	
	

   }