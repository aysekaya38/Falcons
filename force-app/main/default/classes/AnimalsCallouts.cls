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

            //alternatively
            // object ob = json.deserializeUntyped(animalsJson); //we get the animals as object
            // map<string, object> results = (map<string, object>)ob; //type cast since object is unknown is a map

          map<string, object> results = (map<string, object>)JSON.deserializeUntyped(animalsJson);
            System.debug('results =' +results);

            list<object> animals = (list<object>) results.get('animals'); //convert object to list of objects, meaning type cast an object to list of objects
            system.debug('-----object animals start');
            for (object a: animals){
                system.debug(a);
            }
            System.debug('-----object animals ends');
        } else{
            //no success
            System.debug('something went wrong');
        }
    }
}
