public with sharing class myCustomOpportunityController 
{  
	  private Integer pageSize = 10;
	  public String AccFilterId{get;set;}
      public ApexPages.StandardSetController setCon 
           {
                 get 
                    {
                      if(setCon == null) 
                        {
                          setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                          [SELECT Name, CloseDate FROM Opportunity]));
                          setCon.setPageSize(pageSize);
                        }
                return setCon;
                    }
                set;
           }

       // Initialize setCon and return a list of records
      public List<Opportunity> getOpportunities() 
           {
             return (List<Opportunity>) setCon.getRecords();
           }
           
      public void firstPage()
           {
	         setCon.first();
           }
	 
    //Navigate to last Page
	  public void lastPage()
	      {
	         setCon.last();   
	      }
 
    //Navigate to Next page
	  public void next()
         {
            if(setCon.getHasNext())
	          {
                setCon.next();
	          }
	     }
 
	    //Navigate to Prev Page
	  public void prev()
	     {
	         if(setCon.getHasPrevious())
	           {
	             setCon.previous();
               }
	     }
	  //Navigates to first page
	  public void cancel()
	     {
	         setCon.cancel();   
	     }
	  public void save()
	     {
	         setCon.save();   
	     }
	  public Integer pageNumber 
	     {
             get 
                {
                  return setCon.getPageNumber();
                }
                  set;
         }
	        /*  public void getCompleteResult() 
	      {
	         setCon.getCompleteResult();   
	      }
	      
	        public void getFilterId() 
	      {
	         setCon.getFilterId() ;   
	      }
	        public void getHasNext() 
	      {
	         setCon.getHasNext() ;   
	      }
	        public void getHasPrevious() 
	      {
	         setCon.getHasPrevious() ;
	      }
	      
	        public void getPageNumber() 
	      {
	         setCon.last();   
	      }
	     
	      */
	      
           
      //Get all available list view for Account
	  public SelectOption[] getAccountExistingViews()
           {	       
             return setCon.getListViewOptions();
	       }
	       
	       public PageReference resetFilter()
	       {
	         setCon = null;
	         setCon.setPageNumber(1);
	         return null;
           }
	             
}