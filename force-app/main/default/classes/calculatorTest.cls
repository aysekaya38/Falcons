@istest //annotation
public class calculatorTest {
    @istest //write istest for each method & all test methids needs to static but can be private
    public static void testMessage() {

        calculator.welcomeMessage();
        Calculator.printNewMessage('this is from a test method');
    }
@istest
private static void addtest(){
    integer i = 10;
    integer j = 15;
    integer calcAdd = Calculator.add(i, j);
    System.assertEquals(25, calcAdd);
}

@istest
static void addtest2(){
    integer calcAdd = calculator.add(10, 15, 20);
    system.assertEquals(45, calcAdd);
    
}
@istest
static void addtest3(){
    list<integer> Integerlst = new list<integer>{15, 15, 15};
    integer calcAdd = Calculator.add(Integerlst);
    System.assertEquals(45, calcAdd);
}

}