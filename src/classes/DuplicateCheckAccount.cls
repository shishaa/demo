public with sharing class DuplicateCheckAccount 
{
//Constructor
    public DuplicateCheckAccount(){}

    public void chkDuplicateAccount(List<Account> accountList){
    	
    	//All records
    	List<Account> result = [Select Email_Address__c, Phone, Last_Name__c, ID From Account];
    	
    	//for loop to get email
    	for(Account account : accountList){
    	  for(Account existingAccount : result){	
    		
           if ((account.Email_Address__c == existingAccount.Email_Address__c && account.Phone == existingAccount.Phone) ||
                (account.Email_Address__c == existingAccount.Email_Address__c && account.Last_Name__c == existingAccount.Last_Name__c) ||
                 (account.Phone == existingAccount.Phone && account.Last_Name__c == existingAccount.Last_Name__c) ) {
			
			   account.ParentId = existingAccount.Id; //to make parentof existing 
    	    }
    	    
    	 }//inner for  
       }//outer for
       
    }
}