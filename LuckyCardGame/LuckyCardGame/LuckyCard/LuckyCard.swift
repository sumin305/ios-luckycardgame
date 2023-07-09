import Foundation
/*
 [Animal, CardState를 Nested Enum을 사용한 이유]
 - Animal과 CardState 모두 2, 3개의 제한된 값만을 가지므로 enum 타입을 활용하였습니다.
 - struct나 class와 같이 인스턴스를 생성하지 않고 값에 접근할 수 있습니다.
 - 또한 LuckyCard.Animal과 같이 카드 내부에 있는 속성임을 알려 데이터간의 포함관계를 나타낼 수 있습니다.
 */
final class LuckyCard: Card, Comparable {
    
    enum Animal: String, CaseIterable {
        case 🐶
        case 🐱
        case 🐮
    }
    
    enum Number: Int,CaseIterable {
        case one = 1
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
        case nine
        case ten
        case eleven
        case twelve
    }
    
    enum CardState {
        case front
        case back
    }
    
    private(set) var number: Number
    private(set) var animal: Animal
    private var state: CardState
    
    init(number: Number, animal: Animal, state: CardState) {
        self.number = number
        self.animal = animal
        self.state = state
    }
    
    var description: String {
        return animal.rawValue + String(format: "%02d", self.number.rawValue)
    }
    
    static func == (lhs: LuckyCard, rhs: LuckyCard) -> Bool {
        return lhs.number.rawValue == rhs.number.rawValue
    }
    
    static func < (lhs: LuckyCard, rhs: LuckyCard) -> Bool {
        return lhs.number.rawValue < rhs.number.rawValue
    }
    // private를 사용한 프로퍼티 이용
    func filterNumber(_ number: Number) -> Bool {
        if self.number == number {
            return false
        } else {
            return true
        }
    }
    
    func reverseCard() {
        if state == .back {
            state = .front
        } else {
            state = .back
        }
    }
}

protocol Card { }
