public class DmlDemo {
    public static void dmlInsertDemo_stndObj() {
        //inserting records to standard ob, create an instance and assign field values for that instance
        Account acc = new Account();

        acc.name = 'SoftInnonavas';
        acc.site = 'www.softinoovas.com';
        
        //like clicking to insert button
        insert acc;
        System.System.debug(acc);
    }

    public static void dmlInsertDemo_cstObj() {
        //inseerting records to custom obj
        salesforce_project__c  sp = new salesforce_project__c();
        sp.project_name__c = 'Teach DML to Falcons';
        sp.Description__c = 'All are great learners';
        insert sp;
        System.debug(sp);
    }

    public static void dmlUpdateDemo_1() {
        //insert
        Account acc = new Account();
        acc.name ='SoftInnonavas';
        insert acc;
        System.debug(acc);

        //update immidiately
        acc.Name = 'salesforce inc.';
        update acc;
        System.debug(acc);
    }

    public static void dmlUpdateDemo_2(){
        account acc = [select id, name from account where name =  'SoftInnonavas' order by createddate desc LIMIT 1]; //even we do not write id, it always fetches it
        acc.Name = 'SoftInnovas Inc';

        update acc;
        System.debug(acc);
    }

    public static void dmlUpdateDemo_3(){
        //retrieve record
        Account acc = [select id, name from account where name like '%SoftInnovas%' limit 1];

        //create contact instance and assign a name
        Contact cnt = new Contact();
        cnt.LastName = 'Doe';

        //set accountid field(relationship field)
        cnt.AccountId = acc.Id;

        insert cnt;
        System.debug(cnt);
    }

    public static void dmlUpdateDemo_4(){
        Salesforce_Project__c sp = [select id, name from Salesforce_Project__c ORDER BY CreatedDate desc limit 1];

        Salesforce_Ticket__c st = new Salesforce_Ticket__c();
        st.Subject__c = 'Learn APEX';
        st.Priority__c = 'High';
        st.Requested_by_date__c = date.newInstance(2022, 04, 29);

        st.Salesforce_Project__c = sp.Id;

        insert st;
        System.debug(st);
    }

    public static void dmlUpdateDemo_5(){
        List<account> listAcc = new list<account>();

        account acc1 = new account();
        acc1.name = 'account 1';
        listAcc.add(acc1);

        account acc2 = new account();
        acc2.name = 'account 2';
        listAcc.add(acc2);

        account acc3 = new account();
        acc3.name = 'account 1';
        listAcc.add(acc3);

        insert listAcc;
        System.debug(listAcc);    
    }

    public static void dmlMultipleReordsInsert_right(){
        List<Account> listAccount = new List<Account>();
        //add one record
        account acc = new Account();
        acc.Name = 'SoftInnovas Batch6';
        acc.Active__c= 'Yes';
        acc.AccountNumber = 'srty0';
        listAccount.add(acc);

        //add 149 more records
        for (integer i=1; i<150; i++){
            account acc1 =new Account();
            acc1.Name = 'SoftInnovas Batch6'+i;
            acc.AccountNumber = 'srty0'+i;
            acc1.Active__c = 'Yes';
            listAccount.add(acc1);
        }

        System.debug(listAccount.size());
        //we do not want to use 1 of our executions (out of 150) if the list is empty
        if (!listAccount.isEmpty()) {
            insert listAccount;
        }
    }
}