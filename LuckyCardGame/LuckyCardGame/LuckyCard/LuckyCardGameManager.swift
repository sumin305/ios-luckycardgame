import Foundation

// 게임당 하나만 갖는 game manager
struct LuckyCardGameManager {
    
    // manager당 하나만 갖는 카드 분배 룰
    struct CardRule {
        static let shared = CardRule()
        var playerCount: Int = 3
        var playerCardCount: Int = 8
        var bottomCardCount: Int = 9
        var exceptNumber: LuckyCard.Number? = .twelve
    }
    
    static let shared = LuckyCardGameManager()
    var rule = CardRule.shared
    var deck = LuckyCardDeck.shared
    var playerArray: [LuckyCardPlayer] = []
    var bottom = BottomPlayer.shared

    mutating func setRule(playerCount: Int) {
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
    mutating func makeDeckDistribute() {
        deck.distributedCards(playerArray: &playerArray, playerCount: rule.playerCount, playerCardCount: rule.playerCardCount, bottomCardCount: rule.bottomCardCount, exceptNumber: rule.exceptNumber, bottom: &bottom)
    }
}
