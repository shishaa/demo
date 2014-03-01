trigger AccountDupeCheck on Account (after delete, after insert, after undelete, 
after update, before delete, before insert, before update)

 {
  DuplicateCheckForAccount_Handler handler = new DuplicateCheckForAccount_Handler();
    if(trigger.isBefore)
          {
    	if(trigger.isInsert)
          {
    		
    		//handler.chkDuplicateAccount(trigger.new);
    		
    	 }
    	
    	if(trigger.isUpdate)
        {
    		//handler.chkDuplicateAccount(trigger.new);
    	}


}
}