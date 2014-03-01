trigger OpportunityTrigger on Opportunity (after delete, after insert, after undelete, 
after update, before delete, before insert, before update) 
{
	

Double TotalAmount =0;
Set<Id> opportunityList = new Set<Id>();
for (Opportunity opportunity : Trigger.new) {

    if(opportunity.Expected_Revenue__c != null) 
    {
        opportunityList.add(opportunity.Id);
    }
    else
    {
       opportunityList.add(opportunity.Id);
    }
}
 
Set<Id> oppParent = new Set<Id>();
for(Opportunity opportunity1:[Select Opportunity_LookUp__c 
                            from Opportunity Where Id IN:opportunityList ]) 
{
oppParent.add(opportunity1.Opportunity_LookUp__c);
}

List<Opportunity> opportunityforupdate = new List<Opportunity>();
for(Opportunity c:[Select Id, Expected_Revenue__c from Opportunity where Id IN:oppParent ]) {

 for(Opportunity c1:[Select Id, Amount from Opportunity where Opportunity_LookUp__c IN:oppParent]) 
{
     TotalAmount += c1.Amount;
 
}
c.Expected_Revenue__c =TotalAmount ;
opportunityforupdate.add( c  );
}

update opportunityforupdate;
}