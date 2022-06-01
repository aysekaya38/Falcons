public class SetDemo {
    public static void citySet() {
        set<string> cities = new set<string>{'Tokyo', 'Berlin'};
        cities.add('Izmir');
        cities.add('Hamburg');
        cities.add('Barcelona');
        System.debug(cities);
    }

    public static void randomIntegers(integer i){
        Set<Integer> setIntegers = new Set<Integer>{2,-3,5,6};
        setIntegers.add(i);
        system.debug(setIntegers);
    }

    public static set<integer> setFromList(list<integer> intList){
        Set<Integer> intSet = new set<integer>();
        intSet.addAll(intList);
        return intSet;
    }

    public static set<string> capitalizeSet(set<string> setString){
        Set<String> capsSet = new Set<String>();

        for (string eachString: setString){  
            capsSet.add(eachString.toUpperCase());   
        }
        return capsSet;
    }
}