//This annotaion makes your Apex class available to Webservices, so external sites can call in methods ('Get, post, etc)
@RestResource(urlMapping = '/ContactCustom/*') //whatever comes after the star will be refrred to the class, wildcard, case sensitive
//The base endpoint for Apex REST is https://yourInstance.my.salesforce.com/services/apexrest/. The URL mapping is appended to the base endpoint to form the endpoint for your REST service like https://yourInstance.my.salesforce.com/services/apexrest/Account/*
global class CustomContactAPI {
    //Url is not standard like in Postman, but customized: instead of sObject as end point  we will use contactCustom, no need for version
    //Functionality: with Postman we fetched all the fields of a contact, via using record id, but with a custom API we can fetch the fields we want
    //inside RestResource class we can use one method, also one annotation, only once (out of 5 methods: get, post, patch, post, delete) 
    //we use @httpGet, @httpput annotations
    //methods need to be global and static and no parameter

    @httpGet
    global static Contact getContactId(){
        //we will use id to fetch contact fields
        System.debug('customcontact API call success.');
    //we need to fetch contact id to get the contact details - NOTE: This can be any field, not have to be ID
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

    @httpDelete
    //no parameters for delete method
    global static string deleteContact(){
        //get the request from external site
        RestRequest request = restContext.request;
        string contactId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        contact con = new contact();
        con.id = contactId;
        delete con;
        return 'Contact deleted using contactid';
    }

    @httpPatch
    //update one or multiple records, can take list<id> as parameter
    global static string updateContact(string emailId, string phoneNumber) {
        //get the request
        restRequest request = RestContext.request;
        //grab the id
        string contactId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Contact con = new contact();
        con.id = contactId;
        con.Email = emailId;
        con.Phone = phoneNumber;
        update con;
        return 'Contact updated.';
    }

    // @httpPut
    // //in the Json body our key will be the parameter we are passing, in this case con, and the vlaue is the whole contact, Sobject - inner keys will be the fields of the contact, 
    // global static string upsertContact(Contact con){
    //     string returnString;
    //     if(con.id == null){
    //         returnString = 'Contact created with Id: ';
    //     } else {
    //         returnString = 'Contact updated with Id: ';
    //     }
    //     upsert con;
    //     return returnString+con.id;
    // }

    @httpPut
    //updates and inserts multiple records and returns a list of Ids, in json body key becomes the contact parameter, value becomes the LIST of whole contact Sobjects with their fields
    global static list<id> upsertContacts(List<Contact> cons){
        upsert cons;
        list<id> ids = new list<id>();
        for(contact con: cons){
            ids.add(con.id);
        }
        return ids;
    }    
    }

