@RestResource(urlMapping = '/ContactCustom/*') //whatever comes after the star will be refrred to the class, wildcard
global class CustomContactAPI {
    //Url is not standard like in Postman, but customized: instead of sObject as end point  we will use contactCustom, no need for version
    //Functionality: with Postman we fetched all the fields of a contact, via using record id, but with a custom API we can fetch the fields we want
    //inside RestResource class we can use one method only once (out of 5 methods: get, post, patch, post, delete) 
    //we use @httpGet, @httpput annotations
    //methods need to be global and static and no parameter

    @httpGet
    global static Contact getContactId(){
        //we will use id to fetch contact fields
        System.debug('customcontact API call success.');
    //we need to fetch contact id to get the contact details
    //how to get the details of an external request? by creating an instance in RestRequest class, eg: URI, id, endpoint
    //URI is part of URL
    RestRequest request = RestContext.request;
    System.debug('URI: '+request.requestURI);
    //use id to fetch contact details, we will use lastindexOf & substring method to split and get the id (I found the split method easier)
        string uri = request.requestURI;
        integer IdStartIndex = uri.lastIndexOf('/')+1; //index starts with 0
        string contactId = uri.substring(idStartIndex);
        System.debug(contactId);
        contact c = [select name, phone, account.name from contact where id = :contactId];
        return c;    
    }    

    @httpPost
    //post method can take parameters to pass field values for creating a record
    global static id createContact(string fName, string lName, string emailId, string phoneNumber, string accountId){
        //in the post call we can have json or xml in the body. For jSON, key will be our parameter. External site needs to use the same JSON format, matching the parameters.
        Contact con = new Contact();
        con.FirstName = fName;
        con.LastName = lName;
        con.Email = emailId;
        con.Phone = phoneNumber;
        con.AccountId = accountId;
        insert con;
        return con.id;      
    }
}
