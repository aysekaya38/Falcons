public class DateTimeMethods2 {
    public Boolean leapYearCheck(date dt) {
        integer year = dt.year();
        Boolean lp = date.isLeapYear(year);
        return lp;
    }
}