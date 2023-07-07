import Foundation
/*
 [Animal, CardState를 Nested Enum을 사용한 이유]
 - Animal과 CardState 모두 2, 3개의 제한된 값만을 가지므로 enum 타입을 활용하였습니다.
 - struct나 class와 같이 인스턴스를 생성하지 않고 값에 접근할 수 있습니다.
 - 또한 LuckyCard.Animal과 같이 카드 내부에 있는 속성임을 알려 데이터간의 포함관계를 나타낼 수 있습니다.
 */
final class LuckyCard {
    
    enum Animal: String, CaseIterable {
        case 🐶
        case 🐱
        case 🐮
    }
    
    enum CardState {
        case front
        case back
    }
    
    let number: Int
    let animal: Animal
    var state: CardState
    
    init(number: Int, animal: Animal, state: CardState) {
        self.number = number
        self.animal = animal
        self.state = state
    }
    
    var description: String {
        return animal.rawValue + String(format: "%02d", self.number)
    }
}

