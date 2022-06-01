trigger AccountTrigger4 on Account (before insert, before update, after insert, after update) {

        // if(trigger.isBefore){
        //     system.debug('before insert/update trigger called');
        //     map<id, account> newAccountMap = trigger.newmap;
        //     map<id, account> oldAccountMap = trigger.oldmap;
        //     for(account eachAcc: trigger.new){
        //         boolean updateDesc = false;
        //         if(trigger.isInsert && eachAcc.Active__c == 'Yes'){
        //             updateDesc = true;
        //         }
        //         if(trigger.isUpdate){
        //             Account oldAccount = oldAccountMap.get(eachAcc.ID);
                    
        //             string oldAccountActive = oldAccount.Active__c;
        //             //check if active is updated
        //             //active is changed to 'Yes'
        //             if(eachAcc.Active__c == 'Yes' &&
        //                 oldAccountActive != 'Yes'
        //             ) {
        //                 updateDesc = true;
        //             }
        //         }
        //         if(updateDesc){
        //             eachAcc.Description = 'Account is now active. Enjoy!';
        //         }
        //     }
        // }













    // for (Account eachAcc: trigger.new){
    //             //first condition
    //             if(trigger.isinsert && eachAcc.active__c == 'Yes'){
    //                 eachAcc.Description = 'Account is now active. Enjoy!';
    //             }
    //             if (trigger.isUpdate){
    //                 if(eachAcc.active__c == 'Yes' && trigger.oldmap.get(eachAcc.id).active__c != trigger.newMap.get(eachAcc.id).active__c){
    //                     eachAcc.Description = 'Account is active. Enjoy!';
    //                 }
    //             }
            // }

        // map<id, account> oldAccs = trigger.oldMap();

        // if(trigger.isBefore){
        //     system.debug('Before insert/update triggers');

        //     for (Account eachAcc: trigger.new){
        //         //first condition
        //         if(trigger.isinsert && eachAcc.active__c == 'Yes'){
        //             eachAcc.Description = 'Account is now active. Enjoy!';
        //         } //second condition
        //         if (trigger.isupdate && (oldAccs.get(eachAcc.id).active__c == 'No' && eachAcc.active__c =='Yes')){
        //             eachAcc.Description = 'Account is now active. Enjoy!';
        //         }
        //     }
        // } 
    }
        // if(trigger.isAfter && trigger.isUpdate){
        
        //     integer count = 0;
        //     for(id eachId: trigger.oldMap.keySet()){ //map <id, acc> = trigger.oldmap
        //         string oldAccWeb = trigger.oldMap.get(eachId).Website;
        //         Account newAcc = trigger.newMap.get(eachId).website;

        //         if(oldAccWeb != newAcc.Website){ //compare old and new account website fields
        //             System.debug('for account ' + newAcc.name + ' new website '+newAcc.website);
        //         }
        //     }
        // System.debug(count);
        // }
    


    
        // if(trigger.isAfter && trigger.isUpdate){
    
        //     map<id, account> newAccMap = trigger.newMap;
        //     map<id, account> oldAccMap = trigger.oldMap;
    
        //     set<id> setOfAccIds = newAccMap.keySet();
        //     integer countWebsiteUpdated = 0;
        //     for(ID eachId : setOfAccIds){
        //         //get old account
        //         account oldAcc = oldAccMap.get(eachId);
        //         string oldWebsite = oldAcc.Website;
        //         //get new account
        //         account newAcc = newAccMap.get(eachId);
        //         string newWebsite = newAcc.Website;
    
        //         if(oldWebsite != newWebsite){
        //             //website is CHANGED
        //             system.debug('For account ' + newAcc.Name + ', new WEBSITE is ' + newWebsite);
        //             countWebsiteUpdated++;
        //         }
    
        //     }
        //     system.debug('# of account website updaetd = ' + countWebsiteUpdated);
        // }
    
    


    // if(trigger.isAfter && trigger.isUpdate){
    //     map<id, account> newAccMap = trigger.newMap;
    //     map<id, account> oldAccMap = trigger.oldMap;

    //     set<id> AccIds = newaccmap.keySet(); // oldaccmap will give the same set
    //     for(id eachId: AccIds){
    //         System.debug('_______');
    //         System.debug('each id = '+eachId);

    //         Account newAcc = new Account();
    //         system.debug('NEW ACCOUNT NAME = ' +newAcc.name);

    //         Account oldAcc = new Account();
    //         System.debug('Old account name = '+oldacc.name); //no change in the name
    //     }
    // }
    // if(trigger.isBefore && trigger.isInsert){
    //     System.debug('BEFORE INSERT');
    //     System.debug('before insert OLD MAP = '+trigger.OldMap);
    //     System.debug('before insert New Map = '+trigger.newMap);
    // }
    // if (trigger.isAfter && trigger.isInsert){
    //     System.debug('AFTER INSERT');
    //     System.debug('before insert OLD MAP = '+trigger.OldMap);
    //     System.debug('before insert New Map = '+trigger.newMap);

    // }
    // if (trigger.isBefore && trigger.isUpdate) {
    //     System.debug('BEFORE UPDATE');
    //     System.debug('before insert OLD MAP = '+trigger.OldMap);
    //     System.debug('before insert New Map = '+trigger.newMap);
    // }

    // if(trigger.isAfter && trigger.isUpdate) {
    //     System.debug('AFTER UPDATE');
    //     System.debug('before insert OLD MAP = '+trigger.OldMap);
    //     System.debug('before insert New Map = '+trigger.newMap);
    // }















//     set<id> AccIds = new Set<Id>();
//     if(trigger.isAfter && trigger.isinsert){
//      for (Account eachAcc: trigger.new){
//         AccIds.add(eachAcc.id);
//     }
// }
// System.debug('Account ids set = ' +AccIds);