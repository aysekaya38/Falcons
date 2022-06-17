public with sharing class CalculatorCallout {
    //create methods for each operations to access inner class methods

    public static double addition(Double num1, double num2){
        //calling ian inner class method
        calculatorServices.CalculatorImplPort calculator = new  calculatorServices.CalculatorImplPort();
        return calculator.doAdd(num1, num2);
    }

    public static double multiplication(Double num1, double num2){
        //calling ian inner class method
        calculatorServices.CalculatorImplPort calculator = new  calculatorServices.CalculatorImplPort();
        return calculator.doMultiply(num1, num2);
    }

    public static double subtraction(Double num1, double num2){
        //calling ian inner class method
        calculatorServices.CalculatorImplPort calculator = new  calculatorServices.CalculatorImplPort();
        return calculator.doSubtract(0, -1);
    }

    public static double divide(Double num1, double num2){
        //calling ian inner class method
        calculatorServices.CalculatorImplPort calculator = new  calculatorServices.CalculatorImplPort();
        return calculator.doDivide(0, -1);
    }
}
