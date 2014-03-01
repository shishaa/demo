public with sharing class LeadCloneHandlerclass extends LeadVirtualClass
{
  
    //declaring the collection
    public List<Lead> LeadList=new List<Lead>();
   public override List<Lead> isonAfter(List<Lead> leads)
   {
     
     for(Lead lead: leads)
     {
     	system.debug('*****************lead.Status***'+lead.Status);
       if(lead.Status=='Open - Not Contacted')
       {
       	 system.debug('******if*****lead.Status**************'+lead.Status);
         Lead l=(Lead)lead.clone(false,true,false,false);
         l.Status='Working - Contacted';
         LeadList.add(l);
       }
     }
     return LeadList;
   }
}