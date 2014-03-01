public class OpportunityClass 
	{
	   
	     List<Opportunity> accounts= new List<Opportunity>();
	     
		    public OpportunityClass(ApexPages.StandardController controller)
		     {
		      accounts=[Select AccountId,StageName,Amount,CloseDate from Opportunity where Amount >=10000];
		
		    }
	
		public List<Opportunity> getaccounts ()
		     {
		      return accounts;
		      }
		       public void setaccounts(List<Opportunity> accounts) 
		       {
		            this.accounts= accounts;
		        }
	}