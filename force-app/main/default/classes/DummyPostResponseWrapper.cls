//1.create a wrapper class
public with sharing class DummyPostResponseWrapper {
//we need a list to store the json data with the fields we need, so we create an inner class that can hold that list
public list<Cls_post> posts; //posts should match the key in the json string
    //2.create an inner class to deserialize and store data in this class
    public class Cls_post{
        public integer id;
        public string title;
        public string body;
        public integer userId;
        public list<string> tags; 
    }
}

//CALLOUT DATA EXPORT TO AN APEX CLASS AND SF OBJECT

//list<post__c>
//for each loop on list<post> wrapper class
//post__c p = new post__c();
//map all fields of wrapper post to post__c object fields
//add in list<post__c>
//database.insert(list of post)