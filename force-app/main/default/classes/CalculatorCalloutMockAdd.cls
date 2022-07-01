@istest
public with sharing class CalculatorCalloutMockAdd implements Webservicemock {
//this webservive callout method, invoke, has these many parameters
    public static void doInvoke(Object stub, object request, map<string, object> response, string endpoint, string soapAction, string requestName, string responseNS, string responseName, string responseType){
        //set response
        calculatorServices.doAddResponse response_x = new calculatorServices.doAddResponse();
        response_x.return_x= 3.0; //dummy data
        response.put('response_x', response_x);
    }
}