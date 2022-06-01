public class Cat {
    public String name = '';
    public string color = '';
    //if a method does not have a return type it is constructor,
    //Constructor used for design (like the start function in JS)
    
    public Cat(){
        system.debug('constructor called.');
    }

    public Cat(string n, string c) {
        //this means this class
        this.name = n;
        this.color = c;
        
        //will enable us to call the method as sson as the constructor is called
        sleeping();
    }

    public void sleeping(){
        System.debug(this.name + ' is sleeping');
    }
    //we can have mu;tiple parameters but has to have different data types or different numbers of parameters
}