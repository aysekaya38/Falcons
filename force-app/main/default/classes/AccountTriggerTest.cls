@istest
public class AccountTriggerTest {
    @istest
    private static void AccountTriggerTest() {
        account acc1 = new account();
        acc1.name = 'SI Test';
        acc1.Industry = 'Energy';
        //in the tested method one requirement is to set an account to active
        acc1.Active__c = 'Yes';

        account acc2 = new account();
        acc2.name = 'UI Test';
        acc2.Industry = 'eNERGY';
        acc2.Active__c = 'No';

        account acc3 = new account();
        acc3.name = 'PI Test';
        acc3.Industry = 'Banking';
        acc3.Active__c = 'No';

        list<account> Acclst = new List<Account> {acc1, acc2, acc3};
        insert Acclst;

        for(account acc: Acclst){
            //acc.Description = 'updated in tests';
            acc.Active__c = 'Yes';
        }
        update Acclst;
        //fetch the records updated from the dummydata
        List<Account> updateAcc = [select id, description from Account];
        System.assertEquals('Account is now active. Enjoy!', updateAcc[1].Description);

        //for the 3 dummy accounts update the vip field
        for(account acc: Acclst){
            acc.VIP__c = true;
        }
        update Acclst;

        List<contact> Contacts =[select id, name, vip__c from contact];
        System.assertEquals(true, Contacts[0].vip__c);
    }
}