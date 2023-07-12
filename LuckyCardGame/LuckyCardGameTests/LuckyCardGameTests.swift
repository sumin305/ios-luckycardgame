import XCTest
@testable import LuckyCardGame

final class LuckyCardGameTests: XCTestCase {
    
    let sut = LuckyGame()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws { }

    func testExample() throws {
        try testLuckyGame(playerCount: 3)
    }
    
    func testLuckyGame(playerCount: Int) throws {
        try testCardDistribute(playerCount: playerCount)
        for playerIndex in 0..<playerCount {
            try testPlayerCanSort(playerIndex: playerIndex)
            try testHaveSameNumberInOwningCards(playerIndex: playerIndex)
        }
        try testBottomCanSort()
        try testHaveSameNumberInGame()
    }
    
    func testCardDistribute(playerCount: Int) throws {
        sut.rule.setRule(playerCount: playerCount)
        sut.makeDeckDistribute(playerCount: playerCount)
        XCTAssertTrue(sut.playerArray.allSatisfy({$0.cardCount == sut.rule.playerCardCount}))
        XCTAssertTrue(sut.bottom.cardCount == sut.rule.bottomCardCount)
    }
    
    func testBottomCanSort() throws {
        sut.bottom.sortOwningCards()
        XCTAssertEqual(sut.bottom.owningCards, sut.bottom.owningCards.sorted())
    }
    
    func testPlayerCanSort(playerIndex: Int) throws {
        sut.playerArray[playerIndex].sortOwningCards()
        XCTAssertEqual(sut.playerArray[playerIndex].owningCards, sut.playerArray[playerIndex].owningCards.sorted())
    }


    func testHaveSameNumberInOwningCards(playerIndex: Int) throws {
        var sameThreeNumberCard = false
        let cardArray = sut.playerArray[playerIndex].owningCards
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
            XCTAssertTrue(sameThreeNumberCard)
        }
    }
    
    func testHaveSameNumberInGame() throws {
        let card1 = LuckyCard(number: .eight, animal: .🐮, state: .back)
        let card2 = LuckyCard(number: .eight, animal: .🐱, state: .back)
        let card3 = LuckyCard(number: .eight, animal: .🐶, state: .back)
        
        XCTAssertTrue(card1.number == card2.number && card2.number == card3.number)
    }
}
