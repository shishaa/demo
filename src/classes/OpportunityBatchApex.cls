global class OpportunityBatchApex implements Database.batchable<sObject>,Database.Stateful
{   
	
	 //public List<Opportunity> ListOpp =new List<Opportunity>();
	 public Double SumAmount;
	 public Integer counter;
	  String query;
      String str ='Closed Won';
	 public String email ='ashish.waghmare@eternussolutions.com';
	 //public string cronString = '0 30 20 ? * MON-FRI';
	 public OpportunityBatchApex()	 
	 {
	   SumAmount=0;
	   counter=0;
	 }
	global Database.QueryLocator start(Database.BatchableContext db)
	{
	  
	 query = 'SELECT Id,Name,Amount,StageName,IsAggregated__c FROM Opportunity Where StageName=\''+str+'\'';
	                                                          //and CreatedDate=today
	                                                         // and IsAggregated__c=false
        return Database.getQueryLocator(query);
	}
	
   global void execute(Database.BatchableContext info,List<Opportunity> opp)
   {
   List<Opportunity> opl =new List<Opportunity>();
    
     for(Opportunity op : opp)
     {
     	 op.IsAggregated__c = true;
             if(op.Amount != null)
             {
             //System.debug('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&'  + op.Amount  );
             SumAmount=SumAmount+op.Amount;
              counter++;
             }
              opl.add(op);   
   
      
     
     }
     update opl;
   }
   
   
   global void finish(Database.BatchableContext BC)
   {
   	  
      
      
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
          mail.setToAddresses(new String[] {email});
          //mail.setReplyTo('ashish.waghmare@eternussolutions.com');
          mail.setSenderDisplayName('Ashish Waghmare ');
          mail.setSubject('Daily Opportunity Amount Aggregator Job Complete');
          mail.setPlainTextBody('The batch job for Daily Opportunity Amount Aggregation is completed successfully.');
                            /* + ' The details associated with the job are as follows:' +
                           'Start DateTime :' + CreatedDate+
                            'End DateTime :  ' +CreatedDate+
                       'Total Duration (in Hours) : <duration in hours>'+
                       'Number of Opportunities Closed Won Today :' +counter+
                     ' Total OpportunityAmount for today : '+SumAmount+);*/
          Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
   
    
   }
   
   


}