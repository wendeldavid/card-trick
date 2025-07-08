using card_trick.card;
using card_trick.deck;

namespace card_trick;

public class Game
{
    private readonly IList<Card> _allCards;
    private int _cycle = 0;

    public Game()
    {
        var allCards = PopulateCards();
        
        allCards.Shuffle();

        _allCards = allCards
            .Take(21)
            .ToList();

        Run();
    }

    public void Run()
    {
        while (RunCycle())
        {
            //do nothing
        }
        var cardGuessed = _allCards[10];
        Console.WriteLine($"The chosen card: {cardGuessed}");
    }

    private IList<Card> PopulateCards()
    {
        IList<Card> allCards = new List<Card>();
        for (int i = 1; i <= 13; i++)
        {
            allCards.Add(new Card(i, Suit.Spades));
            allCards.Add(new Card(i, Suit.Hearts));
            allCards.Add(new Card(i, Suit.Diamonds));
            allCards.Add(new Card(i, Suit.Clubs));
        }
        return allCards;
    }


private bool RunCycle()
    {
        var deck = SortToColumns();

        var choice = PickCard();
        
        RejoinCards(choice, deck);
        
        return ++_cycle < 2;
    }
    
    private static int PickCard()
    {
        Console.Write("Choose a column (1, 2 ou 3): ");
        string? input = Console.ReadLine();
        int choice = int.Parse(input ?? string.Empty);
        Console.WriteLine($"escolha: {choice}");
        return choice;
    }

    private void RejoinCards(int choice, Deck deck)
    {
        switch (choice)
        {
            case 1:
            {
                foreach (var card in deck.Col2) _allCards.Add(card);
                foreach (var card in deck.Col1) _allCards.Add(card);
                foreach (var card in deck.Col3) _allCards.Add(card);
                break;
            }
            case 2:
            {
                foreach (var card in deck.Col1) _allCards.Add(card);
                foreach (var card in deck.Col2) _allCards.Add(card);
                foreach (var card in deck.Col3) _allCards.Add(card);
                break;
            }
            case 3:
            {
                foreach (var card in deck.Col1) _allCards.Add(card);
                foreach (var card in deck.Col3) _allCards.Add(card);
                foreach (var card in deck.Col2) _allCards.Add(card);
                break;
            }
        }
    }

    private Deck SortToColumns()
    {
        var col1 = new Stack<Card>();
        var col2 = new Stack<Card>();
        var col3 = new Stack<Card>();

        for (int i = 0; i < _allCards.Count; i++)
        {
            if (i % 3 == 0)
            {
                col1.Push(_allCards[i]);
            }
            else if (i % 3 == 1)
            {
                col2.Push(_allCards[i]);
            }
            else
            {
                col3.Push(_allCards[i]);
            }
        }
        _allCards.Clear();

        var deck = new Deck(col1, col2, col3);
        Console.WriteLine(deck.ToString());
        return deck;
    }
}

public static class ListExtensions
{
    private static readonly Random Rng = new Random();

    public static void Shuffle<T>(this IList<T> list)
    {
        var n = list.Count;
        while (n > 1)
        {
            n--;
            var k = Rng.Next(n + 1);
            (list[k], list[n]) = (list[n], list[k]);
        }
    }
}