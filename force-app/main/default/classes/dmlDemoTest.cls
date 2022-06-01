@istest
public class dmlDemoTest {
    @istest

    private static void dmlDemoTest1() {
        //calling the method from the class which inserts one account so will fetch one account from the testworld
        dmldemo.dmlInsertDemo_stndObj();

        List<Account> lstAcc = [select id, name from account];
        System.assertEquals(1, lstAcc.size());
        System.assertEquals('SoftInnovas', lstAcc[0].name);
    }

    @istest
    static void dmldemoupdatetest(){
        account acc = new account();
        acc.name = 'softinnovas';
        insert acc;
        dmldemo.dmlUpdateDemo_2();
            list<contact> lstCon = [select id, name from contact];
            System.assertEquals('Doe', lstCon[0].name);
    }
}