trigger OpportunityTaskCreation on Account (after insert) {
	
	//list to store the task
   List<Task> TaskAcc=new List<Task>(); 
   
   
   //checking the trigger events
              if(trigger.isAfter){
        
        
            for(Account acc :trigger.new )
    {	
                  //creating new task
                      Task NewTask=new Task();
              
                //the subject of the task
                    NewTask.Subject='Meeting with'+' '+(acc.Name) ;
    
                     NewTask.WhatId=acc.Id;
                      
                       TaskAcc.add(NewTask);
    }
    //insertion of the tasks
insert TaskAcc;                           
}
   }