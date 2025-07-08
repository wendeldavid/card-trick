using System.Text;
using card_trick.card;

namespace card_trick.deck;

public class Deck
{
    private readonly Stack<Card> _col1;
    private readonly Stack<Card> _col2;
    private readonly Stack<Card> _col3;
    
    public Deck(Stack<Card> col1, Stack<Card> col2, Stack<Card> col3)
    {
        _col1 = col1;
        _col2 = col2;
        _col3 = col3;
    }
    
    public Stack<Card> Col1 => _col1;
    public Stack<Card> Col2 => _col2;
    public Stack<Card> Col3 => _col3;

    public override string ToString()
    {
        var sb = new StringBuilder();
        
        Card[][] cols = { _col1.ToArray(), _col2.ToArray(), _col3.ToArray() };
        
        sb.Append("---------------").Append('\n');
        sb.Append(" c1").Append(" |  ").Append("c2").Append(" | ").Append(" c3").Append('\n');
        sb.Append("---------------").Append('\n');
        for (var i = 0; i < _col1.Count; i++) {
            var card1 = cols[0][i];
            var card2 = cols[1][i];
            var card3 = cols[2][i];

            sb.Append(card1).Append(" | ").Append(card2).Append(" | ").Append(card3);
            sb.Append('\n');
        }
        sb.Append("---------------").Append("\n");
        return sb.ToString();
    }
}