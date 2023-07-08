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

struct BottomPlayer: Player {
    static let shared = BottomPlayer()
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

