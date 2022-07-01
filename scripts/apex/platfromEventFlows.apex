Custom_Notification__e ev = new Custom_Notification__e();
//create an instance for the platfrom event and create field values
ev.Message__c = 'LEADS HAVE BEEN PROCESSED SUCCESSFULLY';
ev.Initiator__c = 'Leads processing Batch';
//since there is no DML in event bus, you need to publish to trigger the flow
Eventbus.publish(ev);
