import Foundation

final class LuckyCardPlayer: Player {
    var owningCards: [LuckyCard] = []
    var cardCount: Int {
        return owningCards.count
    }
    
    init(owningCards: [LuckyCard]) {
        self.owningCards = owningCards
    }
    
    func sortOwningCards() {
        owningCards.sort()
    }
    
    func hasSameThreeCards() -> (LuckyCard.Number?, Bool) {
        var count = 1
        let testArray = owningCards.sorted()
        guard !testArray.isEmpty else { return (nil, false) }
        for cardIndex in 1..<testArray.count {
            if testArray[cardIndex].number == testArray[cardIndex-1].number {
                count += 1
            } else {
                count = 1
            }
            if count == 3 {
                return (testArray[cardIndex].number, true)
            }
        }
        return (nil, false)
    }
    func hasSameThreeCardsInFrontOrBack() -> (LuckyCard.Number?, Bool) {
        let testArray = owningCards.sorted()
        guard testArray.count > 2 else { return (nil, false) }
        if (testArray[0].number == testArray[1].number) && (testArray[1].number == testArray[2].number) {
            return (testArray[0].number, true)
        } else if (testArray[testArray.endIndex-1].number == testArray[testArray.endIndex-2].number) && (testArray[testArray.endIndex-2].number == testArray[testArray.endIndex-3].number) {
            return (testArray[testArray.endIndex-1].number, true)
        } else {
            return (nil, false)
        }
    }
    func hasSameTwoCardsInFrontOrBack() -> (LuckyCard.Number?, Bool) {
        let testArray = owningCards.sorted()
        guard testArray.count > 1 else { return (nil, false) }
        if testArray[0].number == testArray[1].number {
            return (testArray[0].number, true)
        } else if testArray[testArray.endIndex-1].number == testArray[testArray.endIndex-2].number {
            return (testArray[testArray.endIndex-1].number, true)
        } else {
            return (nil, false)
        }
    }
    
    func selectThreeCards() -> [LuckyCard] {
        // 자신의 앞단 혹은 뒷단 패에 같은 숫자 3개가 있을 때
        var returnArray: [LuckyCard] = []
        let (threeSameNumber, hasPlayerSameThreeCardsInFrontOrBack) = hasSameThreeCardsInFrontOrBack()
        let (twoSameNumber, hasPlayerSameTwoCardsInFrontOrBack) = hasSameTwoCardsInFrontOrBack()
        if hasPlayerSameThreeCardsInFrontOrBack {
            if let num = threeSameNumber {
                returnArray = owningCards.filter {$0.number == num}
                return returnArray
            }
        }
        // 자신의 앞단 혹은 뒷단 패에 같은 숫자 2개가 있을 때
        else if hasPlayerSameTwoCardsInFrontOrBack {
            if let num = twoSameNumber {
                returnArray = owningCards.filter {$0.number == num}
                return returnArray
            }
        }
        // 자신의 앞단 혹은 뒷단 패에 같은 숫자가 없을 때 -> 난수 3개 뽑기
        return []
    }
    func allThreeCardsArraySame(threeCardsArray: [LuckyCard]) -> Bool {
        if (threeCardsArray[0] == threeCardsArray[1]) && (threeCardsArray[1] == threeCardsArray[2]) {
            return true
        } else {
            return false
        }
    }
}

final class BottomPlayer: Player {
    var owningCards: [LuckyCard] = []
    var cardCount: Int {
        return owningCards.count
    }
    init(owningCards: [LuckyCard]) {
        self.owningCards = owningCards
    }
    func sortOwningCards() {
        owningCards.sort()
    }
    func hasSameThreeCards() -> (LuckyCard.Number?, Bool) {
        var count = 1
        let testArray = owningCards.sorted()
        for cardIndex in 1..<testArray.count {
            if testArray[cardIndex].number == testArray[cardIndex-1].number {
                count += 1
            } else {
                count = 1
            }
            if count == 3 {
                return (testArray[cardIndex].number, true)
            }
        }
        return (nil, false)
    }

}

protocol Player {
    associatedtype Card
    var owningCards: [Card] { get set }
    var cardCount: Int { get }
    func sortOwningCards()
    func hasSameThreeCards() -> (LuckyCard.Number?, Bool)
}

