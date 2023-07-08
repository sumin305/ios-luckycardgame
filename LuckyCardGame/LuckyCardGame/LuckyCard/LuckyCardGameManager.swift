import Foundation

// 게임당 하나만 갖는 game manager
struct LuckyCardGameManager {
    
    // manager당 하나만 갖는 카드 분배 룰
    struct CardRule {
        static var shared = CardRule()
        var playerCount: Int = 3 {
            willSet(count) {
                switch count {
                    case 3:
                        playerCardCount = 8
                        bottomCardCount = 9
                        exceptCard = ExceptCard(number: .twelve, animal: nil, state: nil)
                    case 4:
                        playerCardCount = 7
                        bottomCardCount = 8
                        exceptCard = nil
                    default:
                        playerCardCount = 6
                        bottomCardCount = 6
                        exceptCard = nil
                }
            }
        }
        var playerCardCount: Int = 8
        var bottomCardCount: Int = 9
        var exceptCard: Card? = ExceptCard(number: .twelve, animal: nil, state: nil)
    }
    
    static var shared = LuckyCardGameManager()
    var rule = CardRule.shared
    var deck = LuckyCardDeck.shared
    var playerArray: [LuckyCardPlayer] = []
    
    private mutating func gameSetbyParticipantsCount(participantsCount: Int) {
        
        for i in 0..<participantsCount {
            let p = LuckyCardPlayer(owningCards: Array(deck.allCardsArray[i*rule.playerCardCount...i*rule.playerCardCount+rule.playerCardCount-1]))
            playerArray.append(p)
        }
    }
}
