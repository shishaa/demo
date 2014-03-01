trigger ContactDupecheck on Contact (before insert, before update) {
    
    
    
    //Enter a map declaration to hold records which we will add,
        // this will become a unique map, no duplicate values within it.
        Map<String, Contact> contactMap = new Map<String, Contact>();

        //The next few lines loop across the array of records that are passed into 
        //The goal of this loop is to ensure that there are no duplicates within 
        //the batch that we have received and to gather a list of externalIds that we will use later
                  
                  if(trigger.isBefore)
                  {
                         for (Contact contact : trigger.new) 
                         {
            

            /* Make sure we don't treat an externalId that
               isn't changing during an update as a duplicate. */
            if ((Contact.Email!= null) && (trigger.isInsert ||
                  (contact.Email != trigger.oldMap.get(contact.Id).Email))) {

                // Make sure another new Email isn't also a duplicate
                if( (contactMap.containsKey(contact.Email)))
                {
                    contact.Email.addError('A Contact with the same email address  already exists in system.');
           
                } 
                else {
                    contactMap.put(contact.Email, contact);
                }
            }
        }
        

        // Using a single database query, find all the contacts in
        // the database that have the same Email as ANY
        // of the Email being inserted or updated. */
        for (Contact contact : [SELECT Email FROM Contact WHERE Email IN :contactMap.KeySet()]) {
            Contact newcontact = contactMap.get(contact.Email);
            newcontact.Email.addError('Email already exists.');
        }
            //Enter a map declaration to hold records which we will add,
        // this will become a unique map, no duplicate values within it.
       // Map<String, Contact> contactMap2 = new Map<String, Contact>();

        //The next few lines loop across the array of records that are passed into 
        //the trigger in bulk fashion from any API or User Interface database operation.
        //The goal of this loop is to ensure that there are no duplicates within 
        //the batch that we have received and to gather a list of externalIds that we will use later
        for (Contact contact : trigger.new) {
            

            /* Make sure we don't treat an externalId that
               isn't changing during an update as a duplicate. */
            if ((Contact.Phone!= null) && (trigger.isInsert ||
                  (contact.Phone != trigger.oldMap.get(contact.Id).Phone))) {

                // Make sure another new Email isn't also a duplicate
                if( (contactMap.containsKey(contact.Phone)))
                {
                    contact.Phone.addError('A Contact with the same Phone  already exists in system.');
           
                } 
                else {
                    contactMap.put(contact.Phone, contact);
                }
            }
        }
        

        // Using a single database query, find all the contacts in
        // the database that have the same Email as ANY
        // of the Email being inserted or updated. */
        for (Contact contact : [SELECT Phone FROM Contact WHERE Phone IN :contactMap.KeySet()]) {
            Contact newcontact = contactMap.get(contact.Phone);
            newcontact.Phone.addError('Phone  already exists.');
        }
        
                  }
}