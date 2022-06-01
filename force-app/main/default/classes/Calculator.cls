// public class Calculator {
//     public void welcomeMessag() {
//         system.debug('welcome to apex calc');
//     }

//     //# of parameters is 1, data tyepe parameter is string(we have to provide), return type void, msg is the variable name only used inside the methd
//     public static void printNewMessage (string msg){
//         System.debug(msg);
//     }
//     //we can use multiple parameters with different data types
//         public static void printNewMessage1 (String mes, Date dt){
//             System.debug(mes);
//             system.debug(dt);
//     }
//     //return type is integer(instead of void)
//     public static integer add(integer a, integer b){
//         integer sum = a + b;
//         //to return anything, use 'return' keyword
//         return sum;
//     }
//     public static integer add(Integer a, integer b, integer c){
//         return a+b+c;
//     }
//     public static integer add(string a, string b){
//         return a+b;
//     }
// }

public class Calculator {
    public static void welcomeMessage(){
        system.debug('welcome to apex calC');
    }
    public static void printNewMessage(string msg){
        //use parameter variable name inside the method.
        system.debug(msg);
    }

    public static void printNewMessage2(string msg, Date dt){
        system.debug(msg);
        system.debug(dt);
    }
    //add method with 2 params
    public static integer add(integer a, integer b){
        integer sum = a + b;
        return sum;
    }
    //add method with 3 params
    public static integer add(integer a, integer b, integer c){
        return a+b+c;
    }

    public static Integer add(list<integer> intList){
        //create a var for sum, assign the first sum value
        //will add each element of the list and return the sum
        integer sum = 0;
        for (integer eachInt: intList){
            sum = sum + eachInt;
        }
        return sum;
    }
}