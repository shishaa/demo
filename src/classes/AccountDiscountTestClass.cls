/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest(SeeAllData=true)
private class AccountDiscountTestClass {

    static testMethod void myUnitTest()
     {
       Account acc=new Account(Name='Shisha',Amount__c=100) ;
       insert acc;
       
       Account acco=[Select Amount_After_Discount__c from Account 
                            where Id=:acc.Id];
              Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];
                     User u2 = new User(Alias = 'new2User', Email='newuser@testorg.com',
                     EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
                     LocaleSidKey='en_US', ProfileId = p.Id,
                     TimeZoneSidKey='America/Los_Angeles', UserName='new2user@testorg.com');
                      System.runAs(u2) 
                     {
                         // The following code runs as user u2.
                    System.debug('Current User: ' + UserInfo.getUserName());
                    System.debug('Current Profile: ' + UserInfo.getProfileId());
                    
                      System.assertEquals(90, acco.Amount_After_Discount__c);   
                    }                
                  
     
      //                      
     }
     
     static testMethod void myUnitNegativeTest()
     {
       Account act=new Account(Name='Shish',Amount__c=100) ;
       insert act;
       
       Account acto=[Select Amount_After_Discount__c from Account 
                            where Id=:act.Id];
           
     
     System.assertNotEquals(70, acto.Amount_After_Discount__c);  
                         
     }
     
     static testMethod void myUnitBulkTest()
     {
     	Account ac =new Account();
     
     	
     	for(Integer i=1;i<200;i++)
     	{
     	   ac.Name='test'+i;
     	   ac.Amount__c=100;
     	}
      insert ac;
         	List<Account> ListAcc=new List<Account>();
         	ListAcc=[select Amount_After_Discount__c from Account where 
         	                  Name Like'test%'];
       for(Account acs :ListAcc)
       {
         System.assertEquals(90,acs.Amount_After_Discount__c);
        
       }  	                  
         	                  
         	                      	
     }
}