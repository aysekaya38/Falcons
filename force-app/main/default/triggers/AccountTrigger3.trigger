trigger AccountTrigger3 on Account (before insert, after insert, before update, after update ) {
//     if(trigger.isAfter){

//         if(trigger.isInsert){
//             for(Account eachOldAcc: trigger.old ){
//                 System.debug('old acc id  = '+ eachOldAcc.id + 'old acc name = '+eacholdacc.name);     
//             }
//             for (Account eachNewAcc: trigger.new) {
//                 System.debug('new acc id  = '+ eachNewAcc.id + 'new acc name = '+eachnewacc.name);
//             }
//         } if (trigger.isUpdate) {
//             for(Account eachOldAcc: trigger.old ){
//                 System.debug('old acc id  = '+ eachOldAcc.id + 'old acc name = '+eacholdacc.name);     
//             }
//             for (Account eachNewAcc: trigger.new) {
//                 System.debug('new acc id  = '+ eachNewAcc.id + 'new acc name = '+eachnewacc.name);
//             } 
//         }
  }





//    if(trigger.isBefore && trigger.isInsert){
//        System.debug('trigger old before insert = '+trigger.old);
//    } if (trigger.isAfter && trigger.isInsert){
//        System.debug('trigger old after insert = ' +trigger.old);
//    } if(trigger.isBefore && trigger.isUpdate){
//        System.debug('trigger old before update = ' + trigger.old);
//    } if(trigger.isAfter && trigger.isUpdate) {
//        System.debug('trigger old after update = ' + trigger.old);
//    }
   
   
   
   
   
   
   
   
   
   
   
   
   
    // System.debug('________start_______');
    // System.debug('trigger.isbefore = '+trigger.isbefore);
    // System.debug('trigger.isAfter = '+trigger.isAfter);
    // System.debug('trigger.isInsert = '+trigger.isInsert);
    // System.debug('trigger.isupdate = '+trigger.isUpdate);
    // if(trigger.isUpdate && trigger.isBefore){
    //     System.debug('before update trigger called');
    // }
    // if(trigger.isUpdate && trigger.isAfter){
    //      System.debug('after update trigger called');
    // }   
    // System.debug('______End_________');