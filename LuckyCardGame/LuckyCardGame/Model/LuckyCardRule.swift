struct LuckyCardRule {
    
    private(set) var playerCount: Int = 3
    private(set) var playerCardCount: Int = 8
    private(set) var bottomCardCount: Int = 9
    private(set) var exceptNumber: LuckyCard.Number? = .twelve
    
    mutating func setRule(playerCount: Int) {
        switch playerCount {
        case 3:
            playerCardCount = 8
            bottomCardCount = 9
            exceptNumber = LuckyCard.Number.twelve
        case 4:
            playerCardCount = 7
            bottomCardCount = 8
            exceptNumber = nil
        default:
            playerCardCount = 6
            bottomCardCount = 6
            exceptNumber = nil
        }
        self.playerCount = playerCount
    }
}
