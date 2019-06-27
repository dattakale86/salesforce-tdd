public interface ICoffeeMachine {

    /**
     * Brews a coffee with the specified amount of water in the desired strength specified as integer
     * @param  amount   Amount of coffee specified in ML
     * @param  strength Strength of the coffee between 1 and 5
     */
    Drink brewCoffee(Integer amount, Integer strength);

    /**
     * Boils the specified amount of water.
     * @param  amount Amount of water specified in ML
     */
    Drink boilWater(Integer amount);

    /**
     * Rinses the coffee machine
     */
    void rinseMachine();

    /**
     * Top up the water reservoir
     * @param  amount Amount of water specified in ML
     */
    void addWater(Integer amount);

    /**
     * Gets the number of coffees and teas served by our machine.
     * @return   return description
     */
    Integer getDrinksServed();

    /**
     * Gets the amount of water left in the machine.
     * @return   return description
     */
    Integer getWaterLevel();
}