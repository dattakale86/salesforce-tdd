@isTest
class CoffeeMachineTest {

    @isTest
    static void brewCoffe_AmountOutOfRange_ShouldThrowException() {
        //prepare
        ICoffeeMachine cm = new CoffeeMachine();
        Boolean exceptionThrown = false;
        //test
        try{
            cm.brewCoffee(300, 1);
        }
        catch(OutOfRangeException e){
            exceptionThrown = true;
        }
        //assert
        System.assertEquals(true, exceptionThrown);
    }
    @isTest
    static void brewCoffe_StrengthOutOfRange_ShouldThrowException() {
        //prepare
        ICoffeeMachine cm = new CoffeeMachine();
        Boolean exceptionThrown = false;
        //test
        try{
            cm.brewCoffee(200, 8);
        }
        catch(OutOfRangeException e){
            exceptionThrown = true;
        }
        //assert
        System.assertEquals(true, exceptionThrown);
    }
    @isTest
    static void brewCoffe_AmountStrengthInRange_ShouldReturnCoffee() {
        //prepare
        ICoffeeMachine cm = new CoffeeMachine();
        //test
        Drink coffee = cm.brewCoffee(150, 2);
        //assert
        System.assertEquals(150, coffee.amount);
    }
    @isTest
    static void brewCoffee_NoWater_ShouldThrowException() {
        //prepare
        ICoffeeMachine cm = new CoffeeMachine();
        Boolean exceptionThrown = false;
        //test
        try{
            cm.brewCoffee(200, 3);
            cm.brewCoffee(200, 3);
            cm.brewCoffee(200, 3);
            cm.brewCoffee(200, 3);
            cm.brewCoffee(200, 3);
            cm.rinseMachine();
            cm.brewCoffee(200, 3);
        }
        catch(NoWaterException e){
            exceptionThrown = true;
        }
        //assert
        System.assertEquals(true, exceptionThrown);
    }
    @isTest
    static void brewCoffee_NotRinsedAfterFiveServes_ShouldThrowException() {
        //prepare
        ICoffeeMachine cm = new CoffeeMachine();
        Boolean exceptionThrown = false;
        //test
        try{
            cm.brewCoffee(50, 3);
            cm.brewCoffee(50, 3);
            cm.brewCoffee(50, 3);
            cm.brewCoffee(200, 3);
            cm.brewCoffee(200, 3);
            cm.brewCoffee(200, 3);
        }
        catch(CoffeeMachineNotRinsedException e){
            exceptionThrown = true;
        }
        //assert
        System.assertEquals(true, exceptionThrown);
    }
    @isTest
    static void addWater_AboveCapacity_ShouldThrowException() {
        //prepare
        ICoffeeMachine cm = new CoffeeMachine();
        Boolean exceptionThrown = false;
        //test
        try{
            //in ML
            cm.addWater(1200);
        }
        catch(OutOfCapacityException e){
            exceptionThrown = true;
        }
        //assert
        System.assertEquals(true, exceptionThrown);
    }
    @isTest
    static void addWater_WithinCapacity_CapacityIncreased() {
        //prepare
        ICoffeeMachine cm = new CoffeeMachine();
        //consume some water
        cm.boilWater(250);
        //test
        //in ML
        Integer capacity = cm.getWaterLevel();
        cm.addWater(200);
        //assert
        System.assertEquals(cm.getWaterLevel(), capacity + 200);
    }
    @isTest
    static void rinseMachine_LastRinseWithinTwoServes_ShouldNotRinseMachine() {
        //asert if count of coffees served after last rinse should not get reset
        //prepare
        ICoffeeMachine cm = new CoffeeMachine();
        //test
        //in ML
        cm.brewCoffee(200, 1);
        Integer drinksServed = cm.getDrinksServed();
        cm.rinseMachine();
        //assert
        System.assertEquals(drinksServed, cm.getDrinksServed());
    }
    @isTest
    static void rinseMachine_LastRinseMoreThanTwoServes_ShouldRinseMachine() {
        //asert if count of coffees served after last rinse gets reset
        //prepare
        ICoffeeMachine cm = new CoffeeMachine();
        //test
        //in ML
        cm.brewCoffee(200, 1);
        cm.brewCoffee(200, 1);
        cm.brewCoffee(200, 1);
        Integer drinksServed = cm.getDrinksServed();
        cm.rinseMachine();
        //assert
        System.assertEquals(0, cm.getDrinksServed());
    }
    @isTest
    static void boilWater_NotInRange_ShouldThrowException() {
        //prepare
        ICoffeeMachine cm = new CoffeeMachine();
        //test
        Boolean exceptionThrown = false;
        //test
        try{
            //in ML
            cm.boilWater(300);
        }
        catch(OutOfRangeException e){
            exceptionThrown = true;
        }
        //assert
        System.assertEquals(true, exceptionThrown);
    }
    @isTest
    static void boilWater_InRange_ShouldReturnHotWater() {
        //prepare
        ICoffeeMachine cm = new CoffeeMachine();
        //test
        Boolean exceptionThrown = false;
        //test
        Drink hotWater = cm.boilWater(200);
        //assert
        System.assertEquals(200, hotWater.amount);
    }
}