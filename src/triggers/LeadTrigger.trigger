trigger LeadTrigger on Lead (after delete, after insert, after undelete, 
after update, before delete, before insert, before update) 

{
   //Creating the instance of handler class
   LeadCloneHandlerclass handler=new LeadCloneHandlerclass();
   
   //Checking the trigger conditions
  
   if(trigger.isAfter)
   {
     if(trigger.isInsert)
     {
     	//handler event assignment
       List<Lead> Leadlist = handler.isonAfter(trigger.new);
   
     }
   
   }  
}//trigger ends


//||trigger.isUpdate