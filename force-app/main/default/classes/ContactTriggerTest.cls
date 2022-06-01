@istest
public class ContactTriggerTest {
    @istest
    private static void testValidation(){
        contact c1 = new contact ();
        c1.Lastname = 'testLastName';
        c1.LeadSource = 'Email';
        insert c1;
        try{
            c1.LeadSource = 'Phone';
        } catch(exception ex){
            system.debug(ex.getMessage());
            system.assert(ex.getMessage().contains('VALIDATION_EXCEPTION'));
        }
    }
}