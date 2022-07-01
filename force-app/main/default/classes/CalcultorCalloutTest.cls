@istest
public with sharing class CalcultorCalloutTest {
    @istest 
    private static void doAddTest() {
        //set the mock using the mock class

        test.setMock(Webservicemock.class, new CalculatorCalloutMockAdd());

        //test
        test.startTest();
        double d = CalculatorCallout.addition(-1, 4);
        test.stopTest();
        //assertion
        System.assertEquals(3, d);
    }

    @istest
    static void doSubtractTest(){
         //set the mock using the mock class

         test.setMock(Webservicemock.class, new CalculatorCalloutSubtractionMock());

         //test
         test.startTest();
         double d = CalculatorCallout.subtraction(4,1);
         test.stopTest();
         //assertion
         System.assertEquals(3, d);
        
    }

    @istest
    static void doMultiplyTest(){
         //set the mock using the mock class

         test.setMock(Webservicemock.class, new CalculatorCalloutMockMultiply());

         //test
         test.startTest();
         double d = CalculatorCallout.multiplication(3,1);
         test.stopTest();
         //assertion
         System.assertEquals(3, d);
        
    }

    @istest
    static void doDivideTest(){
         //set the mock using the mock class

         test.setMock(Webservicemock.class, new CalculatorCaloutMockDivide());

         //test
         test.startTest();
         double d = CalculatorCallout.divide(3,1);
         test.stopTest();
         //assertion
         System.assertEquals(3, d);
        
    }
    }