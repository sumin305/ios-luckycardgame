import UIKit

final class ElementView: UIView {
    
    private var playerCount: Int = 3
    private var playerIndex: Int = 0
    private var manager = LuckyCardGameManager.shared
    
    init(_ count: Int, _ index: Int) {
        playerCount = count
        playerIndex = index
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        backgroundColor = .systemGray5
        layer.cornerRadius = 10
        tag = 2
        self.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        makeElement()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
    func reFrame(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        self.frame = CGRect(x: x, y: y + CGFloat(playerIndex)*(ConstantSize.padding + height) , width: width, height:  height)
    }
    private func makeElement() {
             let player = manager.playerArray[playerIndex]
             if playerIndex == 0 {
                 player.owningCards.forEach({$0.reverseCard()})
             }
             for j in 0..<player.owningCards.count {
                 self.addSubview(CardView(card: player.owningCards[j], index: j, cardCount: player.owningCards.count))
         }
     }
}

