public with sharing class SearchPage 
{
  
    public string SearchText {get;set;}
    public List<Account> Accounts {get;set;}
    public List<Contact> Contacts {get;set;}
    public List<Opportunity> Opportunities {get;set;}
    public List<Lead> Leads {get;set;}
    
   public boolean opp {get;set;}
   public boolean con {get;set;}
   public boolean le {get;set;}
   public boolean ac {get;set;}
    
    public SearchPage()
    {
      opp=false;
      con=false;
      le=false;
      ac=false;
    }
    
    
    public PageReference SearchPages()
    {
        String SearchAll='*'+SearchText+'*';
        Accounts = new List<Account>();
        Contacts = new List<Contact>();
        Opportunities = new List<Opportunity>();
        Leads = new List<Lead>();
        
        
          if(SearchText.contains(' ') || SearchText.isNumeric() || SearchText.length() < 2)
         {
  
           ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,
                   'Please Enter Appropriate Value In Search Input Field.'));
           // ApexPages.getMessages().clear();
          return null;
          }
      
         else
         {
        
     

 
   
   
    
       String serachQuery = 'FIND ' + '\'' +  SearchAll + '\'' + ' IN ALL FIELDS RETURNING Account(Name,Last_Name__c,First_Name__c),Contact(Name),Opportunity(Name),Lead(Name)'; 
       List<List<sObject>> SearchList = search.query(serachQuery);
      //List<List<sObject>> SearchList=
      //[FIND : SearchText  IN ALL FIELDS RETURNING  Account (Name,First_Name__c,Last_Name__c),
      // Contact(name ),
       //Opportunity(name),
      // Lead(name)];
           
      Accounts = ((List<Account>) SearchList[0]);
      Contacts =  ((List<Contact>) SearchList[1]);
      Opportunities = ((List<Opportunity>) SearchList[2]);
      Leads = ((List<Lead>) SearchList[3]);  
      
      
      if(Accounts.size()>0 || Contacts.size()>0 || Opportunities.size()>0 || Leads.size()>0)   
      {
        if(Accounts.size()>0 )
        {
          ac=true;
           
        }
        if(Contacts.size()>0 )
        {
            
        con=true;
     
        }
        if(Opportunities.size()>0 )
        {
            opp=true;
           
        }
        if(Leads.size()>0 )
        {
            le=true;
        }
      }
      else
      {
        Apexpages.addMessage(new Apexpages.Message(Apexpages.Severity.ERROR,' Apppropriate value is a must'));
        return null;
      }
    
      return null;
      }     

    }
    
    }
    
    
    




 // Where Name Like 'SearchText' AND  First_Name__c Like 'SearchText'
      //  AND  Last_Name__c  Like 'SearchText'
        //Where Name Like 'SearchText'
        //Where name LIKE '%'+searchText+ '%'