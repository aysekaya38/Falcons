@istest
public with sharing class AccountQueuebleTest {
    @TestSetup
    static void setup(){
        list<account> accounts = new List<Account>();
        //add 100 accounts
        for(integer i = 0; i<100; i++){
            accounts.add(new account(name = 'Test Account' +i)); 
            //account acc = new account();
            //acc.name = 'Test Account'+i;
            //accounts.add(acc);
        }
        insert accounts;    
    }

    static testmethod void AccountQueuebleTest() {
        //fetch accounts freom setup where account name contains Test Account
        List<Account> accounts = [select id, name from account where name like 'Test Account'];
        test.startTest();
        AccountQuueuebleExample aq = new AccountQuueuebleExample(accounts);
        system.enqueueJob(aq);
        test.stopTest();

        //verify 
        //fething account with name containing 'SI'
        integer count = [select count() from account where name like '%SI%'];
        System.assertEquals(0, count);
    }
}