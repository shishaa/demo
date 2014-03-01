trigger OpportunityDiscount on Opportunity (after delete, after insert, after undelete, 
after update, before delete, before insert, before update)
{
	OpportunityDiscountHandlerClass handler =new OpportunityDiscountHandlerClass();
  if(trigger.isBefore)
  {
   if(trigger.isInsert)
   {
    //handler.isOnBefore(trigger.new);
   }
  }

}