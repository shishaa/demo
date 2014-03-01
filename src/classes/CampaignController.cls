public class CampaignController 
	
	{  
		
		
		public String DID  {get; set;}
	    public Campaign campaign ; 
	    public String param=null;
		    public CampaignController(ApexPages.StandardController controller) 
		    {
		      Map<String, String> param = ApexPages.currentPage().getParameters();
		   //param = ApexPages.currentPage().getParameters().get('parameter');
		  
		    for(String value : param.keySet())
		    {
		     DID = value;
		     break;
		     system.debug('****param.keySet***'+DID);
		  }
		    }
		public Campaign getCampaign() 
		{
		system.debug('*******'+DID);
		  campaign = [Select Name, StartDate, EndDate, Description, Status, Type,
		              ParentId, OwnerId, CreatedById , LastModifiedById, NumberSent
		              From Campaign Where Id = :DID];
		  system.debug('*******'+campaign );
		     return campaign;        
		        
		 }
		 
		 public void setCampaign(Campaign campaign){
		  this.campaign = campaign;
		 } 
	 
	}