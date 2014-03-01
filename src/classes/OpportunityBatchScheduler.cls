global class OpportunityBatchScheduler implements Schedulable
{ 
	
	 global void execute(SchedulableContext sc)
	 
	     {
                OpportunityBatchApex b = new OpportunityBatchApex();
                  database.executebatch(b);
          }

}