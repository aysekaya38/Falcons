//cretae a new StringDemoClass
public class StringDemoClass {
    //create a method
    public void stringMethod1() {
        //method variable
        string sessionDescription ='learning string\'s methods in apex language';

        //1.length req.
        integer lengthOfStr = sessionDescription.length();
        system.debug('the length of the string is = ' + lengthOfStr);

        //2. uppercase req.
        string sessionDescriptionInCaps = sessionDescription.toUpperCase();
        system.debug('in caps = ' +sessionDescriptionInCaps);

        //3a. contains apex req.
       Boolean containsApex = sessionDescription.contains('apex');
       system.debug('has apex? '+containsApex);

       //3b. containsIgnoreCase 'APEX'
       Boolean containsUpperAPEX = sessionDescription.containsIgnoreCase('APEX');
       system.debug('has APEX? '+ containsUpperAPEX);

       //4. check salesforce
       Boolean containsSalesforce = sessionDescription.contains('Salesforce');
       system.debug('has Salesforce? ' + containsSalesforce);

       //5. check Apex
       Boolean containsCapitalApex = sessionDescription.contains('Apex');
       system.debug('has Apex? ' + containsCapitalApex);

       //note: not assigning is allowed but we cannot do operations on it or print it
       sessionDescription.length();

       //6. check if strings are equal
       Boolean result = sessionDescription.equals('learning string\'s methods in apex language');
       system.debug(result);

       //7. checks if strings are equal but ignores upper/lower cases
       Boolean result2 = sessionDescription.equals('learning string\'s methods in APEX language');
       system.debug(result2);

    }
}