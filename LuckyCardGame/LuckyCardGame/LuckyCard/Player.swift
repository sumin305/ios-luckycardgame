import Foundation

struct LuckyCardPlayer: Player {
    
    var owningCards: [LuckyCard] = []
    var cardCount: Int {
        return owningCards.count
    }
    mutating func sortOwningCards() {
        owningCards.sort()
    }
    
}
protocol Player
{
    associatedtype Card
    var owningCards: [Card] { get set }
    var cardCount: Int { get }
    mutating func sortOwningCards()
}

