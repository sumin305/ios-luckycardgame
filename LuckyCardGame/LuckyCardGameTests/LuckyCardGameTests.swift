import XCTest
@testable import LuckyCardGame

final class LuckyCardGameTests: XCTestCase {
    
    var game: LuckyGame!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        game = LuckyGame()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        try testCardDistribute(playerCount: 3)
        try testAllPlayerCanSort(playerCount: 3)
//        try testAllPlayerCanSort(playerCount: 3)
//        try testAllPlayerCanSort(playerCount: 4)
//        try testAllPlayerCanSort(playerCount: 5)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testCardDistribute(playerCount: Int) throws {
        game.setRule(playerCount: playerCount)
        print(game.rule.playerCount, playerCount)
        XCTAssertTrue(game.playerArray.allSatisfy({$0.cardCount == game.rule.playerCardCount}))
        XCTAssertTrue(game.bottom.cardCount == game.rule.bottomCardCount)
    }
    
    func testAllPlayerCanSort(playerCount: Int) throws {
        game.setRule(playerCount: playerCount)
        for i in 0..<playerCount {
            game.playerArray[i].sortOwningCards()
            XCTAssertEqual(game.playerArray[i].owningCards, game.playerArray[i].owningCards.sorted())
        }
    }
}
