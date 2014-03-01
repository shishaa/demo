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
private class LeadCloneTestClass {

    static testMethod void myUnitTest() 
    {
        // TO DO: implement unit test
        Lead lead=new Lead();
        lead.LastName='Jawagal';
        lead.Company='ESPL';
        lead.Status='Open - Not Contacted';
        
        test.startTest();
        insert lead;
        Lead nlead=[select LastName,Status from Lead where LastName ='Jawagal' and 
                                                 Status='Working - Contacted'];
        
        system.assert(nlead!=null);
        test.stopTest();
        
    }
    
   static testMethod void myNegativeTest()
 {
 	Lead lLead = new Lead();
      lLead.LastName = 'Jawagal';
      lLead.Company = 'ESPL';
      lLead.Status = 'Open - Not Contacted';
      insert lLead;
      
     try
     {
      Lead lLead1=new Lead();
      lLead1.LastName = 'Abram';
      lLead1.Company = 'PSPL';
      lLead1.Status = 'Closed - Converted';
      insert lLead1;
     }
     catch(Exception e)
      {
      	System.assert(e.getMessage().contains('Invalid Text'));
      }
      
 	
 }
}