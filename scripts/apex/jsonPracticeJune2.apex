//json is a string with a specific (messaging) format to communicate with other tools/apps
//we will use json.serialize() method to convert a sobject list a json string
//from json to sobject conversion we will use json.deserialize()
// Account a = new Account();
// a.name = 'Mona';
// a.phone = ' ';
// a.AnnualRevenue = 15983000;

// account b = new Account();
// b.name = 'Lisa';
// b.phone = '1234';
// b.site = '';

// List<Account> ab = new list<account>{a,b};
// string accountJson1 = json.serialize(ab);
// System.debug(accountJson1);

//you can convert soql ed objects to json string as well
List<Account> acclst = [select id, name, phone, site, annualrevenue from account limit 5];
string accountJson2 = json.serialize(acclst);
System.debug(accountJson2);

