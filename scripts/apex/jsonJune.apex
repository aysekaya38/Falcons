string jsonAccountString = '{"name": "JsonToApex1", "type": "prospect1", "annualrevenue": 53}';
object ob = json.deserialize(jsonAccountString, account.class); //jsonAccountString json string, account.class is the Sobjects class
account acc = (account)ob; //(account) is type cast, meaning the apex object
insert acc;

//

//inserting a list of accounts converted from Json
string jsonAccountString = '[{"name": "JsonToApex1", "type": "prospect1", "annualrevenue": 55}, {"name": "JsonToApex2", "type": "prospect2", "annualrevenue": 52}]';
object ob = json.deserialize(jsonAccountString, list<account>.class);
list<account> acc = (list<account>)ob;
insert acc;


