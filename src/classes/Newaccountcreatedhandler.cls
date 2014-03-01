public with sharing class Newaccountcreatedhandler 
{
	
	
	 //constructor
	 
	 public void Newaccountcreatedhandler(){}
	 
	 //instance creation 
	 Newaccountcreatedhandler newaccr= new Newaccountcreatedhandler();
	 
	 public void onafterinsert (List<Account> pNewAccountList)
	 
	 {
	   newaccr.onafterinsert(pNewAccountList);
	 }
	 
	

}