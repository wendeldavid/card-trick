namespace card_trick.card;

public class Card
{
    private readonly int _value;
    private readonly Suit _suit;

    public Card(int value, Suit suit)
    {
        _value = value;
        _suit = suit;
    }
    
    public int Value => _value;
    public Suit Suit => _suit;

    public override string ToString()
    {
        var prefix = Value < 10 ? " " : "";
        return $"{prefix}{Value}{_suit.ToUnicodeString()}";
    }
}