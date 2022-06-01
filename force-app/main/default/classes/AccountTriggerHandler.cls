// public class AccountTriggerHandler {
//     public static void updateAccountDesciption(list<account> accTriggerNew, list<account> accTriggerOld, map<id, account> accTriggerNewMap, map<id,account> accTriggerOldMap) {
    
//     //WE DO NOT HAVE ACCESS TO THE TRIGGER.NEW INSIDE THE METHOD SO I NEED THE PARAMETER LIST
//     //if we want we can pass trigger.isbefore and trigger.isafter as parameters as well
//     for(account eachAcc: accTriggerNew){
//         Boolean updateDesc = false;
//         //no need for insert, no oldmap meand trigger.isinsert, we use reverse logic
//         if(accTriggerOldMap == null && eachAcc.active__c == 'Yes'){
//             updateDesc = true;
//         }
//         //there is oldmap so this is trigger.update
//         if (accTriggerOldMap != null){
//             if(eachAcc.active__c == 'Yes' && accTriggerOldMap.GET(eachAcc.id).active__c != accTriggerNewMap.get(eachAcc.id).active__c){
//                 updateDesc = true;
//             }
//         }
//     if(updateDesc){
//         eachAcc.Description = 'Account is now active. enjoy!';
//     }
//     }
// // }

// //     public static void updateVipContacts(list<account> accTriggerNew, list<account> accTriggerOld, map<id, account> accNewMap, map<id, account> accOldMap){


// //     //first fetch all Account Ids,specifically Vip is updated (we do not want other accounts in trigger new where other fields are updated), so we create a set of account IDs that we can add all accounts with VIPs updated
// //     set<id> setID = new set<id>();
// //     for(account eachAcc: acctriggernew){
// //         if( eachAcc.vip__c != accOldMap.get(eachAcc.id).vip__c)
// //         setID.add(eachAcc.id);
// //     }
// //     //fetch all the contacts that are related to the accounts whose VIP updated using your IDs set
// //     List<Contact> Conlst = [select id, name, account.id, vip__c from Contact where Account.id in :setID ]; //account.id = :setId 
// //         for(contact eachCon: Conlst){
// //             eachCon.vip__c = accNewMap.get(eachCon.id).vip__c;
// //         }
// //         if(!Conlst.isEmpty()){
// //         update Conlst;
// //         }
//     }

// }


public class AccountTriggerHandler {
    public static void updateAccountDescription(List<account> accTriggerNew,
                                                List<account> accTriggerOld,
                                                Map<id, account> accTriggerNewMap,
                                                Map<id, account> accTriggerOldMap){
        system.debug('inside handler method');
         for(account eachAcc: accTriggerNew){
            boolean updateDesc = false;
            if(accTriggerOldMap == null && eachAcc.Active__c == 'Yes'){
                updateDesc = true;
            }
            if(accTriggerOldMap != null){
                Account oldAccount = accTriggerOldMap.get(eachAcc.ID);
                
                string oldAccountActive = oldAccount.Active__c;
                //check if active is updated
                //active is changed to 'Yes'
                if(eachAcc.Active__c == 'Yes' &&
                    oldAccountActive != 'Yes'
                ) {
                    updateDesc = true;
                }
            }
            if(updateDesc){
                eachAcc.Description = 'Account is now active. Enjoy!';
            }
        }
    }
    public static void updateVipForAllAcontacts(list<account> accTriggerNew, list<account> accTriggerOld, 
                                    Map<id, account> accTriggerNewMap, map<id, account> accTriggerOldMap){
            system.debug('update all contact\'s VIP field');
            set<id> setAccIds = new Set<id>();
            for(account eachAcc: accTriggerNew){
                if(eachAcc.Vip__c != accTriggerOldMap.get(eachAcc.Id).Vip__c){
                    setAccIds.add(eachAcc.Id);
                }
            }

            List<contact> listContacts = [select id, name, account.id, vip__c from contact where account.id in :setAccIds];

            for(contact eachContact : listContacts){
                Account newAccount = accTriggerNewMap.get(eachContact.account.id);
                boolean newAccVip = newAccount.vip__c;

                eachContact.vip__c = newAccVip;
            }
            if(!listContacts.isEmpty()){
                update listContacts;
            }


    }
}