public with sharing class ContactController {
   @AuraEnabled(Cacheable = true) //cachable true is not necessary for impretive calls
   public static list<Contact> searchContact(string searchKey) {//LWC will pass the key based on whatever the user enters

    //search contacts whose name contains the searchKey
    searchKey = '%' +searchKey+ '%';
    return [SELECT FirstName, LastName, Title, Department FROM Contact WHERE FirstName LIKE :searchKey OR LastName LIKE :searchKey WITH SECURITY_ENFORCED LIMIT 5];
   }
}
