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
         myLineSearchExtension sp=new myLineSearchExtension();
         
         /* List<Search__c> se=new List<Search__c>();
          se.add(new Search__c(Email_Subject__c ='Rohit Sharma',Email_Body__c='Rohit Sharma cricketer'));
          //se.add(new Search__c(Email_Subject__c ='Bradley Cooper',Email_Body__c='Bradley Cooper'));
          insert se;  
          //List<Id> ids=new List<Id>();*/
          
            List<Search__c> li=new List<Search__c>();
            sp.googleSearch ='sachin';
            li=[select Id from Search__c where Search__c.Email_Subject__c=:sp.googleSearch];
            List<Result__c> rslt=new List<Result__c>();
           
       
    
        /* rslt.add(new Result__c(Result_Description__c ='Rohit Sharma',Search__c = li[0].Id));
          //rslt.add(new Result__c(Result_Description__c ='Bradley Cooper',Search__c='SN-000011'));
          insert rslt;*/
          
          sp.historySearch();
          
           System.assertEquals('sachin',sp.googleSearch);
    }
     static testMethod void myNegativeTest() 
    {
         myLineSearchExtension spa=new myLineSearchExtension();
         
          
            List<Search__c> li=new List<Search__c>();
            spa.googleSearch ='';
            li=[select Id from Search__c where Search__c.Email_Subject__c=:spa.googleSearch];
            List<Result__c> rslt=new List<Result__c>();
           
       
    
          
            spa.historySearch();
          
            System.assertEquals('',spa.googleSearch);
            spa.googleSearch ='()';
            System.assertNotEquals('','()');
            spa.googleSearch ='123';
            /*PageReference pageRef =new PageReference('https://www.google.com/search?q='+spa.googleSearch);
            Test.setCurrentPage(pageRef);
            String nextPage = spa.save().getUrl();
            System.assertEquals('https://www.google.com/search?q='+spa.googleSearch,nextPage); */
            
            List<ApexPages.Message> msgList = ApexPages.getMessages();
           // or loop over the messages
            for(ApexPages.Message msg :  ApexPages.getMessages())
             {
             System.assertEquals(‘Record not available’, msg.getSummary());
             System.assertEquals(ApexPages.Severity.ERROR, msg.getSeverity());
             }
    }
    static testMethod void myBulkTest() 
    {
      /*   myLineSearchExtension spa=new myLineSearchExtension();
         
          
            List<Search__c> li=new List<Search__c>();
            spa.googleSearch ='';
            li=[select Id from Search__c where Search__c.Email_Subject__c=:spa.googleSearch];
            List<Result__c> rslt=new List<Result__c>();
           
       
    
          
            spa.historySearch();
          
            System.assertEquals('',spa.googleSearch);*/
           
    }
}