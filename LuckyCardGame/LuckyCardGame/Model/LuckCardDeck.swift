import Foundation

final class LuckyCardDeck {
    
    private var allCardsArray: [LuckyCard] = []
    private let cardNumberRange = 1...12
    
    func makeAllShuffledCards() {
        allCardsArray = []
        LuckyCard.Animal.allCases.forEach { animal in
            LuckyCard.Number.allCases.forEach { number in
                allCardsArray.append(LuckyCard(number: number, animal: animal, state: .back))
            }
            allCardsArray.shuffle()
        }
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
