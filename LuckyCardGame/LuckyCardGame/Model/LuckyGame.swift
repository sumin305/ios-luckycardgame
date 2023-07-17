import Foundation

// 게임당 하나만 갖는 game manager
final class LuckyGame: Game {
    
    private(set) var rule = LuckyCardRule()
    private(set) var deck = LuckyCardDeck()
    private(set) var playerArray: [LuckyCardPlayer] = []
    private(set) var bottom: BottomPlayer = BottomPlayer(owningCards: [])
    
    init() {
        printAnimalCards()
        rule.setRule(playerCount: 3)
        makeDeckDistribute(playerCount: rule.playerCount)
    }
    
    func makeDeckDistribute(playerCount: Int) {
        let luckyCardArray = deck.distributedCards(rule: rule)
        playerArray = []
        for i in 0..<rule.playerCount {
            playerArray.append(LuckyCardPlayer(owningCards: luckyCardArray[i]))
        }
        bottom = BottomPlayer(owningCards: luckyCardArray[luckyCardArray.count-1])
    }
    
    func setRule(playerCount: Int) {
        rule.setRule(playerCount: playerCount)
    }
    
    // 미션2 출력 구현
    func printAnimalCards() {
        print("W1 - mission 2")
        deck.makeAllShuffledCards()
        deck.printAllCards()
    }
    
    func judgeThreeCardsSame(selectedCards: [LuckyCard]) -> Bool {
        let targetNumber = selectedCards[0].number
        if selectedCards[1].number == targetNumber && selectedCards[2].number == targetNumber {
            return true
        } else {
            return false
        }
    }
    
    func selectPlayerThreeCards(playerIndex: Int) -> [LuckyCard] {
        let player = playerArray[playerIndex]
        let selectedCards = player.selectThreeCards()
        switch (selectedCards.count) {
            case 3:
                return selectedCards
            case 4:
                selectedCards.append()
                
        }
    }
}

protocol Game {
    func makeDeckDistribute(playerCount: Int)
    func setRule(playerCount: Int)
}
