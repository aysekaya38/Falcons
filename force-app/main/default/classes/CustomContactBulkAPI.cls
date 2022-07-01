@RestResource(urlMapping = '/ContactCustomBulk/*')
    global with sharing class CustomContactBulkAPI {
        @httpPost
    //for external users we should have a return in the method
    global static list<contact> createContacts(list<createContactWrapper> contacts){
        //we need to create a wrapper class for passing the all list of parameters 
        //we are expecting here those 5 values
        list<contact> listContacts = new list<contact>();
        for (createContactWrapper con: contacts){
            contact c = new contact();
            c.FirstName = con.fName;
            c.LastName = con.lName;
            c.Email = con.emailId;
            c.AccountId = con.accountId;
            c.phone = con.phoneNumber;
            listContacts.add(c);
        }
        insert listContacts;
        return listContacts;
    }
}