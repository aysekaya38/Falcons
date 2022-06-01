public class Candidates {
    public string Name;
    public string Pronouns;
    public static string CompanyName;

    public void printCandidateInfo(){
        system.debug('Candidate Name is '+ Name +'('+ Pronouns + +')');
        //we can use static var in non-static method
        system.debug('Company name is '+CompanyName);
    }
    //create a static method (type static and VSCode )
    private static void name() {
        System.debug('company name is '+CompanyName);
        //we cannot use non-static var inside static method
        //system.debug('name is '+ name) is not valid
    }
}