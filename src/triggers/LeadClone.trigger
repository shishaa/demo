trigger LeadClone on Lead (after insert, after update) {
	
	
	   //collection to hold the list of leads after insert
              List<Lead> listObject=new List<Lead>();
       //collection to hold the list of leads after update
                List<Lead> listObject1=new List<Lead>();
    
                          //checking the trigger events
	                           if(trigger.isAfter)
	                                  {
		                    //checking the trigger action 
		                         if(trigger.isInsert)
		                              {

                                     //iterating through leadrecord
	                               for(Lead leadRecord :Trigger.new )
	                                  {
		                                 //checking the status 
	                            if(leadRecord.Status == 'Open - Not Contacted')
	                                       {
		                                     Lead lead1=new Lead();
		                                      //creating the clone
		                                 lead1=leadRecord.clone(false,true,false,false);
		                                      //changing the status
		                                       lead1.Status = 'Working - Contacted';
		                                             //adding the leads to leadlist
		                                                listObject.add(lead1);
	                                                }
	                                       }
		                          }
		                                               if(trigger.isUpdate)
		                                         {
	                               for(Lead leadRecord :Trigger.old )
	                                   {
	                                           if(leadRecord.Status == 'Open - Not Contacted')
	                                                    {
		                                                       Lead lead1=new Lead();
		                                                       lead1=leadRecord.clone(false,true,false,false);
		                                                         lead1.Status = 'Working - Contacted';
		
		                                                           listObject1.add(lead1);
	                                                       }
	                                          }
		                     }
	insert listObject;
	
	insert listObject1;
	}
	 
	    }