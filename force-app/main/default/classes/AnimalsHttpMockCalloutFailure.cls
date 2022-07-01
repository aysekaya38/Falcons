public with sharing class AnimalsHttpMockCalloutFailure implements HttpCalloutMock {
    public Httpresponse respond(httprequest request){
        httpresponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setStatusCode(404);
        return response;
    }   
}