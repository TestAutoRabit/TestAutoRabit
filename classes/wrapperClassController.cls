public class wrapperClassController {
public List<cContact> contactList {get; set;}
    //This method uses a simple SOQL query to return a List of Contacts

   public List<cContact> getContacts() {

       if(contactList == null) {
            contactList = new List<cContact>();
            for(Contact c: [select Id, Name, Email, Phone from Contact limit 10]) {

               // As each contact is processed we create a new cContact object and add it to the contactList
                contactList.add(new cContact(c));

           }
        }
        return contactList;
   }
 public PageReference processSelected() {
    //We create a new list of Contacts that we be populated only with Contacts if they are selected
   List<Contact> selectedContacts = new List<Contact>();
      for(cContact cCon: getContacts()) {

            if(cCon.selected == true) {
         selectedContacts.add(cCon.con);
            }
        }
        // Now we have our list of selected contacts and can perform any type of logic we want, sending emails, updating a field on the Contact, etc
   System.debug('These are the selected Contacts...');
        for(Contact con: selectedContacts) {
            system.debug(con);

        }

       contactList=null;
        
              return null;
              
}
   public class cContact {

   public Contact con {get; set;}
   public Boolean selected {get; set;}

        public cContact(Contact c) {
            con = c;
            selected = false;
        }
    }
}