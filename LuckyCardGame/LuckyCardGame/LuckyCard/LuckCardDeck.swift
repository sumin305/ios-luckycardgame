import Foundation
/*
[struct로 CardManager를 구현한 이유]
 - LuckyCard들을 보관하고 카드를 섞고 출력해주는 게임을 진행하는 타입이 필요했습니다.
 - struct는 인스턴스를 heap영역이 아닌 stack 영역에 저장된다고 알고 있습니다. 이러한 이유로 class보다 인스턴스를 생성 속도가 매우 빠릅니다.
 - 또한, 상속과 메모리 누수를 막기 위해 struct를 사용하였습니다.
 */
struct LuckyCardDeck: Deck {

    static var shared = LuckyCardDeck()
    var allCardsArray: [LuckyCard] = []
    
    let cardNumberRange = 1...12
    
    mutating func makeAllShuffledCards() {
        allCardsArray = []
        LuckyCard.Animal.allCases.forEach { animal in
            LuckyCard.Number.allCases.forEach { number in
                self.allCardsArray.append(LuckyCard(number: number, animal: animal, state: .back))
            }
        }
        self.allCardsArray.shuffle()
    }
    
    func printAllCards() {
        print(self.allCardsArray.map({ $0.description }).joined(separator: ", "))
    }
    
    // LuckyCardManager에게서 지시받은 카드 나눠주기
    mutating func distributedCards(playerArray: inout [LuckyCardPlayer], playerCount: Int, playerCardCount: Int, bottomCardCount: Int, exceptCard: Card?) {
        playerArray = []
        makeAllShuffledCards()
        for startIndex in 0..<playerCount {
            let player = LuckyCardPlayer(owningCards: Array(allCardsArray[startIndex * playerCardCount...startIndex * playerCardCount + playerCardCount - 1]))
            playerArray.append(player)
        }
    }
}

protocol Deck {
    associatedtype Card
    var cardNumberRange: ClosedRange<Int> { get }
    var allCardsArray: [Card] { get set }
}
