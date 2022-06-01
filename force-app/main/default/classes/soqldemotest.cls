@istest
public class soqldemotest {
    @TestSetup //we created the dummy data in onetestset up method for all the methods in the class
    static void setupData(){
        account acc1 = new account();
        acc1.name = 'SI Test';
        acc1.Industry = 'Energy';

        account acc2 = new account();
        acc2.name = 'UI Test';
        acc2.Industry = 'eNERGY';

        account acc3 = new account();
        acc3.name = 'PI Test';
        acc3.Industry = 'Banking';

        list<account> Acclst = new List<Account> {acc1, acc2, acc3};
        insert Acclst;

        list<contact> Conlst = new list<contact>();

        for(integer i= 0; i<300; i++){
            Contact cnt = new contact();
            cnt.LastName = 'Test SOQL';
            if(i<100){
                cnt.AccountId = acc1.id;
            } else if (i<200){
                cnt.AccountId = acc2.id;
            } else if (i<300){
                cnt.AccountId = acc3.id;
            }
               insert Conlst; 
            }  
    }

    static void testMethod1(){
         //we reset the governer limits as we call the method
            test.starttest();
            soqlDemo.childToParent_soql1();
            test.stopTest();
            }
        
    
        @istest
        static void samplesoql4test(){
            //fetch 3 accounts from the testsetup method where type is updated
            List<Account> Acclst = [select id, name, type from account];
            for(account acc: Acclst){
                acc.Type = 'Customer -Direct';
            }  
        update Acclst;

        //create oppportunites for accounts
        List<Opportunity> createOpps = new List<Opportunity>();
        for (integer i = 0; i<300; i++){
            Opportunity op = new Opportunity();
            op.name = 'opp1';
            op.StageName = 'Closed Lost';
            op.CloseDate = date.today();
            if(i<100){
                op.AccountId = Acclst[0].id;
            } else if (i<200){
                op.AccountId = Acclst[1].id;
            } else if(i<300){
                op.AccountId = Acclst[2].id;
            }
        }
        insert createOpps;

        test.startTest();
        soqlDemo.sampleSoql4();
        test.stopTest();
    }

    }