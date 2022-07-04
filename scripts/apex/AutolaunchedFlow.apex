//calling an autolaunched flow from Apex: Update Account Flow
account acc = [select id, ownerId from account where industry = 'Biotechnology' limit 1];
system.debug(acc.id); //debug to make sure you are getting the right account
//create a map to receive the variables and their values from flow
map<string, object> inputs = new map<string, object>();
inputs.put('AccountId', acc.id);
inputs.put('varAccountOwnerId', acc.OwnerId);
Flow.Interview flow = new Flow.Interview.Update_Account(inputs); 
//create an instance using flow class and use the flow API name
flow.start();

