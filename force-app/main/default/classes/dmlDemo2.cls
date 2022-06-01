public class dmlDemo2 {
    public static void dmlMultRecUpdate(){
        //fetch all accounts
        List<Account> listAcc = [select name, description from account order by createdDate desc limit 150];

        //create a new list to add all updated accounst fro bulkification
        List<Account> updateAccounts = new List<Account>();

        //for list loop to update every account
        for (account eachAcc: listAcc){
            eachAcc.Name = eachAcc.name + 'via B.0';
            eachAcc.Description = eachAcc.Description + 'Update via bulkification';
            updateAccounts.add(eachAcc);
        }
        if(!updateAccounts.isEmpty()){
            update updateAccounts;
        }
    }
  
}