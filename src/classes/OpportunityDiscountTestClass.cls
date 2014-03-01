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
private class OpportunityDiscountTestClass
 {

    static testMethod void myUnitTest()
     {
       Opportunity op =new Opportunity(StageName='Prospecting',Name='test100',
                                        CloseDate=Date.parse('1/4/2014'),Amount=100);
      insert op;
      
      Opportunity op1= [select Discounted_Amount__c from Opportunity
                      where id=:op.Id];
        
        System.assertEquals(80, op1.Discounted_Amount__c);      
        
        
                                                  
     }
     
     static testMethod void myUnitNegativeTest()
     {
       Opportunity opt =new Opportunity(StageName='Prospecting',Name='test400',
                                        CloseDate=Date.parse('1/4/2014'),Amount=100);
      insert opt;
      
      Opportunity opm= [select Discounted_Amount__c from Opportunity
                      where id=:opt.Id];
                      
                     Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];
                     User u2 = new User(Alias = 'new1User', Email='newuser@testorg.com',
                     EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
                     LocaleSidKey='en_US', ProfileId = p.Id,
                     TimeZoneSidKey='America/Los_Angeles', UserName='new1user@testorg.com');
                      System.runAs(u2) 
                     {
                         // The following code runs as user u2.
                    System.debug('Current User: ' + UserInfo.getUserName());
                    System.debug('Current Profile: ' + UserInfo.getProfileId());
                    
                     System.assertNotEquals(80, opt.Discounted_Amount__c);   
                    }
        
       
     }
     
     static testMethod void myUnitBulkTest()
     {
       Opportunity ops=new Opportunity();	
       for(Integer i=1;i<200;i++)
       {
         ops.Name='test400'+i;
         ops.StageName='Prospecting';
         ops.CloseDate=Date.parse('1/4/2014');
         ops.Amount=100;
       }
        
        insert ops;
        
     List<Opportunity>  ListOp=new List<Opportunity>();
     ListOp=[select Discounted_Amount__c from Opportunity where
                                 Name Like 'test400%']; 
       for(Opportunity op :ListOp)
       {                          
       system.assertEquals(80,op.Discounted_Amount__c );
       }                          
     }
}