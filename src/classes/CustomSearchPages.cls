public with sharing class CustomSearchPages {

    public String getContact() {
        return null;
    }


    public PageReference Search() {
        return null;
    }


    public String SearchText { get; set; }
    public List<Account> Accounts {get;set;}
    public List<Contact> Contacts {get;set;}
    public List<Opportunity> Opportunities {get;set;}
    public List<Lead> Leads {get;set;}
    
    public CustomSearchPages()
    {}
    
    public void SearchPage()
    {
      Accounts = new List<Account>();
      Contacts = new List<Contact>();
      Opportunities = new List<Opportunity>();
      Leads = new List<Lead>();
      List<List<sObject>> SearchList=[FIND : SearchText IN ALL FIELDS RETURNING  Account (Name,First_Name__c,Last_Name__c),
                    Contact(name),Opportunity(name),Lead(name) ];
           
      Accounts = ((List<Account>) SearchList[0]);
      Contacts =  ((List<Contact>) SearchList[1]);
      Opportunities = ((List<Opportunity>) SearchList[2]);
      Leads = ((List<Lead>) SearchList[3]);          
    }
}