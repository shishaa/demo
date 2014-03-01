public with sharing class SearchPageController
 {
 
        public SearchPageController(){}
        
      public String searchText{get;set;}
        public List<Lead> leads{get;set;}
        public List<Contact> contacts{get;set;}
        public List<Account> accounts{get;set;}
        public List<Opportunity> opportunities{get;set;}
        Public Boolean showContact{get;set;}
        Public Boolean showOpp{get;set;}
        Public Boolean showLead{get;set;}
        Public Boolean showAccount{get;set;}
  
      
  public PageReference salesforceSearch() 
{
  showContact=false;
  showOpp=false;
  showLead = false;
  showAccount = false;

  String strTest = '*' + searchText + '*';
 
  
    
 
 
 if(searchText.contains(' ') )
 {
  
  ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,' Blanks not allowed'));
  return null;
 }
 else if(searchText.isNumeric())
 {
  
  ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,' Enter character string'));
  return null;
 }
 else if(searchText.length() < 2)
 {
  
  ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,' Enter  string >2 characters'));
  return null;
 }
 

 else
 {

   String serachQuery = 'FIND ' + '\'' +  strTest + '\'' + ' IN ALL FIELDS RETURNING Contact(Name), Lead(Name), Account(Name,First_Name__c,Last_Name__c),Opportunity(Name)'; 
 
       List<List<sObject>> results = search.query(serachQuery);
      
         
       leads = new list<Lead>();
       contacts = new list<Contact>();
       accounts = new list<Account>();
       opportunities = new list<Opportunity>();
    
    
    if(results[0].size()>0 || results[1].size()>0 || results[2].size()>0 || results[3].size()>0)
    {
     
  
      
      contacts=((List<Contact>) results[0]);
      if(contacts.size()>0)
      {
        showContact=true;
       
      }
    
      leads=((List<Lead>) results[1]);
       if(leads.size()>0)
      {
        showLead=true;
      }
      
     
      accounts=((List<Account>) results[2]);
       if(accounts.size()>0)
      {
        showAccount=true;
      }
      
      
      
      opportunities=((List<Opportunity>) results[3]);
      if(opportunities.size()>0)
      {
         showOpp=true;
      }
      
    }
    
    else{
    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,' Enter the right Value '));
 
  return null;
    
    }
       
      return null ;
 
 }
}
 
 
}