public class Car {
    public string carColor = '';
    public string carName = '';
    private Integer maxSpeedKMperHour = 150;
    //1.access modifier
    //2.return (data) type
    //3.methodName followed by()
    public void switchOn(){
        //this is method body
        system.debug('starting the car');
    }

    public void drive(){
        System.debug('driving '+carName);
    }

    public void driveAtMaxSpeed(){
        string drivingDescription = 'driving '+carName + ' at '+ maxSpeedKMperHour + ' km/h';
        System.debug(drivingDescription);
    }
}