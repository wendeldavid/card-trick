namespace card_trick.card;

public class Card(int value, Suit suit)
{
    private int Value => value;
    public Suit Suit => suit;

    public override string ToString()
    {
        var prefix = Value < 10 ? " " : "";
        return $"{prefix}{Value}{suit.ToUnicodeString()}";
    }
}