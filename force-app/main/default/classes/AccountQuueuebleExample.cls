// public class AccountQuueuebleExample implements Queueable{
//     public list<account> listAccount; //class variable
//      //parametirized constructor
//     //we are using constructor to call this class varible in our execute method
//     public AccountQuueuebleExample(List<Account> acclist){
//         listAccount = acclist;
//     }

//    //mandatory method
//    public void execute (QueueableContext context){
//        for(Account acc: listAccount){
//            //update the account name
//            acc.name = acc.name + '--SI';
//        }
//        update listAccount;
//    }
// }

public with sharing class AccountQuueuebleExample implements Queueable{
    public list<account> listAccount;

    public AccountQuueuebleExample(list<account> accList){
        listAccount = accList;
    }

    public void execute(QueueableContext qc){
        for (account a : listAccount) {
            a.Name = a.Name + ' -- SI';
        }
        update listAccount;
    }
}