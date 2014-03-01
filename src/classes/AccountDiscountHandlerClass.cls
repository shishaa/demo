public  class AccountDiscountHandlerClass extends AccountDiscountVirtualClass
{
	
   DiscountsToAll__c c= DiscountsToAll__c.getValues('DiscounttoGive');            
	
  public override void isOnBefore(List<Account> LA)
  { system.debug('*******************************inside isonbefore');
    for(Account acc: LA)
    {
    	
      acc.Amount_After_Discount__c=(acc.Amount__c-((acc.Amount__c)*c.AmountTAL__c/100));
    }
  }

}