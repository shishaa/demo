public  class OpportunityDiscountHandlerClass extends OpportunityVirtualClass
{
   
      Id profileId = userinfo.getProfileId();  //getting the profile id
      Discount__c c = Discount__c.getInstance(profileId);
      String profileName=[Select Id,Name from Profile where Id=:profileId].Name;
   
     
      Id userId = userinfo.getUserId();//getting the user id
      Discount__c u = Discount__c.getInstance(userId);
      String userName=[Select Id,Name from User where Id=:userId].Name;
    
    
      
    public override void isOnBefore(List<Opportunity> lp)
    {
    	system.debug('*************inside virtual*********');
   
     
     for(Opportunity opp: lp)
       {
         if(u.Name!=Null)
        { 	
           system.debug('*************************'+u.Name);
           system.debug('***************************'+profileName);
           if(profileName=='System Administrator')
         {
           if(userName=='Ashish Waghmare')
           {
           	system.debug('*************************'+u.Discount_Percent__c);
             opp.Discounted_Amount__c=(opp.Amount-(opp.Amount * u.Discount_Percent__c/100 ));
           }
           else
           {
            opp.Discounted_Amount__c=(opp.Amount-(opp.Amount * u.Discount_Percent__c/100 ));
           }
         }
       
      else if(userName=='Ashish Waghmare')
           {
             opp.Discounted_Amount__c=(opp.Amount-(opp.Amount * u.Discount_Percent__c/100 ));
           }
           else
           {
            opp.Discounted_Amount__c=(opp.Amount-(opp.Amount * (0.10) ));
           }
       }
      
    }
}
    
}