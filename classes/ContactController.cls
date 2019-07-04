public with sharing class ContactController {
@AuraEnabled
    public static List<Contact> getContacts() {
        List<Contact> contacts = 
                [SELECT Id, Name, MailingStreet, Phone, Email, LeadSource FROM Contact where id =:'0030o00002mQCR4AAO'];

        //Add isAccessible() check
        return contacts;
    }
}