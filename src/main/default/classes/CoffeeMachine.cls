public virtual class CoffeeMachine implements ICoffeeMachine {

    protected Integer drinksServed;
    protected Integer waterLevel;

    public CoffeeMachine(){
        drinksServed = 0;
        waterLevel = 1000;
    }

    public Drink brewCoffee(Integer amount, Integer strength) {
        if(drinksServed >= 5) {
            throw new CoffeeMachineNotRinsedException('CoffeMachine should be rinsed first in order to serve coffee');    
        }
        if(amount < 20 ||
           amount > 200) {
            throw new OutOfRangeException('Coffe can be served only between 20ML to 200ML');
        }
        if(strength < 1 ||
           strength > 5) {
            throw new OutOfRangeException('Coffe Strenth can be served only between 1 to 5');
        }
        if(waterLevel < amount) {
            throw new NoWaterException('Not enough water available in coffee machine. Please add water!');
        }
        waterLevel = waterLevel - amount;
        drinksServed = drinksServed + 1;
        return new Coffee(amount);
    }

    public Drink boilWater(Integer amount) {
        if(drinksServed >= 5) {
            throw new CoffeeMachineNotRinsedException('CoffeMachine should be rinsed first in order to serve hot water');    
        }
        if(amount < 100 ||
           amount > 250) {
            throw new OutOfRangeException('Hot Water can be served only between 100ML to 250ML');
        }
        if(waterLevel < amount) {
            throw new NoWaterException('Not enough water available in coffee machine. Please add water!');
        }
        waterLevel = waterLevel - amount;
        drinksServed = drinksServed + 1;
        return new HotWater(amount);
    }

    public void rinseMachine() {
        if(drinksServed > 2) {
            drinksServed = 0;
        }
    }
    
    public void addWater(Integer amount) {
        if((waterLevel + amount) > 1000) {
            throw new OutOfCapacityException('Water capacity of CoffeeMachine is 1L only');
        }
        waterLevel += amount;
    }

    public Integer getDrinksServed() {
        return drinksServed;
    }

    public Integer getWaterLevel() {
        return waterLevel;
    }
    
}