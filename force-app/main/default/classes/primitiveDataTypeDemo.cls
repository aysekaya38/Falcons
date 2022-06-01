public class primitiveDataTypeDemo {
    public void printBasicDataType() {
        //method body
        string batchName = 'Falcons'; 
        integer totalCandidates = 40;
        boolean isAdminCompleted = true; 
        Decimal decValue = 27.01;  //decimal value
        Long longValue = 246782956L;  //long vlaue
        Object obj = 'This is a string.';
        Object obj2 =10;
        ID id1 = '0038c00002iK7TZAA0';


//print all of the using system.debug
system.debug('batchname is '+batchName);
system.debug('total # of candidates: '+totalCandidates);
system.debug('adminCompleted: '+true);
system.debug('Decimal: '+decValue); 
system.debug('Long: '+longValue); 
system.debug('obj:' +obj);
system.debug('obj2:' + obj2);
system.debug('id1:' +id1); 


// //using variables
// string batchDescription = batchName + ' are the best.'
// system.debug(batchDescription);
    }
}