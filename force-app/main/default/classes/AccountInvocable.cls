

public with sharing class AccountInvocable {
    //for the invocable method annotationlabel is mandatory, desc and category are optional
    //we use ACTION element in the flow to call invocable method
    //IN THE FLOW WE WILL USE THAT LABEL TO SEARCH 

@InvocableMethod(label='Delete Closed Opps'
description='Deletes all the closed opportunities when an account goes inactive or hold'
category='Account')
public static void deleteOpportunities(List<Id> accountIds) {  //one input parameter: although it is one acc, to encourage bulkification make parameter a list (parameter needs to be list)
    List<Opportunity> opps = [SELECT Id FROM Opportunity 
                            WHERE AccountId IN :accountIds
                            AND StageName IN ('Closed Won', 'Closed Lost')];
    if(!opps.isEmpty()) {
        delete opps;
    }
}
}