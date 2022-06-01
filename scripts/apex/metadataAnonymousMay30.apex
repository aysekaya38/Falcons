map<string, email_domain__mdt> allDomains = email_domain__mdt.getAll();
System.debug(allDomains);
//printing the record for each field
for(string eachDomain: allDomains.keySet()){
    System.debug(eachDomain + '=' +allDomains.get(eachDomain).domain__c);
}
