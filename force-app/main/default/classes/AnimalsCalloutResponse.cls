public with sharing class AnimalsCalloutResponse {
    //the class variable has to match with Json key
    public list<string> animals;
    private static string GET_ANIMALS_ENDPOINT = CalloutInfo__mdt.getInstance('GET_ANIMALS').endpoint__c;
    private static string POST_ANIMALS_ENDPOINT = CalloutInfo__mdt.getInstance('POST_ANIMALS').endpoint__c;

    public static HTTPresponse fetchAnimals2(){
         //1.prepare request: method and endpoint
         HttpRequest Request = new HttpRequest();
         request.setEndpoint(GET_ANIMALS_ENDPOINT);
         request.setMethod('GET'); //USE UPPERCASE FOR METHODS
 
         //2. prepare a http
         Http Http = new Http();
 
         //3. send request, which returns reponse
         HttpResponse response = Http.send(request);
         System.debug('status = '+response.getStatus());
         System.debug('status code = '+response.getStatusCode());
 
         //4. process the response
         if(response.getStatusCode() == 200){ //entire response it too big, so we limit it to status code and response
             AnimalsCalloutresponse animalresponse = (AnimalsCalloutresponse)Json.deserialize(response.getBody(), AnimalsCalloutResponse.class) ;
             System.debug('----string animals list starts');
             list<string> allAnimals = animalResponse.animals;
             for(string a: allAnimals){
                 System.debug(a);
             }
             System.debug('----string animals list ends');
 
         } else{
             //no success
             string result= 'failed';
             System.debug('something went wrong');
         }
         return response;
     }
 
     public static HttpResponse postAnimals(){
         HttpRequest request = new HttpRequest();
         request.setEndpoint(POST_ANIMALS_ENDPOINT);
         request.setBody('{"name": "fluffykins"}');
         request.setMethod('POST');
         request.setHeader('Content-Type', 'application/json');

         http http = new http();
         httpresponse response = http.send(request);
         if(response.getStatusCode() == 201){
            System.debug('response'+response.getStatus());

            AnimalsCalloutresponse animalresponse = (AnimalsCalloutresponse)Json.deserialize(response.getBody(), AnimalsCalloutResponse.class) ;
            System.debug('----string animals list starts');
             list<string> allAnimals = animalResponse.animals;
             for(string a: allAnimals){
                 System.debug(a);
             }
             System.debug('----string animals list ends');
         } else{
            //no success
            string result= 'failed';
            System.debug('something went wrong');
        }
        return response;
     }
}