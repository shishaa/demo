trigger ContactCheckDupe on Contact (after delete, after insert, after undelete, 
after update, before delete, before insert, before update) 
{
 
	DupeCheckContactHandlerClass Handler=new DupeCheckContactHandlerClass();
	
	if(trigger.isBefore)
	{
	  if(trigger.isInsert)
	  {
	  // Handler.isOnBeforeInsert(trigger.new);
	  }
	}
}