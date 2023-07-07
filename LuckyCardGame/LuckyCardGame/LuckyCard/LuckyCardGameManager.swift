import Foundation

struct LuckyCardGameManager {
    
    static var  shared = LuckyCardGameManager()
    var deck = Deck.shared
    var participantsArray: [Participant] = []
    var participantsCount = 3 {
        willSet(count) {
            gameSetbyParticipantsCount(participantsCount: count)

        }
    }
    var participantsCardCount = 0
    var bottomCardCount: Int = 0
    
    private mutating func gameSetbyParticipantsCount(participantsCount: Int) {
        switch participantsCount {
            case 3:
                participantsCardCount = 8
                bottomCardCount = 9
                deck.allCardsArray = deck.allCardsArray.filter { $0.number != 12 }
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
            
            let p = Participant(cardCount: participantsCardCount, owningCards: Array(deck.allCardsArray[i*participantsCardCount...i*participantsCardCount+participantsCardCount-1]))
            participantsArray.append(p)
        }
    }
}
