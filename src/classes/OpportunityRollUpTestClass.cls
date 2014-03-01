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
private class OpportunityRollUpTestClass
 {
 static testMethod void myUnitTest()
     {
        // TO DO: implement unit test
        
        Opportunity oppoParent=new Opportunity();
        oppoParent.Name='Parent';
        oppoParent.CloseDate=system.today();
        oppoParent.StageName='Qualification';
        oppoParent.Amount=100;
        
        insert oppoParent;
        
        Opportunity oppChild1=new Opportunity();
        oppChild1.Name='Child1';
        oppChild1.CloseDate=system.today();
        oppChild1.StageName='Qualification';
        oppChild1.Amount=200;
        oppChild1.Opportunity_LookUp__c=oppoParent.Id;
        
      
          Opportunity oppChild2=new Opportunity();
        oppChild2.Name='Child1';
        oppChild2.CloseDate=system.today();
        oppChild2.StageName='Qualification';
        oppChild2.Amount=300;
        oppChild2.Opportunity_LookUp__c=oppoParent.Id;
        
        Test.startTest();
        insert oppChild1;
        insert oppChild2;
       Opportunity opp =  [Select Expected_Revenue__c From Opportunity Where Id = :oppoParent.Id];
        system.assertEquals(opp.Expected_Revenue__c,500 );
        Test.stopTest();   
        
    }
    
    static testMethod void myNegativeTest()
    {
    Opportunity oppParent=new Opportunity(Name='Parent', CloseDate= date.valueOf('2013-12-12'),
                                                 StageName='Prospecting', Amount=100);
     insert oppParent;
     
     
     try
     {
     Opportunity child1=new Opportunity(Name='Child1',CloseDate=date.valueOf('2013-11-11'),
     												StageName='Prospecting');
     Opportunity child2=new Opportunity(Name='Child2',CloseDate=date.valueOf('2013-12-15'),
     												StageName='Prospecting');
     insert child1;
     insert child2;
     }
     catch(Exception e)
    {
    system.assert(e.getMessage().contains('Invalid Entry'));
    }
    
    }
}