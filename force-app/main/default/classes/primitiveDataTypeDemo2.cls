//new class with a method to print the new data
public class primitiveDataTypeDemo2 {
    public void printNewDate(){
        system.debug('create new Date instance ');

        //creates two new date instances
        Date newDate = Date.newInstance(2022, 4, 8);
        Date newDate2 = Date.newInstance(1984, 2, 26);

        system.debug('Our new date1 is '+newDate);
        system.debug('Our new date2 is '+newDate2);

        //to get today's date
        Date todayDate = date.today();
        system.debug('Today\'s date is '+ todayDate);
    }
    
    public void printNewTime (){
        system.debug('create a new Time instance');

        //create two new time instances
        Time myTime = Time.newInstance(12, 3, 1, 29);
        Time myTime2 = Time.newInstance(1, 34, 13, 25);

        system.debug('mytime 1 is ' + myTime + ' ,which is later than myTime2 ' +myTime2);
    
        //creates new datetime instances using 
    //today
    date newDate = date.today();

    //new time
    time newTime = time.newInstance(9, 6, 7, 0);
    time tryTime = time.newInstance(12, 13, 14, 15);
    system.debug(tryTime);

    //1. create new datetime from Date and Time
    datetime dt1 = datetime.newInstance(newDate, newTime);
    system.debug('dt 1 is '+ dt1);

    //2. create datetime using Year, Month, Day = time midnight 000000
    datetime dt2 = datetime.newInstance(2022, 4, 9);
    system.debug('dt 2 is '+ dt2);

    //3. create datetime using Year, mONTH, dAY, hour, Minute, Second
    datetime dt3 = datetime.newInstance(2022, 4, 9, 10, 7, 3);
    system.debug('dt 3 is' + dt3);

    //4. current datetime
    datetime currentDT = datetime.now();
    //current users time is considered and it prints IN GMT
        system.debug('current DT: ' + currentDT);

    //6.create newInstance from millisecond (we use this for external systems - APA - TO CONVERT LONGTIME TO A CERTAIN DATE)
    //construct a new datetime using miliseconds since Jan1 1970 00:00:00 GMT

    Datetime dt6 = Datetime.newInstance(0);
    system.debug('dt6 = ' + dt6);

    Datetime dt7 = Datetime.newInstance(5000L);
    system.debug('dt6 = ' + dt7);

     Long longtime = 1341828183000L;
     Datetime dt4 = Datetime.newInstance(longtime);
     system.debug('dt4 = '+ dt4);

     long currentLongTime = currentDT.getTime();
     System.debug('Current long Time: ' + currentLongTime);

    //5.create GMT datetime using year, m, day, hour, minute, second 
    Datetime dt5 = Datetime.newInstanceGmt(1999, 3, 2, 18, 2, 3);
    system.debug(dt5);
    }
}