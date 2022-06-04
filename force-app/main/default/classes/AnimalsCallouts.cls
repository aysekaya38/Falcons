public with sharing class AnimalsCallouts {
    public static void fetchAnimals(){
        //1.prepare request: method and endpoint
        HttpRequest Request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET'); //USE UPPERCASE FOR METHODS

        //2. prepare a http
        Http Http = new Http();

        //3. send request, which returns reponse
        HttpResponse response = Http.send(request);
        System.debug('status = '+response.getStatus());
        System.debug('status code = '+response.getStatusCode());

        //4. process the response
        if(response.getStatusCode() == 200){ //entire response it too big, so we limit it to status code and response
            string animalsJson = response.getBody();
            System.debug(animalsJson);
        } else{
            //no success
            System.debug('something went wrong');
        }
    }
}
