public class MapDemo {
    public static string retrieveMonth (integer m) {
    string monthName= '';

    map <integer, string> month = new map<integer, string>();
    month.put(1, 'January');
        month.put(2, 'February');
        month.put(3, 'March');
        month.put(4, 'April');
        month.put(5, 'May');
        month.put(6, 'June');
        month.put(7, 'July');
        month.put(8, 'August');
        month.put(9, 'September');
        month.put(10, 'OCtober');
        month.put(11, 'November');
        month.put(12, 'December');

        if(m>12){
            System.debug('Please provide an accurate number month.');
        } else{
            monthName = month.get(m);
        }
    return monthName;
    }
}