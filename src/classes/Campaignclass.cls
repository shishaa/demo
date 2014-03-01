public class Campaignclass 
{
  
//task2 changes in child commit
   public String campaigns {get; set;}
     
   List<Campaign> cam= new List<Campaign>();
   
   private integer counter=0;
  
    
   public List<SelectOption> getItems() 
    {       List<SelectOption> options = new List<SelectOption>();
            options.add(new SelectOption('Recently Modified','Recently Modified'));
            options.add(new SelectOption('All Campaigns','All Campaigns'));
            options.add(new SelectOption('All Active Campaigns','All Active Campaigns'));
            options.add(new SelectOption('My Active Campaigns','My Active Campaigns'));
            options.add(new SelectOption('Inactive Campaigns','Inactive Campaigns'));
            return options;
    }
 
	    public String getcampaigns()
	        {
	            return campaigns;
	        }
	            
	        public void setCampaigns(String campaigns) 
	        {
	            this.campaigns= campaigns;
	        }

    public Campaignclass(ApexPages.StandardController controller) 
    {

    }
	  public List<Campaign> getcam ()
	     {
	      return cam;
	      }
	       public void setcam(List<Campaign> cam) 
	       {
	            this.cam = cam;
	        }
        
        
		         public PageReference Redirect()
		          {
		      //retruns the id of the current page id// 
		     // Id id = System.currentPageReference().getParameters().get('id');
		       
		       
		        PageReference newPage = New PageReference('/apex/CM_Campaingn_Detail');
		        newPage.getParameters().put(ApexPages.currentPage().getParameters().get('Did'),'parameter');
		         
		        newPage.setRedirect(true);
		        return newPage;
		         //newPage.getParameters().put(ApexPages.currentPage().getParameters().get('parameter',('Did')));
		         }
	    
    
      public PageReference previous() 
      { 
      counter -= 20;
      return null;
      }
 
	   public PageReference next()
	    { 
	      return null;
	    }
  public Void Go()
  { 
        
    Id userId = UserInfo.getUserId();
    //OwnerId=userId and
            system.debug('*******************'+campaigns);
         if(campaigns!=null)
    { 
     if(campaigns=='All Active Campaigns')
      {
     cam=[Select Name,Status,Type,StartDate from Campaign where IsActive=true Order by StartDate Desc];
      }
      if(campaigns=='Recently Modified')
      {
     cam=[Select Name,Status,Type,StartDate from Campaign Order by LastModifiedDate Desc];
      }
       if(campaigns=='All Campaigns')
      {
     cam=[Select Name,Status,Type,StartDate from Campaign Order by StartDate Desc];
      }
        if(campaigns=='Inactive Campaigns')
      {
     cam=[Select Name,Status,Type,StartDate from Campaign where  IsActive=false  Order by StartDate Desc];
      }
        if(campaigns=='My Active Campaigns')
      {
     cam=[Select Name,Status,Type,StartDate from Campaign where IsActive=true Order by StartDate Desc];
      }
    }
  }
}