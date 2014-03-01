public  class DupeCheckContactHandlerClass extends ContactVirtualClass
{
	 
	 
	  Set<string> ListExistCons =new Set<String>();
	 // ListExistCons = [select Email,Phone from Contact];
	  Set<String> ListCons =new Set<String>();
	  List<Contact> lcp =new List<Contact>();
	  
   public override void isOnBeforeInsert(List<Contact> lc)
    {
   
    
      for(Contact C :lc)
      {
        ListExistCons.add(C.Email);
        ListExistCons.add(C.Phone);
      }
    
      
      
      for(Contact c:lc)
      {
      	if(ListExistCons.contains(c.Email))
      	{
        c.Email.addError('Email Already Exists');
      	}
      	if(ListExistCons.contains(c.Phone))
      	{
        c.Phone.addError('phone Already Exists');
      	}
      }
      
      for(Contact cl:[Select c.Phone, c.Email From Contact c where c.Id Not IN : lc])
      {
        lcp.add(cl);
      }
      
   }

}