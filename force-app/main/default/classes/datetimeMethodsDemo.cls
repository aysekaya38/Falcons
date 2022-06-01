public class datetimeMethodsDemo {
    
    date birthDate = date.newInstance(1756, 3, 2);
    date today = date.today();

 //1. calculate age in months (we need start date: birthday and enddate: today)
    public void calculateAgeInMonths() {
        system.debug('calculate age in months');

    Integer ageInMonths = birthDate.monthsBetween(today);
        System.debug(ageInMonths);
    }
//2.calculate the age in days
    public void calculateAgeInDays(){
        system.debug('calculate the age in days');
        Integer ageInDays = birthDate.daysBetween(today);
        System.debug(ageInDays);
    }

//3. create a subscription end date method
    public void printSubscriptionEndDate(){
        
        date subscriptionStartDate = date.today();

        date subscriptionEndDate = subscriptionStartDate.addDays(1000); 
        //we can use a negative value as well like -500 days
        date subscriptionBackDate = subscriptionStartDate.addDays(-1000);
        system.debug('subscription end date: ' + subscriptionEndDate);
        system.debug('subscription back date: ' + subscriptionBackDate);

        //we can prnt that in year and months
        Integer endDateYear = subscriptionEndDate.year();
        system.debug('subscription end date year is: ' +endDateYear);

        Integer endDateMonth = subscriptionEndDate.month();
        system.debug('subscription end date month is: ' +endDateMonth);

        Integer endDateYear1 = subscriptionBackDate.year();
        system.debug('subscription end date year is: ' +endDateYear1);

        Integer endDateMonth1 = subscriptionBackDate.month();
        system.debug('subscription end date month is: ' +endDateMonth1);
    }
    public void printOfferEndDate(){
        //assuming starts now and valid till 51 hours, print offer and end date

        Datetime dtNow = Datetime.now();

        Datetime dtOfferedEnd = dtNow.addHours(51);
        system.debug('Offer will end on: '+ dtOfferedEnd);

        date offerEndDate = dtOfferedEnd.date();
        system.debug('offer end date is: '+offerEndDate);
    }

}