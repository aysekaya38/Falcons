@istest
public with sharing class AnimalsHttpCalloutsTest {
    @istest
    private static void testFetchAnimalsSuccess() {
        AnimalsHttpCalloutMock am = new AnimalsHttpCalloutMock();
        Test.setMock(HttpCalloutMock.class, am );

        Test.startTest();
        HttpResponse response = AnimalsCalloutResponse.fetchAnimals2();
        Test.stopTest();

        system.assertEquals(200, response.getStatusCode());
    }
    @istest
    private static void testFetchAnimalsFail(){
        AnimalsHttpMockCalloutFailure afail = new AnimalsHttpMockCalloutFailure ();
        test.setMock(HttpCalloutMock.class, afail);
        test.startTest();
        HttpResponse response = AnimalsCalloutResponse.fetchAnimals2();
       
        test.stopTest();

        System.assertEquals(404, response.getStatusCode());
    }

    
}