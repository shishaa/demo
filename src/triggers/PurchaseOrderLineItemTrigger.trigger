trigger PurchaseOrderLineItemTrigger on Purchase_Order_Line_Item__c (before insert) 
{
	
	HandlerClassPurchaseOrderLineItem Handler=new HandlerClassPurchaseOrderLineItem();
	
	if(trigger.isBefore)
	{
	  if(trigger.isInsert)
	  {
	    Handler.isOnBeforeInsert(trigger.new);
	  }
	
	}
 
}