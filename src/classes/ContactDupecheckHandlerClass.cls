public with sharing class ContactDupecheckHandlerClass 

{
  public ContactDupecheckHandlerClass()
	{
	}
  public void checkduplicateContact(List<Contact> contactList)
    {
      Set<string> emailSet = new Set<string>();
          Set<string> phoneSet = new Set<string>();
     
      for(Contact c : contactList)
      {
       
       emailSet.add(c.Email);
       phoneSet.add(c.Phone);
       
      }
     
        // Get list of existing contacts
        List<Contact> duplicateContactList = new List<Contact>([select c1.Id, c1.Email, c1.Phone 
                      from Contact c1
                 where c1.Email IN :emailSet OR
                      c1.Phone IN :phoneSet]);
                      
        Set<string> duplicateEmailIds = new Set<string>();
        Set<string> duplicatePhoneNums = new Set<string>();
      
      //populate list with existing email and phone records
      for(Contact c2 : duplicateContactList)
      {
       duplicateEmailIds.add(c2.Email);
       duplicatePhoneNums.add(c2.Phone);
      }
      
      for(Contact c3 : contactList)
      {
       
       // check duplicate record for email field
       if(duplicateEmailIds.contains(c3.Email))
       {
        c3.Email.addError('A Contact with the same email address already exists in system.');
       }
       
        // check duplicate record for Phone field
       if(duplicatePhoneNums.contains(c3.Phone))
       {
        c3.Phone.addError('A Contact with the same phone number already exists in system.');
        
       }
       
    }  
  }
       
        	
}//class ends