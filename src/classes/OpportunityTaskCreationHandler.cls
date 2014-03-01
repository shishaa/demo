public with sharing class OpportunityTaskCreationHandler extends VirtualClass 
{
  
	public override List<Task> isOnAfterInsert(List<Account> AccountList)
	{
		//collection to store  the tasks list
		List<Task> opportunityTasksList = new List<Task>();
		
		 for(Account account: AccountList)
       {
       	//new task creation
          Task tasks =new Task();
          //assigning the subject to the task
          tasks.Subject = 'Meeting With '+account.Name;
          tasks.WhatId = account.Id;
          //adding the tasks to the list
          opportunityTasksList.add(tasks);
          
       }
		return opportunityTasksList;
	}//isOnAfterInsert method ends

}//class ends