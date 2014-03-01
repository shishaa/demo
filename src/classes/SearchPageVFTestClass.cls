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
private class SearchPageVFTestClass {

    static testMethod void myUnitTest() 
    {
          
        
          List<Contact> ListCon=new List<Contact>();
          List<Opportunity> ListOpp=new List<Opportunity>();
          List<Lead> ListL=new List<Lead>();
          List<Account> ListAcc=new List<Account>();
        
          ListCon.add(new Contact(Phone='99',LastName='Shisha',Email='ashish@w.com'));
          ListCon.add(new Contact(Phone='990',LastName='Shish',Email='ashi@w.com'));
          insert ListCon;
         
          ListOpp.add(new Opportunity(StageName='Prospecting',Name='Ashish',CloseDate=Date.parse('5/1/2014')));
          ListOpp.add(new Opportunity(StageName='Prospecting',Name='hish',CloseDate=Date.parse('6/1/2014')));
          insert ListOpp;
         
          ListL.add(new Lead(Status='Open Not Contacted',LastName='Waugh',Company='ESPL'));
          ListL.add(new Lead(Status='Open Not Contacted',LastName='Waug',Company='ESPL'));
          insert ListL;
         
          ListAcc.add(new Account(Phone='111',Name='dinesh',Last_Name__c='Ashwin',First_Name__c='Dinu', Email_Address__c='asw@w.com'));
          ListAcc.add(new Account(Phone='11',Name='dine',Last_Name__c='Ashw',First_Name__c='Din', Email_Address__c='as@w.com'));
          insert ListAcc;                  
         
       
          SearchPage sp=new SearchPage();
          sp.SearchText ='Ashish';
          sp.SearchPages();
          sp.opp=true; 
          sp.con=true ;
          sp.le=true ;
          sp.ac=true;
         
         
          System.assertEquals('Ashish',sp.SearchText);
          System.assertEquals(true,sp.opp);
          System.assertEquals(true,sp.con);
          System.assertEquals(true,sp.le);
          System.assertEquals(true,sp.ac);
                           
    }
}