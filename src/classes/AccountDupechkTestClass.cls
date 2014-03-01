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
@isTest
private class AccountDupechkTestClass {

   static testMethod void myUnitTest()
    {
        // TO DO: implement unit test
           
      Account acc = new Account();
     acc.Name='Shashank';
      acc.Email_Address__c='Shashank@gmail.com';
     
    
    insert acc;
    
      Account acc1 = new Account();
     acc1.Name='Shashank';
      acc1.Email_Address__c='Shashank@gmail.com';
       acc1.Phone='886677';
      insert acc1;
      
      Account account=[select ParentId from Account where Phone=:'886677'];
      
      system.assertEquals(account.ParentId ,acc.Id);
    
    
    }
    
    Static testMethod void myNegativeTest()
    {
      Account acc = new Account();
      acc.Name='Shashank';
      acc.Email_Address__c='Shashank@gmail.com';
      
      insert acc;
      
      try
      {
      	 Account acc2 = new Account();
     acc2.Name='Shash';
      acc2.Email_Address__c='Shashankyes@gmail.com';
       acc2.Phone='88667';
      insert acc2;
      Account account1=[select ParentId from Account where Phone=:'88667'];
       system.assertEquals(account1.ParentId ,null);
      
      }catch(Exception e)
      {
      system.assert(e.getMessage().contains('Invalid Text'));
      }
     
    }
}