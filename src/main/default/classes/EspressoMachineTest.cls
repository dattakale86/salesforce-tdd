@isTest
class EspressoMachineTest {
    @isTest
    static void brewEspresso_RinsedAndHaveWater_ShouldReturnEspresso() {
        //prepare
        IEspressoMachine cm = new EspressoMachine();
        //test
        Drink Espresso = cm.brewEspresso();
        //assert
        System.assertNotEquals(null, Espresso);
        System.assertEquals('Espresso', Espresso.type);
    }
    @isTest
    static void brewEspresso_NoWater_ShouldThrowException() {
        //prepare
        IEspressoMachine cm = new EspressoMachine();
        Boolean exceptionThrown = false;
        //test
        try{
            
            for(Integer i = 0; i < 21; i++) {
                if(Math.mod(i,5) == 0 && i != 0){
                    cm.rinseMachine();
                }
                cm.brewEspresso();    
            }
        }
        catch(NoWaterException e){
            exceptionThrown = true;
        }
        //assert
        System.assertEquals(true, exceptionThrown);
    }
    @isTest
    static void brewEspresso_NotRinsedAfterFiveServes_ShouldThrowException() {
        //prepare
        IEspressoMachine cm = new EspressoMachine();
        Boolean exceptionThrown = false;
        //test
        try{
            cm.brewEspresso();
            cm.brewEspresso();
            cm.brewEspresso();
            cm.brewEspresso();
            cm.brewEspresso();
            cm.brewEspresso();
        }
        catch(CoffeeMachineNotRinsedException e){
            exceptionThrown = true;
        }
        //assert
        System.assertEquals(true, exceptionThrown);
    }
}
