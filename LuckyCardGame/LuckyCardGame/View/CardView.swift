import Foundation
import UIKit

final class CardView: UIView {
    let card: LuckyCard
    
    enum Size {
        static let cardPadding: CGFloat = 5
        static let cardWidth: CGFloat = (ConstantSize.subViewWidth - 2*cardPadding) / 6
        static let cardHeight: CGFloat = ConstantSize.elementViewFrameHeight - 2*cardPadding
        static let borderWidth: CGFloat = 1
        static let fontSize: CGFloat = 15
    }
    
    init(card: LuckyCard, index: Int, cardCount: Int) {
        self.card = card
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        setFrame(index: index, cardCount: cardCount)
        switch card.state {
        case .front: makeFrontCardView()
        case .back: makeBackCardView()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setFrame(index: Int, cardCount: Int) {
        let interval = (ConstantSize.subViewWidth - 2*Size.cardPadding - CGFloat(cardCount)*Size.cardWidth)/CGFloat(cardCount-1)
        frame =  CGRect(x: Size.cardPadding + CGFloat(index) * (Size.cardWidth + interval), y: Size.cardPadding, width: Size.cardWidth, height: Size.cardHeight)
        backgroundColor = .white
        layer.cornerRadius = ConstantSize.cornerRadiusDegree
        layer.borderWidth = Size.borderWidth
        layer.borderColor = UIColor.black.cgColor
    }
    
    private func makeFrontCardView()  {
        let numberLabel1 : UILabel = {
            let label = UILabel()
            label.text = String(card.number.rawValue)
            label.font = UIFont(name: "AvenirNext-Bold", size: Size.fontSize)
            label.frame =  CGRect(x: Size.cardPadding, y: Size.cardPadding , width: Size.fontSize+Size.cardPadding, height: Size.fontSize+Size.cardPadding)
            return label
        }()
        let numberLabel2 : UILabel = {
            let label = UILabel()
            label.text = String(card.number.rawValue)
            label.font = UIFont(name: "AvenirNext-Bold", size: Size.fontSize)
            label.frame =  CGRect(x: card.number.rawValue < 10 ? Size.cardWidth - (Size.fontSize*2 - Size.cardPadding) + Size.cardPadding*2: Size.cardWidth - (Size.fontSize*2 - Size.cardPadding), y: Size.cardHeight - (Size.fontSize*2 - Size.cardPadding) + Size.cardPadding, width: Size.fontSize+Size.cardPadding, height: Size.fontSize+Size.cardPadding)
            return label
            
        }()
        let animalLabel: UILabel = {
            let label = UILabel()
            label.text = card.animal.rawValue
            label.font = UIFont(name: "AvenirNext-Bold", size: Size.fontSize * 2)
            label.frame =  CGRect(x: Size.cardWidth/2-Size.fontSize, y: Size.cardHeight/2-Size.fontSize , width: Size.fontSize * 2 + Size.cardPadding, height: Size.fontSize * 2 + Size.cardPadding)
            return label
        }()
        self.addSubview(numberLabel1)
        self.addSubview(numberLabel2)
        self.addSubview(animalLabel)
    }
    
    private func makeBackCardView() {
        let backLabel: UIImageView = {
            let label = UIImageView()
            label.image = UIImage(named: "clover")
            label.frame =  CGRect(x: self.bounds.width/2-15, y: self.bounds.height/2-15 , width: 30, height: 30)
            return label
        }()
        self.addSubview(backLabel)
    }
}
