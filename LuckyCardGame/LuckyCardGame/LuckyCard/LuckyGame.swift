import Foundation

// 게임당 하나만 갖는 game manager
final class LuckyGame {
    
    // manager당 하나만 갖는 카드 분배 룰
    struct CardRule {
        var playerCount: Int = 3
        var playerCardCount: Int = 8
        var bottomCardCount: Int = 9
        var exceptNumber: LuckyCard.Number? = .twelve
    }
    
    private init() { }
    static let shared = LuckyGame()
    var rule = CardRule()
    var deck = LuckyCardDeck()
    var playerArray: [LuckyCardPlayer] = Array(repeating: LuckyCardPlayer(owningCards: []), count: 3)
    var bottom = BottomPlayer(owningCards: [])
    
    func setRule(playerCount: Int) {
        switch playerCount {
        case 3:
            rule.playerCardCount = 8
            rule.bottomCardCount = 9
            rule.exceptNumber = LuckyCard.Number.twelve
        case 4:
            rule.playerCardCount = 7
            rule.bottomCardCount = 8
            rule.exceptNumber = nil
        default:
            rule.playerCardCount = 6
            rule.bottomCardCount = 6
            rule.exceptNumber = nil
        }
        makeDeckDistribute()
    }
    // Deck에서 카드 분배하도록 지시
    func makeDeckDistribute() {
        deck.distributedCards(rule: rule)
    }
}
