trigger ContactTrigger on Contact (after delete, after insert, after undelete, 
after update, before delete, before insert, before update) 

{   
    //checking the trigger events
      if(trigger.isBefore)
      {
      // Getting all the Contacts related to the incoming record in a list
       List<Contact> contactList = new List<Contact>(trigger.new);
    
      //declaring new ContactHandler object
      ContactDupecheckHandlerClass handler=new  ContactDupecheckHandlerClass();
    
      if(trigger.isInsert)
       {
         // call to ContactHandler method
        // handler.checkduplicateContact(contactList);
       }
    }

}