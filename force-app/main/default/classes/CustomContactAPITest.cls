@istest
private with sharing class CustomContactAPITest {
    @istest
    private static void getContactTest(){
        Account a= new account();
        a.name= 'AccTestName';
        insert a;

        contact c = new contact();
        c.AccountId = a.id;
        c.lastname = 'testcontact';
        insert c;

        RestRequest request = new Restrequest();
        request.requestURI = '/ContactCustom/'+c.id;
        request.httpMethod = 'GET';
        RestContext.request = request;

        Test.startTest();
        contact creturn = CustomContactAPI.getContactId();
        test.stopTest();

        System.assert(creturn != null);
    }

    @isTest
    static void (){
        
    }
}
