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
private class inLineSearchTestClass 
{

    static testMethod void myUnitTest() 
    {
    
    }
     static testMethod void myNegativeTest() 
    {
         myLineSearchExtension spa=new myLineSearchExtension();
         
         // myLineSearchExtension spas=new myLineSearchExtension();
            List<Search__c> li=new List<Search__c>();
            spa.googleSearch ='';
            li=[select Id from Search__c where Search__c.Email_Subject__c=:spa.googleSearch];
            List<Result__c> rslt=new List<Result__c>();
           
       
    
          
            spa.historySearch();
          System.debug('+++++++++++++++++++++++++++++++++++++'+spa.historySearch());
            System.assertEquals('',spa.googleSearch);
           
            spa.googleSearch ='()';
            System.assertNotEquals('','()');
          
  
        //  PageReference pageRef =new PageReference('https://www.google.com/search?q='+spa.googleSearch);
           // Test.setCurrentPage(pageRef);
           PageReference pageRef = Page.inLineSearch;
           System.Test.setCurrentPage(pageRef);
            String nextPage= spa.historySearch().getUrl();
            system.debug('*************************************'+nextPage);
             //String s=spa.googleSearch;
          
            System.assertEquals('https://www.google.com/search?q='+spa.googleSearch,nextPage);
             //List<ApexPages.Message> msgList = ApexPages.getMessages();
            // or loop over the messages
           /*  for(ApexPages.Message msg :  ApexPages.getMessages())
             {
             System.assertNotEquals('you have entered blank value', msg.getSummary());
             System.assertEquals(ApexPages.Severity.ERROR, msg.getSeverity());
             }
             
                       spa.googleSearch ='123';
                 for(ApexPages.Message msg :  ApexPages.getMessages())
             {
             System.assertNotEquals('Please enter valid data', msg.getSummary());
             System.assertEquals(ApexPages.Severity.ERROR, msg.getSeverity());
             }*/
    }
    static testMethod void myBulkTest() 
    {  
    	/* myLineSearchExtension sps=new myLineSearchExtension();
           List<Search__c> po=new List<Search__c>();
      
       Search__c s=new Search__c();
       for(Integer i=0 ;i<50;i++)
       {
          s.Email_Subject__c='Avi'+i;
          s.Email_Body__c='Avi'+i;
          po.add(s);
       }
       
       insert po;
          Result__c op=new Result__c();
       
       for(Integer j=0 ;j<50;j++)
       {
          op.Result_Description__c='Avi'+j;
         op.Search__c=po[j].Id;
       
       }
        // insert op;
       // List<Result__c> LIOP =new List<Result__c>();
       //LIOP=[select Id from Search__c where Search__c.Email_Subject__c LIKE 'Avi%'];
       sps.googleSearch='Avi';
      // for(Result__c pol :LIOP)
       //{
        System.assertEquals('Avi' ,sps.googleSearch);
      // }*/
           
    }
}