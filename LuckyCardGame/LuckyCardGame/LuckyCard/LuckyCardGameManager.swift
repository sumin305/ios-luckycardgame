import Foundation

struct LuckyCardGameManager {
    
    static var  shared = LuckyCardGameManager()
    var deck = LuckyCardDeck.shared
    var playerArray: [LuckyCardPlayer] = []
    var participantsCount : Int {
        willSet(count) {
            gameSetbyParticipantsCount(participantsCount: count)
        }
    }
    var participantsCardCount = 0
    var bottomCardCount: Int = 0
    
    init() {
        participantsCount = 3
    }
    
    private mutating func gameSetbyParticipantsCount(participantsCount: Int) {
        switch participantsCount {
            case 3:
                participantsCardCount = 8
                bottomCardCount = 9
            deck.allCardsArray = deck.allCardsArray.filter({$0.filterNumber(LuckyCard.Number.twelve)})
            case 4:
                participantsCardCount = 7
                bottomCardCount = 8
                deck.makeAllShuffledCards()
            default:
                participantsCardCount = 6
                bottomCardCount = 6
                deck.makeAllShuffledCards()
        }
        
        for i in 0..<participantsCount {
            
            let p = LuckyCardPlayer(owningCards: Array(deck.allCardsArray[i*participantsCardCount...i*participantsCardCount+participantsCardCount-1]))
            playerArray.append(p)
        }
    }
}
