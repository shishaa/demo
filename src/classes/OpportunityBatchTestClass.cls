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
private class OpportunityBatchTestClass {
	
	static testMethod void myUnitTest() 
    {
    	Opportunity op=new Opportunity(StageName='Closed Won',Name='Arvind',CloseDate=Date.parse('1/4/2014'));
    	insert op;
    	
    	List<Opportunity> ListOpp=new List<Opportunity>();
    	
    	ListOpp=[SELECT Id,Name,Amount,StageName,IsAggregated__c FROM Opportunity Where StageName='Closed Won'and Id =:op.Id];
    	
    	for(Opportunity o:ListOpp)
    	{
    	  System.assertEquals(false,o.IsAggregated__c);
    	 
    	}
    }

    static testMethod void myUnitNegativeTest() 
    {
    	Opportunity op1=new Opportunity(StageName='Closed Won',Name='Arvind',CloseDate=Date.parse('1/4/2014'));
    	insert op1;
    	
    	List<Opportunity> ListOpp1=new List<Opportunity>();
    	
    	ListOpp1=[SELECT Id,Name,Amount,StageName,IsAggregated__c FROM Opportunity Where StageName='Closed Won'and Id =:op1.Id];
    	
    	for(Opportunity o1:ListOpp1)
    	{
    	  System.assertNotEquals(true,o1.IsAggregated__c);
    	 
    	}
    }
    
     static testMethod void myBulkTest()
     {
       Opportunity po=new Opportunity();
       
       for(Integer i=0 ;i<50;i++)
       {
          po.Name='Avi'+i;
          po.StageName='Closed Won';
          po.Amount=100;
          po.CloseDate=Date.parse('1/4/2013');
       
       }
       
       insert po;
       
       List<Opportunity> LIOP =new List<Opportunity>();
       LIOP=[SELECT Id,Name,Amount,StageName,IsAggregated__c FROM Opportunity Where Name LIKE 'Avi%'];
       for(Opportunity pol :LIOP)
       {
        System.assertEquals(false, pol.IsAggregated__c);
       }
       
       
     } 
}