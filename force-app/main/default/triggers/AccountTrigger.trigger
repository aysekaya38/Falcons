trigger AccountTrigger on Account (before insert, before update, after insert, after update) {
        if(trigger.isBefore){
            system.debug('before insert/update trigger called');
            AccountTriggerHandler.updateAccountDescription(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
            system.debug('before insert/update trigger end.');
            
        }
        if(trigger.isAfter && trigger.isUpdate){
            AccountTriggerHandler.updateVipForAllAcontacts(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
        }
    }
    // if(trigger.isAfter){
    //     System.debug('after update trigger called');
    //     AccountTriggerHandler.updateVipContacts(trigger.new, trigger.old, trigger.newmap, trigger.OldMap);
    //     }
    // if(trigger.isBefore){
    // System.debug('before insert/update trigger called');
    // AccountTriggerHandler.updateAccountDesciption(trigger.new, trigger.old, trigger.newmap, trigger.OldMap);
    // }

        // if(trigger.isAfter && trigger.isUpdate){
        
        //     integer count = 0;
        //     for(id eachId: trigger.oldMap.keySet()){ //map <id, acc> = trigger.oldmap
        //         string oldAccWeb = trigger.oldMap.get(eachId).Website;
        //         Account newAcc = trigger.newMap.get(eachId);

        //         if(oldAccWeb != newAcc.Website){ //compare old and new account website fields
        //             System.debug('for account ' + newAcc.name + ' new website '+newAcc.website);
        //         }
        //     }
        // System.debug(count);
        // }
    






    // if(trigger.isBefore && trigger.isUpdate){
    //     system.debug('trigger.new before update = ' + trigger.new);
    //     list<account> newAccounts = trigger.new;
    //     for (account acc :  newAccounts) {
    //         system.debug('accout id is = ' + acc.Id + ', account name is ' + acc.Name + ', acc modified date = ' + acc.LastModifiedDate);
    //     }
    // }
    // if (trigger.isAfter && trigger.isUpdate) {
    //     //trigger.new -> record(s) which were responsible for firing the trigger
    //     system.debug('trigger.new after update = ' + trigger.new);
    //     for (account acc :  trigger.new) {
    //         system.debug('accout id is = ' + acc.Id + ', account name is ' + acc.Name + ', acc modified date = ' + acc.LastModifiedDate);
    //     }
    // }

    // if(trigger.isBefore && trigger.isInsert){
    //     system.debug('trigger.new before insert = ' + trigger.new);
    // }
    // if (trigger.isInsert && trigger.isAfter) {
    //     //trigger.new -> record(s) which were responsible for firing the trigger
    //     system.debug('trigger.new after insert = ' + trigger.new);
    // }







    

    /*
    if (trigger.isInsert && trigger.isAfter) {
        //trigger.new -> record(s) which were responsible for firing the trigger
        system.debug('trigger.new after insert = ' + trigger.new);

        list<account> newAccounts = trigger.new;

        system.debug('total account inserted = ' + newaccounts.size());
        for (account acc : newAccounts) {
            system.debug('accout id is = ' + acc.Id + ', account name is ' + acc.Name);
        }
    }*/


    /*
    system.debug('---------START------------');
    system.debug('trigger.isBefore = ' + trigger.isBefore);
    system.debug('trigger.isAfter = ' + trigger.isAfter);
    system.debug('trigger.isInsert = ' + trigger.isInsert);
    system.debug('trigger.isUpdate = ' + trigger.isUpdate);
    if (Trigger.isInsert && Trigger.isBefore) {
        system.debug('before insert trigger fired');
    }
    if (Trigger.isInsert && Trigger.isAfter) {
        system.debug('after insert trigger fired');
    }
    if (Trigger.isUpdate && Trigger.isBefore) {
        system.debug('before update trigger fired');
    }
    if (Trigger.isUpdate && Trigger.isAfter) {
        system.debug('after update trigger fired');
    }
    system.debug('---------END------------');
    */