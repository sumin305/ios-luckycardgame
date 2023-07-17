import UIKit

final class ElementView: UIView {
 
    init(player: LuckyCardPlayer, playerIndex: Int) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        configurateUI()
        setFrame(playerIndex: playerIndex)
        makePlayerCardView(player: player, playerIndex: playerIndex)
    }
    
    init(bottom: BottomPlayer) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        backgroundColor = .gray
        configurateUI()
        makeBottomCardView(bottom: bottom)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configurateUI() {
        backgroundColor = .systemGray5
        layer.cornerRadius = ConstantSize.cornerRadiusDegree
    }
    
    private func setFrame(playerIndex: Int) {
        frame = CGRect(x: 0, y: CGFloat(playerIndex)*(ConstantSize.padding + ConstantSize.elementViewFrameHeight), width: ConstantSize.subViewWidth, height: ConstantSize.elementViewFrameHeight)
    }
    
    // player의 CardView 생성
    private func makePlayerCardView(player: LuckyCardPlayer, playerIndex: Int) {
        if playerIndex == 0 {
            player.owningCards.forEach({$0.reverseCard()})
            player.sortOwningCards()
        }
        for j in 0..<player.owningCards.count {
            self.addSubview(CardView(card: player.owningCards[j], index: j, cardCount: player.owningCards.count, isPlayer: true))
        }
    }
    // 마당패의 CardView 생성
    private func makeBottomCardView(bottom: BottomPlayer) {
        for j in 0..<bottom.owningCards.count {
            self.addSubview(CardView(card: bottom.owningCards[j], index: j, cardCount: bottom.owningCards.count, isPlayer: false))
        }
    }
}

