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
private class ContactDupeCheckClass 
{
static testMethod void myUnitTest()
     {
       // TO DO: implement unit test
        //Test for single insertion of contact
         Contact testContact = new Contact(LastName='Srivastava',Email='abhishek@gmail.com',Phone='1234567890');
         insert testContact;
         List<Contact> testContact1 = [select Id,LastName,Email,Phone 
              from Contact
         where Email = :testContact.Email OR Phone = :testContact.Phone];
           for(Contact c : testContact1){
   
     //Email Id of new contact is checked with existing contact 
           System.assertEquals('abhishek@gmail.com',c.Email);
  
     //Phone of new contact is checked with existing contact 
     System.assertEquals('1234567890',c.Phone);
  
 
  //For bulk insertion of contact
  
  }
  
    }
    
    
    static testMethod void myNegativeTest()
    {
    	Contact testContact = new Contact();
    	testContact.LastName='Mayank';
    	testContact.Email='mayank@gmail.com';
    	testContact.Phone='3355227788';
    	insert testContact;
    	
    	try
    	{
    	Contact testContact1=new Contact();
    	testContact1.LastName='Ajeet';
    	testContact1.Email='Ajeet@gmail.com';
    	testContact1.Phone='5577221133';
    	insert testContact1;
    	}
    	catch(Exception e)
    	{
    	System.assert(e.getMessage().contains('Insert the data'));
    	
    	}
    }

}