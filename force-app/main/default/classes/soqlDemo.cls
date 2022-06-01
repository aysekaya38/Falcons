public with sharing class soqlDemo {
    public static void accountSoql_1() {
        
        list<Account> listAcc = [select id, name from account where name like '%A%'];
        System.debug('account list =  '+ listAcc);
        System.debug('# of accounts =  '+ listAcc.size());

        //CALLING ONLY ONE RECORD SO LIST<ACCOUNT> IS OPTIONAL
        Account latestAcc = [select name, id from account order by CreatedDate desc LIMIT 1 ];
    }

    public static void accountSoql_2(){
        Account acc = [select name, phone, accountnumber from account order by createddate desc limit 1];

        system.debug('latest account created = '+ acc);

        //printing separate fields
        string accName = acc.Name;
        string accPhone = acc.Phone;
        string accNumber = acc.AccountNumber;

        system.debug('accName = '+accName + ' , phone = '+ accPhone + ' , account number = ' + accNumber);
        system.debug(acc.id);
    }

    public static void accountSoql_3() {
        
        List<Account> listAcc = [select id, name, phone, accountnumber from account order by createddate desc];
        system.debug(listAcc);

        //data type is account
        for (account eachAcc: listAcc){
            System.debug('name = '+eachAcc.Name);
            System.debug('phone = '+eachAcc.Phone);
            //id data type is id
            system.debug('id = '+eachAcc.id);
        }
    }

    public static void accountSoql_4() {

        //filter list with a variable, use : before the variable name
        string accNameFilter = 'Salesforce Inc.';
        List<Account> listAcc = [select id, name from account where name = :accNameFilter];
    }

    public static void accountSoql_5(string accNameFilter) {
        
        List<Account> listAcc = [select id, name from account where name =:accNameFilter];
        System.debug(listAcc);
    }

    public static void childToParent_soql1(){
        list<contact> listCnt = [select id, name, account.name from contact where account.industry = 'Energy'];

        for (contact eachContact: listCnt){

            System.debug('contact name is '+eachContact.Name + 'its account is '+eachContact.Account.Name);
        }
        // list<contact> listCnt1 = [select id, name, subject__c, priority__c, salesforce_Project__r.project_name_c, salesforce_pr
        // poject__r.status__c from salesforce_ticket__c];
    }

    public static void sampleSoql4() {
        List<Account> accountWithOppList = [select name, AnnualRevenue, (SELECT name, amount  FROM opportunities WHERE stageName = 'Closed Won') from Account where type = 'Customer - Direct'];

        for (account eachAccount: accountWithOppList){
           System.debug('account name '+eachAccount.Name + ' and its annoual revenue '+eachAccount.AnnualRevenue);
           //we can not fetch an opportunity without fetching an account
            //inside the account list we will get a list of opportunities
           for (Opportunity eachopp: eachAccount.Opportunities){

            system.debug('opportunity name '+ eachopp.Name);
            System.debug('opportunity amount '+ eachopp.Amount);
           }   
    }
}
//April 28 assignment slides day 10
    public static void soqlDemo5(){
        List<Salesforce_Project__c> lst = [select name, project_name__c, (SELECT name, subject__c, priority__c  FROM  Salesforce_Tickets__r ) from Salesforce_Project__c ];

        integer count1 = 0;
        for (Salesforce_Project__c pr: lst){
            list<Salesforce_Ticket__c> lst1 = pr.Salesforce_Tickets__r;
            string spname = pr.name;
            integer st = lst1.size();
            integer count2 = 0;
         for (Salesforce_Ticket__c tc: lst1){
            if (tc.priority__c == 'High'){
                count1 ++;
                count2 ++;
            }    
        }
        System.debug(spname + ' : '+ st + ' : '+ count2);
    }
    System.debug(count1);
}
}