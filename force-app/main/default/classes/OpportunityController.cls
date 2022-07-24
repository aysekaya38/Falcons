public with sharing class OpportunityController {
    
    @AuraEnabled(cacheable = true)
    public static List<Opportunity> getOverMillionOpp(){
        try {
            List<Opportunity> opps = [SELECT Name, Amount, StageName, Type FROM Opportunity WHERE Amount > 1000000 WITH SECURITY_ENFORCED LIMIT 10];
            return opps;

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
