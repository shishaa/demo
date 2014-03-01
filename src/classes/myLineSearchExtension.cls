public  class myLineSearchExtension
{
     public String googleSearch;
     List<Result__c> theResults{get;set;}
     public Search__c src {get;set;} 
     public String check{get;set;} 
     
public String getgoogleSearch() 
{
return googleSearch;
} 
public void setgoogleSearch(String s) 
{
googleSearch = s;
}
 
/*public List<Result__c> getAllResults() 
{
List<Result__c> theResults =
[SELECT Result_Description__c FROM Result__c ];
return(theResults);
}*/
public List<Result__c> gettheResults() 
{
return theResults;
}


public PageReference historySearch() 
{
    
   // String strTest = '*' + googleSearch + '*';
    
 if(googleSearch.contains('()'))
 {
  
  ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Please enter valid data'));
  return null;
 }
 /*else if(googleSearch.isNumeric())
 {
  
  ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,' Enter character string'));
  return null;
 }*/
 else if(googleSearch.equals(''))
 {
  
  ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'you have entered blank value '));
  return null;
 }
 
 
 else
 {  
   //Search__c.Email_Subject__c=check;
    //if(check==googleSearch)
    //{
      List<Search__c> li=new List<Search__c>();
      li=[select Id from Search__c where Search__c.Email_Subject__c=:googleSearch];
      try
      {
      //    ((li[0].Id)!= null)
      theResults =[SELECT Result_Description__c,Title__c,Link__c FROM Result__c where Result__c.Search__c =:li[0].Id ];}
       catch(Exception e)
         {
            system.debug('no record************************');
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Record not available'));
           PageReference redirect = new PageReference('https://www.google.com/search?q='+googleSearch);
            /* List<Search__c> searchInsert = new List<Search__c>();
            List<Search__c> searchInsertList = new List<Search__c>();
            List<Result__c> resultInsert = new List<Result__c>();
            searchInsert.add(new Search__c(Email_Subject__c = googleSearch));
            searchInsertList = [select Id from Search__c where Email_Subject__c = :googleSearch];
            resultInsert.add(new Result__c(Result_Description__c = googleSearch, 
                                           Search__c = searchInsertList[0].Id));
            Insert searchInsert;*/
            
            return redirect.setRedirect(true);
          // return redirect;
           // return null;
        }
      return null;
    //}
    /*else
    { 
     
     src.Email_Subject__c=googleSearch; 
     src.Email_Body__c=googleSearch;
    }*/
 }
}
}