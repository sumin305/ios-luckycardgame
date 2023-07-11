import Foundation
/*
[struct로 CardManager를 구현한 이유]
 - LuckyCard들을 보관하고 카드를 섞고 출력해주는 게임을 진행하는 타입이 필요했습니다.
 - struct는 인스턴스를 heap영역이 아닌 stack 영역에 저장된다고 알고 있습니다. 이러한 이유로 class보다 인스턴스를 생성 속도가 매우 빠릅니다.
 - 또한, 상속과 메모리 누수를 막기 위해 struct를 사용하였습니다.
 */
final class LuckyCardDeck {

    private var allCardsArray: [LuckyCard] = []
    private let cardNumberRange = 1...12
    
    func makeAllShuffledCards() {
        allCardsArray = []
        LuckyCard.Animal.allCases.forEach { animal in
            LuckyCard.Number.allCases.forEach { number in
                allCardsArray.append(LuckyCard(number: number, animal: animal, state: .back))
            }
        }
        allCardsArray.shuffle()
    }
    
    func printAllCards() {
        print(allCardsArray.map({ $0.description }).joined(separator: ", "))
    }
    
    // LuckyCardManager에게서 지시받은 카드 나눠주기
    func distributedCards(rule: LuckyCardRule) -> [[LuckyCard]] {
        var luckyCardArray: [[LuckyCard]] = []
        makeAllShuffledCards()
        if let number = rule.exceptNumber {
            allCardsArray = allCardsArray.filter{$0.filterNumber(number)}
        }
        for startIndex in 0..<rule.playerCount {
            luckyCardArray.append(Array(allCardsArray[startIndex * rule.playerCardCount...startIndex * rule.playerCardCount + rule.playerCardCount - 1]))
        }
        luckyCardArray.append(Array(allCardsArray[rule.playerCount * rule.playerCardCount...allCardsArray.count-1]))
        return luckyCardArray
    }
}
