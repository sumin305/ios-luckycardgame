import Foundation

struct CardManager {
    
    private var cardsArray: [LuckyCard] = []
    private let cardNumberRange = 1...12
    
    mutating func makeAllCards() {
        Animal.allCases.forEach { animal in
            for number in cardNumberRange {
                self.cardsArray.append(LuckyCard(number: number, animal: animal, state: .back))
            }
        }
    }
    
    func printCards() {
        let randomCardsArray = cardsArray.shuffled()
        let randomCardsStringArray = randomCardsArray.map{"\($0.animal)\($0.number < 10 ? "0" + String($0.number) : String($0.number))"}
        print(randomCardsStringArray.joined(separator: ", "))
    }
}
