public with sharing class DummyPostCallout {
    private static string GET_DUMMYPOST_ENDPOINT = CalloutInfo__mdt.getInstance('GET_DUMMYPOST').Endpoint__c;
    private static string HTTP_GET = 'GET';
    private static string HTTP_POST = 'POST';

    public static void postCallout() {
        //1. create request
        HttpRequest request = new HttpRequest();
        request.setEndpoint(GET_DUMMYPOST_ENDPOINT);
        request.setMethod(HTTP_GET);

        //2. prepare http
        http http = new http();

        //3. send request, get response
        HttpResponse response = http.send(request);

        system.debug(response);
        if(response.getStatusCode() == 200){
            system.debug(response.getBody());
            DummyPostResponseWrapper dummywrapper = (DummyPostResponseWrapper)JSON.deserialize(response.getBody(), DummyPostResponseWrapper.class);
            system.debug('dummy wrapper = '+dummywrapper);
            //dummywrapper is the list of DummyPostResponseWrapper & dummywrapper.posts is the list of cls_post

            //create an list of the post object TO insert
            list<post__c> listPosts = new list<post__c>();
            //we can create a list of inner class instance as well by dot, NOT NEEDED HER
            list<DummyPostResponseWrapper.Cls_post> listClsPost = dummywrapper.posts;
            for(DummyPostResponseWrapper.Cls_post dpost: listClsPost){
                post__c p = new post__c();
                p.id__C = dpost.id;
                p.title__c = dpost.title;
                p.body__c= dpost.body;
                listPosts.add(p);
                //we will need wrapper class because we cannot assign __c fields for custom objects
            }
            //insert listPosts;
            upsert listPosts id__C; //as we do upsert we need the external id field

        } else {
            system.debug(response.getStatus());
        }
    }
}

//CALLOUT DATA EXPORT TO AN APEX CLASS AND SF OBJECT

//list<post__c>
//for each loop on list<post> wrapper class
//post__c p = new post__c();
//map all fields of wrapper post to post__c object fields
//add in list<post__c>
//database.insert(list of post)