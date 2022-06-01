// public class demoDmlClass {
//     public demoDmlClass() {
//         System.debug('Welcome to the world of SOQL. Please enter the key character to search.');
//     }
    
//     public void dmlInsert(string keychar ){
//         List<Account> lst = [Select name, (select name from contacts) from account];
//         list<contact> cnts = new list<contact>();

//         for (Account acc: lst){
//             for (contact con: acc.contacts){
//                 if (acc.name.contains(keychar)){
//                     con.LastName = acc.name + ' copied from account';
//                     cnts.add(con);
//             }
//         }
//     }
//     insert cnts;
//     System.debug(cnts);
//     }
// }

public class demoDmlClass {
    public void demoDmlClass() {
        System.debug('Welcome to the world of SOQL. Please enter the key character to search. ');
    }

    public void dmlInsert(string keychar) {
        string key = '%'+keychar+'%';
        List<Contact> lstCon = [select id, lastname, Account.name from contact where name like :key];
        List<Contact> newConlst = new List<Contact>();

        for (contact eachCon: lstCon){
            Contact Cnt = new Contact();
            cnt.lastname = eachCon.lastname + ' copied from '+eachCon.Account.name;
            newConlst.add(cnt);
            // System.debug('Input = ' +keychar);
            // System.debug('Output = ' + eachCon.Id + ' '+cnt.name);
            System.debug(cnt.lastname);
        }
        insert newConlst;
    }
}