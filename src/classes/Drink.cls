/**
 * An abstract class representing a drink produced by the ICoffeeMachine.
 */
public abstract class Drink {

    /**
     * The type of drink
     */
    public String type { get; private set; }

    /**
     * The size of the drink in ML
     */
    public Integer amount { get; private set; }

    /**
     * Construct a new drink.
     * @param  type   type description
     * @param  amount amount description
     * @return        return description
     */
    public Drink(String type, Integer amount) {
        this.type = type;
        this.amount = amount;
    }
}