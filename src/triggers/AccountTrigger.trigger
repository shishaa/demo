trigger AccountTrigger on Account (after delete, after insert, after undelete, 
after update, before delete, before insert, before update) 
{
	//handler object
	OpportunityTaskCreationHandler handler = new OpportunityTaskCreationHandler();
	//checking for the trigger events
   if(trigger.isAfter)
   {
   	
     if(trigger.isInsert)
     {
     	//assigning the tasklist getting from handler
     	//List<Task> tlist = handler.isOnAfterInsert(trigger.new);
     }
   }//isafter condition ends	
   
   

}//trigger ends