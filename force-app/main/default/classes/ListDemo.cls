public class ListDemo {
    public static string candidatesList(integer i) {
        //create an empty list and add new elements
        List<string>  listCandidates = new List<string>();
        listCandidates.add('Joe');
        listCandidates.add('Jane');
        listCandidates.add('Mark');
        listCandidates.add('Joe');
        System.debug(listCandidates);
        // String index3Value3 = listCandidates.get(3);
        // string index3Value4 = listCandidates[3];
        // System.debug(index3Value3);
        // System.debug(index3Value4);
        // return listCandidates[i];

        //how to return a value at a ceratin index using parameter
        string returnString =''; //define the return var

        if(i > = 0 && i< listCandidates.size()) { //use the .siz method to return a valis index value, greater than or equal to 0 and smaller than the list length
            returnString = listCandidates[i];
        } else {
            returnString = 'No value found';
        }
        return returnString;
    }

    //we can call another class here
    public static void allCats(){
        //if it is cats class, we can create cats list only
        //we are adding objects in method instead of anony apex here
        Cat falconsCat = new Cat ('Space', 'black');
        Cat NursenCat = new Cat ('Eminem', 'gray');

        //we have to add instances of cat class
        List<Cat> cats = new list<cat>();
        cats.add(falconsCat);
        cats.add(NursenCat);
        System.debug('all cats '+cats );
    }

    public static void randomInteger() {
        //create empty integer list, and add new elements
        List<Integer> listIntegers = new List<integer>();   
        listIntegers.add(1);
        listIntegers.add(2);
        listIntegers.add(1);
        listIntegers.add(4);
        System.debug(listIntegers);

        //to retrive the value at a certain index value
        Integer index3Value = listIntegers.get(3);
        integer index3Value2 = listIntegers[3]; //common since shorter
        System.debug(index3Value);
        System.debug(index3Value2);
    }
    //create a list of integers, first empty list then add elements
    public static void iterateIntegerList(){
        list<integer> listInteger = new List<Integer>();
        listInteger.add(2);
        listInteger.add(-2);
        listInteger.add(12);
        listInteger.add(2);

        //using list for loop to print each element of the list
            //list data type variableName insode the loop ListName
        for (integer         eachInteger:                    listInteger){
            System.debug(eachInteger);
        }
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