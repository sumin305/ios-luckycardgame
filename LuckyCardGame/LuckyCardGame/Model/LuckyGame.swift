import Foundation

// 게임당 하나만 갖는 game manager
final class LuckyGame {

    var rule = LuckyCardRule()
    var deck = LuckyCardDeck()
    var playerArray: [LuckyCardPlayer] = []
    var bottom: BottomPlayer = BottomPlayer(owningCards: [])
    
    init() {
        printAnimalCards()
        rule.setRule(playerCount: 3)
        makeDeckDistribute(playerCount: rule.playerCount)
    }
    
    // 미션2 출력 구현
    func printAnimalCards() {
        print("W1 - mission 2")
        deck.makeAllShuffledCards()
        deck.printAllCards()
    }
    
    // Deck에서 나눠준 카드로 분배
    func makeDeckDistribute(playerCount: Int) {
        let luckyCardArray = deck.distributedCards(rule: rule)
        playerArray = []
        for i in 0..<rule.playerCount {
            playerArray.append(LuckyCardPlayer(owningCards: luckyCardArray[i]))
        }
        bottom = BottomPlayer(owningCards: luckyCardArray[luckyCardArray.count-1])
    }
    
}
