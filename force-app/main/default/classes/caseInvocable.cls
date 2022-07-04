public class caseInvocable {

    @InvocableMethod (label='Send Email & Save Activity'
    description = 'Sends an email and saves as an activity'
    category = 'Case')
    public static void sendEmail(list<FlowInput> inputs){ //stores both casenumber and contactid 
    list<messaging.SingleEmailMessage> msgs = new list<messaging.SingleEmailMessage>();
    FlowInput input = inputs[0]; //get the firse lement from the list
    Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
    msg.setTargetObjectId(input.contactId);
    msg.setSubject('Case created' +input.caseNumber);
    msg.setSaveAsActivity(true); //to save the email as an activity under record
    msg.setPlainTextBody('Hello there, \n A case has been created for you to answer your query. '
                            + 'One of our customer representative is going to reachout to you. Stay tuned!'
                            + '\n Thank you!');
     Msgs.add(msg);  //send email only sends list of emails not single email, so create an empty list and add 
     //for handling errors
     messaging.SendEmailResult[] results = Messaging.sendEmail(msgs); //messaging.SendEmailResult stores the values of mesaaging.sendEmail method. messaging.SendEmailResult has two methods: isSuccess() & getErrors()
     for(messaging.SendEmailResult result: results)
     if(result.isSuccess()){
         //create 
         System.debug('Successsfully sent');
     } else {
         //create an error log
         System.debug(result.getErrors());

     }          
    }
      //create a wrapper class inside the flow class to store the contact id and casenumber as one parameter
      public class FlowInput{
        //to make your flow open two boxes to fill as variables. the flow does not know your 'input' var in the Apex includes both caseNumber and conTACTid
        @invocableVariable(label = 'Case Number' description = 'To get Case Number' required = true)
        public string caseNumber;
        @invocableVariable(label='Contact Id' description ='To get Contact Id' required = true)
        public id contactId;
    }   
}

    //we can only send one parameter from flow to invocable method, so if we want to store data in organized manner we use SObject, but if I want to store temprary data to make programming easy we can use wrapper class

    //we can have a meaningful data to use temporaryly in a code EG: acc name, list<contactname> & list <opp name> 
    // public class DataClass{
       // public string accname;
        //public list<string> connames
       // public list<String> oppname
    
  
