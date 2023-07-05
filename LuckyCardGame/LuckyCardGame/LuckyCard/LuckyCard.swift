import Foundation

enum Animal: String, CaseIterable {
    case 🐶
    case 🐱
    case 🐮
}

enum CardState {
    case front
    case back
}

final class LuckyCard {
    var number: Int
    var animal: Animal
    var state: CardState
    
    init(number: Int, animal: Animal, state: CardState) {
        self.number = number
        self.animal = animal
        self.state = state
    }
}
