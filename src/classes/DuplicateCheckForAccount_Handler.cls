public with sharing class DuplicateCheckForAccount_Handler
{
    //Constructor
    public DuplicateCheckForAccount_Handler(){}
   
    DuplicateCheckAccount accountObj = new DuplicateCheckAccount();
    public void chkDuplicateAccount(List<Account> accountList){
    	
    	accountObj.chkDuplicateAccount(accountList);
    }  
}