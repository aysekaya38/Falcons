public class RankHandler {
    //method for creating price using integer rank
    public string rankPrice(integer rank) {
        //declare a variable always with the return type of the method, so it will turn empty string instead of breaking our code, also type return with that variable. Put the rest of the things you want to return inside two
        string price = '';
        if(rank == 1){
            price = 'gold';
        } else if (rank == 2){
            price = 'silver';
        } else if (rank == 3) {
            price = 'bronze';
        } else {
            //inside the last else we have a nested if/else
            if (rank >= 4 && rank <= 10){
                price = 'Top 10 certificate';
            } else {
                price = 'Participation certificate';
            }
        } 
return price;
    }
    //method using switch for creating price using integer rank
    public string rankPrize (integer rank){
        string prize = '';
        switch on rank{
            when 1{
                prize = 'gold';
            } 
            when 2{
                prize = 'silver';
            }
            when 3 {
                prize = 'bronze';
            }
            //we cannot use conditions in switch, the values need to match the data type
            when 4,5,6,7,8,9,10{
                prize = 'Top 10 certificate';
            }
            when else {
                prize = 'Participation certificate';
            }
        }
        return prize;
    }
}