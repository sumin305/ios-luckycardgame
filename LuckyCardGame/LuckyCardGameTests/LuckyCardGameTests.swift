import XCTest
@testable import LuckyCardGame

final class LuckyCardGameTests: XCTestCase {
    var testCases: [LuckyCardRule] = []

    override func setUp() {
        testCases.append(LuckyCardRule(playerCount: 3))
        testCases.append(LuckyCardRule(playerCount: 4))
        testCases.append(LuckyCardRule(playerCount: 5))
    }
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws { }

    // 랜덤한 카드 배열 반환
    func selectRandomCard(rule: LuckyCardRule, count: Int) -> [LuckyCard] {
        let game = LuckyGame()
        game.deck.makeAllShuffledCards()
        var cardsArray = game.deck.getAllCardsArray().filter{$0.number != .twelve}
        if let number = rule.exceptNumber {
            cardsArray = cardsArray.filter{$0.number != .twelve}
        }
        
        print(Array(cardsArray[0...count-1]))
        return Array(cardsArray[0...count-1])
    }

    // 3장의 같은 숫자의 카드와 이 숫자를 제외한 다른 숫자를 가지고 있는 카드 배열 반환
    func selectSameNumberThreeCard(rule: LuckyCardRule, count: Int) -> [LuckyCard] {
        let game = LuckyGame()
        game.deck.makeAllShuffledCards()
        var randomNumber = Int.random(in: 1...12)
        if let number = rule.exceptNumber {
            randomNumber = Int.random(in: 1...11)
        }
        var cardsArray = game.deck.getAllCardsArray()
        var sameNumberArray = [LuckyCard(number: LuckyCard.Number(rawValue: randomNumber)!, animal: .🐮, state: .back),
                               LuckyCard(number: LuckyCard.Number(rawValue: randomNumber)!, animal: .🐱, state: .back),
                               LuckyCard(number: LuckyCard.Number(rawValue: randomNumber)!, animal: .🐶, state: .back)]
        cardsArray = cardsArray.filter{!sameNumberArray.contains($0)}
        sameNumberArray.append(contentsOf: cardsArray[0...count-4])
        return sameNumberArray
    }
    
    // 모두 다른 숫자를 가지고 있는 LuckyCardArray return
    func selectDiffertCard(rule: LuckyCardRule, count: Int) -> [LuckyCard] {
        var numberArray = LuckyCard.Number.allCases[0..<count]
        if let number = rule.exceptNumber  {
            numberArray = numberArray.filter{$0 != LuckyCard.Number.twelve}
        }
        var differentCardArray: [LuckyCard] = []
        for idx in 0..<count {
            differentCardArray.append(LuckyCard(number: numberArray[idx], animal: LuckyCard.Animal.allCases.randomElement()!, state: .back))
        }
        return differentCardArray
    }
    
    // 참가자수를 지정하고 게임을 초기화하면 적절하게 카드를 나눠줘야 한다
    func testCardDistribute() throws {
        for testCase in testCases {
            // given
            let game = LuckyGame()
            // when
            game.makeDeckDistribute(playerCount: testCase.playerCount)
            
            // then
            XCTAssertTrue(game.playerArray.allSatisfy({$0.cardCount == testCase.playerCardCount}))
            XCTAssertTrue(game.bottom.cardCount == testCase.bottomCardCount)
        }
    }
    
    // 참가자별로 카드를 숫자 오름차순으로 정렬할 수 있어야 한다
    func testPlayerCanSort() throws {
        for testCase in testCases {
            // given
            let testArray = selectRandomCard(rule: testCase, count: testCase.playerCardCount)
            let testPlayer = LuckyCardPlayer(owningCards: testArray)
            
            // when
            testPlayer.sortOwningCards()
            
            // then
            XCTAssertEqual(testPlayer.owningCards, testArray.sorted(), "참가자 오름차순 정렬 실패")
        }
    }
    
    // 바닥에 깔린 카드도 숫자 오름차순으로 정렬할 수 있어야 한다
    func testBottomCanSort() throws {
        for testCase in testCases {
            // given
            let testArray = selectRandomCard(rule: testCase, count: testCase.bottomCardCount)
            let testBottom = BottomPlayer(owningCards: testArray)
            
            //when
            testBottom.sortOwningCards()
            
            // then
            XCTAssertEqual(testBottom.owningCards, testArray.sorted(), "마당패 오름차순 정렬 실패")
        }
    }

    // 참가자 중에 같은 숫자 카드 3장을 가진 경우가 있는지 판단할 수 있다
    func test_player_can_judge_having_three_same_number_in_owning_cards() throws {
        for testCase in testCases {
            // given
            let testSameNumberArray = selectSameNumberThreeCard(rule: testCase, count: testCase.playerCardCount)
            let testPlayer1 = LuckyCardPlayer(owningCards: testSameNumberArray)
            
            // when
            let (_, hasPlayerSameThreeCards1) = testPlayer1.hasSameThreeCards()
            // then
            XCTAssertTrue(hasPlayerSameThreeCards1, "같은 숫자 카드 3장임을 판단할 수 없음")
            
            // given
            let testDifferentNumberArray = selectDiffertCard(rule: testCase, count: testCase.playerCardCount)
            let testPlayer2 = LuckyCardPlayer(owningCards: testDifferentNumberArray)
            
            // when
            let (_, hasPlayerSameThreeCards2) = testPlayer2.hasSameThreeCards()
            // then
            XCTAssertFalse(hasPlayerSameThreeCards2, "같은 숫자 카드 3장임을 판단할 수 없음")
        }
    }
    
    // 특정 참가자와 해당 참가자 카드 중에 가장 낮은 숫자 또는 가장 높은 숫자, 바닥 카드 중 아무거나를 선택해서 3개가 같은지 판단할 수 있어야 한다.
    func testHaveSameNumberInGame() throws {
        for testCase in testCases {
            let game = LuckyGame()
            game.makeDeckDistribute(playerCount: testCase.playerCount)
        }
        
    }
}
