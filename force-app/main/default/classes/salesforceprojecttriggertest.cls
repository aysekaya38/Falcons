@istest
public with sharing class salesforceprojecttriggertest {

    @istest
    private static void testMethod1() {
        Salesforce_Project__c sp1 = new Salesforce_Project__c();
        sp1.project_name__c = 'Tech async to Falcons1';
        sp1.Description__c = 'All Falcons are great learners';

        Salesforce_Project__c sp2 = new Salesforce_Project__c();
        sp2.project_name__c = 'Tech future to Falcons1';
        sp2.Description__c = 'All Falcons are great learners';

        list<Salesforce_Project__c> lstSP = new List<Salesforce_Project__c>{sp1, sp2};
        set<id> spIds = new set<id>{sp1.id, sp2.id};

        test.startTest();
        salesforceprojecttriggerhandler.updateProjectdescription(spIds);
        test.stopTest();

        List<Salesforce_Project__c> sps = [select id, description__c from Salesforce_Project__c];
        System.assert(sps[0].Description__c.contains('Future')); //the string is too long to use assertEquals
    }



}