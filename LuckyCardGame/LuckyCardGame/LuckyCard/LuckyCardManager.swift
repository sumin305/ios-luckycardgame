import Foundation
/*
[struct로 CardManager를 구현한 이유]
 - LuckyCard들을 보관하고 카드를 섞고 출력해주는 게임을 진행하는 타입이 필요했습니다.
 - struct는 인스턴스를 heap영역이 아닌 stack 영역에 저장된다고 알고 있습니다. 이러한 이유로 class보다 인스턴스를 생성 속도가 매우 빠릅니다.
 - 또한, 상속과 메모리 누수를 막기 위해 struct를 사용하였습니다.
 */
struct LuckyCardManager {
    
    static var shared = LuckyCardManager()
    var allCardsArray: [LuckyCard] = []
    var participantsCount = 3 {
        willSet(count) {
            switch count {
                case 3:
                    participantsCardCount = 8
                    bottomCardCount = 9
                    allCardsArray = allCardsArray.filter { $0.number != 12 }
                case 4:
                    participantsCardCount = 7
                    bottomCardCount = 8
                    makeAllShuffledCards()
                default:
                    participantsCardCount = 6
                    bottomCardCount = 6
                    makeAllShuffledCards()
            }
        }
    }
    var participantsCardCount = 0
    var bottomCardCount: Int = 0
    
    private let cardNumberRange = 1...12
    
    mutating func makeAllShuffledCards() {
        allCardsArray = []
        LuckyCard.Animal.allCases.forEach { animal in
            for number in cardNumberRange {
                self.allCardsArray.append(LuckyCard(number: number, animal: animal, state: .back))
            }
        }
        self.allCardsArray.shuffle()
    }
    
    func printAllCards() {
        print(self.allCardsArray.map({ $0.description }).joined(separator: ", "))
    }
}
