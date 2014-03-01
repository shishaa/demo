public with sharing class HandlerClassPurchaseOrderLineItem extends VirtualClassPurchaseOrderLineItem
{
   public override void isOnBeforeInsert(List<Purchase_Order_Line_Item__c> LPE)
   {
      //collection
	      set<Id> SId=new Set<Id>();
	       Set<Integer> s=new  Set<Integer>();
	      
	      for(Purchase_Order_Line_Item__c pe:LPE)
	      {
	        SId.add(pe.Id);
	      }
	       List<Opportunity> entries = new List<Opportunity>
	       (
      //  [select UnitPrice from pricebookentry 
      
	       [Select (Select Quantity, ListPrice From OpportunityLineItems) From Opportunity o  where id in :SId]);
		       system.Debug('*************************'+entries);
	      /* for (Purchase_Order_Line_Item__c poli :entries)
	       {
	             if(PricebookEntry.UnitPrice <> null && poli.Unit_Price__c == null)
	            {
	
	               //poli.Unit_Price__c = entries.UnitPrice;
	                // s = m.keySet();  
	             }
	
	       }*/
   } 
}