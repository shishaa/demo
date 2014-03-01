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
private class CampaignLandingPageTestClass 
{
 
    static testMethod void myUnitTest() 
    {   //Campaign dc;
    	Campaign c=new Campaign(Name='Ashish');
    	insert c;
        List<Campaign> ListCam=new List<Campaign>();
        
        ListCam=[Select Name,Status,Type,StartDate from Campaign where IsActive=true and Id=:c.Id  Order by StartDate Desc Limit 1];
       
         for(Campaign d:ListCam)
         
         {
            system.assertEquals('Ashish',d.Name );
         }
        
    }
    
     static testMethod void myUnitnegativeTest() 
    {   //Campaign dc;
    	Campaign c1=new Campaign(Name='Ashish');
    	insert c1;
        List<Campaign> ListCam=new List<Campaign>();
        
        ListCam=[Select Name,Status,Type,StartDate from Campaign where IsActive=true  Order by StartDate Desc Limit 1];
       
         for(Campaign d1:ListCam)
         
         {
            system.assertNotEquals('Ashish',d1.Name );
         }
        
    }
}