public class EspressoMachine extends CoffeeMachine implements IEspressoMachine {
    
    public Espresso brewEspresso(){
        if(drinksServed >= 5) {
            throw new CoffeeMachineNotRinsedException('CoffeMachine should be rinsed first in order to serve coffee');    
        }
        if(waterLevel < 50) {
            throw new NoWaterException('Not enough water available in coffee machine. Please add water!');
        }
        waterLevel = waterLevel - 50;
        drinksServed = drinksServed + 1;
        return new Espresso();
    }
}
