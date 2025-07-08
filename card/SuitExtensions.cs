namespace card_trick.card;

public static class SuitExtensions
{
    private static string GetSuitCode(this Suit suit)
    {
        return suit switch
        {
            Suit.Spades => "\u2660",
            Suit.Clubs => "\u2663",
            Suit.Hearts => "\u2665",
            Suit.Diamonds => "\u2666",
            _ => throw new ArgumentOutOfRangeException(nameof(suit), suit, "Invalid suit value")
        };
    }

    public static string ToUnicodeString(this Suit suit)
    {
        return suit.GetSuitCode();
    }
}