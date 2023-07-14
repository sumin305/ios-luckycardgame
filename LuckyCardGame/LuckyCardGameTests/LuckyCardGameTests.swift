import XCTest
@testable import LuckyCardGame

final class LuckyCardGameTests: XCTestCase {
    
    var sut: LuckyGame! = nil
    
    override func setUp() {
        sut = LuckyGame()
    }
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws { }

    func testExample() throws {
    }
    
    func testLuckyGame(playerCount: Int) throws {
        try testCardDistribute(playerCount: playerCount)
        for playerIndex in 0..<playerCount {
            try testPlayerCanSort(playerIndex: playerIndex)
            try testHaveSameNumberInOwningCards()
        }
        try testBottomCanSort()
        try testHaveSameNumberInGame()
    }
    
    // 참가자수를 지정하고 게임을 초기화하면 적절하게 카드를 나눠줘야 한다
    func testCardDistribute(playerCount: Int) throws {
        
        // given
        
        // when
        sut.setRule(playerCount: playerCount)
        sut.makeDeckDistribute(playerCount: playerCount)
        XCTAssertTrue(sut.playerArray.allSatisfy({$0.cardCount == sut.rule.playerCardCount}))
        XCTAssertTrue(sut.bottom.cardCount == sut.rule.bottomCardCount)
    }

    // 바닥에 깔린 카드도 숫자 오름차순으로 정렬할 수 있어야 한다
    func testBottomCanSort() throws {
        sut.bottom.sortOwningCards()
        XCTAssertEqual(sut.bottom.owningCards, sut.bottom.owningCards.sorted())
    }

    // 참가자별로 카드를 숫자 오름차순으로 정렬할 수 있어야 한다
    func testPlayerCanSort(playerIndex: Int) throws {
        sut.playerArray[playerIndex].sortOwningCards()
        XCTAssertEqual(sut.playerArray[playerIndex].owningCards, sut.playerArray[playerIndex].owningCards.sorted())
    }

    // 참가자 중에 같은 숫자 카드 3장을 가진 경우가 있는지 판단할 수 있다
    func testHaveSameNumberInOwningCards() throws {
        var sameThreeNumberCard = false
        let cardArray = [ LuckyCard(number: .eight, animal: .🐮, state: .back),
                          LuckyCard(number: .eight, animal: .🐱, state: .back),
                          LuckyCard(number: .eight, animal: .🐶, state: .back),
                          LuckyCard(number: .nine, animal: .🐶, state: .back),
                          LuckyCard(number: .ten, animal: .🐱, state: .back),
                          LuckyCard(number: .one, animal: .🐶, state: .back)]
        var count = 1
        for j in 1..<cardArray.count {
            if cardArray[j].number != cardArray[j-1].number {
                count = 1
                continue
            }
            count += 1
            if count == 3 {
                sameThreeNumberCard = true
                print("연속 3개!!!")
                count = 0
            }
        }
        XCTAssertTrue(sameThreeNumberCard)
    }
    // 특정 참가자와 해당 참가자 카드 중에 가장 낮은 숫자 또는 가장 높은 숫자, 바닥 카드 중 아무거나를 선택해서 3개가 같은지 판단할 수 있어야 한다.
    func testHaveSameNumberInGame() throws {
        let card1 = LuckyCard(number: .eight, animal: .🐮, state: .back)
        let card2 = LuckyCard(number: .eight, animal: .🐱, state: .back)
        let card3 = LuckyCard(number: .eight, animal: .🐶, state: .back)
        
        XCTAssertTrue(card1.number == card2.number && card2.number == card3.number)
    }
}
