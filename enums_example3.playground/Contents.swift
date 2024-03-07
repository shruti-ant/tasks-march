import UIKit
import Foundation


/*
 Card Game Implementation: Implement a card game in Swift using enums to represent the suits (hearts, diamonds, clubs, spades) and values (ace, 2-10, jack, queen, king) of the cards. The program should be able to shuffle and deal cards to players.
 */


enum Suit: String {
    case hearts = "Hearts"
    case diamonds = "Diamonds"
    case clubs = "Clubs"
    case spades = "Spades"
    
    static let allSuits: [Suit] = [.hearts, .diamonds, .clubs, .spades]
}

enum Value: String {
    case ace = "Ace"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case ten = "10"
    case jack = "Jack"
    case queen = "Queen"
    case king = "King"
    
    static let allValues: [Value] = [.ace, .two, .three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .queen, .king]
}

struct Card {
    let suit: Suit
    let value: Value
}

class Deck {
    var cards: [Card] = []
    
    init() {
        for suit in Suit.allSuits {
            for value in Value.allValues {
                cards.append(Card(suit: suit, value: value))
            }
        }
    }
    
    func shuffle() {
        cards.shuffle()
    }
    
    func deal(numCards: Int) -> [Card] {
        var dealtCards: [Card] = []
        
        for _ in 0..<numCards {
            if let card = cards.popLast() {
                dealtCards.append(card)
            }
        }
        
        return dealtCards
    }
}

let deck = Deck()
deck.shuffle()

let hand = deck.deal(numCards: 5)
for card in hand {
    print("\(card.value.rawValue) of \(card.suit.rawValue)")
}

