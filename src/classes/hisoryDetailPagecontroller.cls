public with sharing class hisoryDetailPagecontroller
{
    List<Result__c> theResults{get;set;}
     public Search__c src {get;set;} 
     
public List<Result__c> gettheResults() 
{
return theResults;
}
public hisoryDetailPagecontroller()
{
 theResults =[SELECT Title__c FROM Result__c];
}
 
/*public PageRefrence searchGoogle()
{
     List<Search__c> li=new List<Search__c>();
 	  li=[select Id from Search__c where Search__c.Email_Subject__c=:googleSearch];
 	  theResults =[SELECT Title_c FROM Result__c where Result__c.Search__c =:li[0].Id ];
      return null;
}*/
}