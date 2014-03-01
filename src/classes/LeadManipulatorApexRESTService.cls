@RestResource(urlMapping='/Lead/*')
global with sharing class LeadManipulatorApexRESTService 
{
	
	
 @HttpPost
	  global static RT doPost(String FirstName ,String LastName,String Phone,String Email,String Company,String Status)
	  
	  {
	  	RT rt;
			   try
			   {
			  	Lead l =new Lead();
			  	l.FirstName=FirstName;
			  	l.LastName=LastName;
			  	l.Phone=Phone;
			  	l.Email=Email;
			    l.Company=Company;
			    l.Status=Status;
			  	insert l;
			   
			    rt= new RT('Successful',l.id,'true');
			    }
			  catch(exception e)
			  	{
			  	 rt= new RT('false',null,e.getMessage());
			  	}
		  	return rt;
	  }
  
@HttpDelete
 global static RT doDelete()
{
  RT rt;
	  try
	  {
	  	RestRequest Rr =RestContext.request;
	  	RestResponse Rs =RestContext.response;
	  	
	  	   String FirstName = RestContext.request.params.get('FirstName');
	  	   String LastName = RestContext.request.params.get('LastName');
	  	   String Email = RestContext.request.params.get('Email');
	  	   String Phone = RestContext.request.params.get('Phone');
	  	 
	       List<Lead> l =[Select Id,FirstName,LastName,Name,Phone,Email from Lead where FirstName =:FirstName and LastName=:LastName 
	       and Email=:Email and Phone=:Phone];
		      for( Lead kl:l)
		      {
		      	string tname=kl.Name;
		        delete l;
		        rt= new RT('true','','Success',tname);
		      }
	      
	    }
		      catch(exception e)
		  	{
		  	   rt= new RT('false','',e.getMessage(),'');
		  	}
		  	return rt;
 }
     
 
 @HttpPatch
  global static RT doUpdate(String FirstName ,String LastName,String NewPhone,String NewEmail)
  {
  	
  	RT rt;
	  	 try
	   {
	    
	  	   if(FirstName==Null && LastName==Null && NewPhone==null && NewEmail==null)
		    {
		    
		     rt= new RT('false',null,'Insufficient Data');
		    }
		    else
		    {
		    List<Lead> la =[Select Id,FirstName,LastName,Phone,Email from Lead where FirstName=:FirstName and LastName=:LastName];
		   
			    for(Lead l:la)
			    {
			      l.Phone=NewPhone;
			      l.Email=NewEmail;
			    
			      update l;
			       rt= new RT('Successful',l.id,'true');
			    }
		      }
	      }
			    catch(exception e)
			  	{
			  	 rt= new RT('false',null,e.getMessage());
			  	}
			  	return rt;
    }
 
  global with sharing class RT
  {
    global String id;
    global string Status;
    global String isSuccess;
    global String FullName;

   public RT(String isSuccess,String id, string Status)   
    {
      this.id=id;
      this.Status=Status;
      this.isSuccess=isSuccess;
      
    } 
    public RT(String isSuccess,String id, string Status,string FullName)   
    {
      this.id=id;
      this.Status=Status;
      this.isSuccess=isSuccess;
      this.FullName=FullName;
    } 
  } 
  
}