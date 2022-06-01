public class LoopDemo {
    public void print_int_while () {
        //startng point
        integer count = 1;
        //codition for loop to run
        while(count <=25){
            //runs as many times as the condition meets
            System.debug(count);
            //increment
            count++;
        }

    }
//prints the first n integers
    public void print_N_numbers (integer k) {
        for (integer i =1; i < k; i++) {
            system.debug(i);
        }
    }

    //to print all in as a list
    public void print_N_numbers1 (integer k) {
        string s= '';
        for (integer i =0; i < k; i++) {
            //converting integer into string values
            s = s + string.valueOf(i)+',';
        }
        //print the string
        system.debug('print 1 to n '+ s);
    }
    integer sum = 0;
    public integer print_N_sum (integer k){
        for (integer i=0; i<k; i++){
            sum = sum + i;
        }
        system.debug(sum);
        return sum;
    }


    public void print_N_Odd_numbers (integer startI, integer endI){
        for (integer j = startI; j<endI; j++){
            integer mod1 = math.mod(j,2);
            if(mod1 ==1) {
                System.debug(j);
            }
        }
    }
}