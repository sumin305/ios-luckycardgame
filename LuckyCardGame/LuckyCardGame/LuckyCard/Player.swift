import Foundation

final class LuckyCardPlayer: Player {
    var owningCards: [LuckyCard] = []
    var cardCount: Int {
        return owningCards.count
    }
    init(owningCards: [LuckyCard]) {
        self.owningCards = owningCards
    }
    func sortOwningCards() {
        owningCards.sort()
    }
}

final class BottomPlayer: Player {
    var owningCards: [LuckyCard] = []
    var cardCount: Int {
        return owningCards.count
    }
    init(owningCards: [LuckyCard]) {
        self.owningCards = owningCards
    }
    func sortOwningCards() {
        owningCards.sort()
    }
}
protocol Player {
    associatedtype Card
    var owningCards: [Card] { get set }
    var cardCount: Int { get }
    func sortOwningCards()
}

