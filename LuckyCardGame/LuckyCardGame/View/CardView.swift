import Foundation
import UIKit

final class CardView: UIView {
    
    private let card: LuckyCard
    
    enum Size {
        static let cardPadding: CGFloat = 5
        static let cardWidth: CGFloat = (ConstantSize.subViewWidth - 2*cardPadding) / 6
        static let cardHeight: CGFloat = ConstantSize.elementViewFrameHeight - 2*cardPadding
        static let borderWidth: CGFloat = 1
        static let fontSize: CGFloat = 15
    }
    
    init(card: LuckyCard, index: Int, cardCount: Int, isPlayer: Bool) {
        self.card = card
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        switch card.state {
            case .front: makeFrontCardView()
            case .back: makeBackCardView()
        }
        configureUI()
        setFrame(index: index, cardCount: cardCount, isPlayer: isPlayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        backgroundColor = .white
        layer.cornerRadius = ConstantSize.cornerRadiusDegree
        layer.borderWidth = Size.borderWidth
        layer.borderColor = UIColor.black.cgColor
    }
    
    // cardCount, isPlayer에 따른 frame 설정 메서드
    private func setFrame(index: Int, cardCount: Int, isPlayer: Bool) {
        // Player View일 경우
        if isPlayer {
            let interval = (ConstantSize.subViewWidth - 2*Size.cardPadding - CGFloat(cardCount)*Size.cardWidth)/CGFloat(cardCount-1)
            frame =  CGRect(x: Size.cardPadding + CGFloat(index) * (Size.cardWidth + interval), y: Size.cardPadding, width: Size.cardWidth, height: Size.cardHeight)
        }
        // 마당패인 경우
        else {
            switch cardCount {
            case 9:
                let widthInterval = (ConstantSize.subViewWidth - 5*Size.cardWidth) / 6
                let heightInterval = (ConstantSize.longGrayFrameHeight - 2*Size.cardHeight) / 3
                let xIndex = index < 5 ? index : index - 5
                frame = CGRect(x: widthInterval + (widthInterval + Size.cardWidth) * CGFloat(xIndex), y: index < 5 ? heightInterval : heightInterval*2 + Size.cardHeight, width: Size.cardWidth, height: Size.cardHeight)
            case 8:
                let widthInterval = (ConstantSize.subViewWidth - 4*Size.cardWidth) / 5
                let heightInterval = (ConstantSize.longGrayFrameHeight - 2*Size.cardHeight) / 3
                let xIndex = index < 4 ? index : index - 4
                frame = CGRect(x: widthInterval + (widthInterval + Size.cardWidth) * CGFloat(xIndex), y: index < 4 ? heightInterval : heightInterval*2 + Size.cardHeight, width: Size.cardWidth, height: Size.cardHeight)
            case 6:
                let interval = (ConstantSize.subViewWidth - 2*Size.cardPadding - CGFloat(cardCount)*Size.cardWidth)/CGFloat(cardCount-1)
                frame = CGRect(x: Size.cardPadding + CGFloat(index) * (Size.cardWidth + interval), y: (ConstantSize.grayFrameHeight - Size.cardHeight)/2, width: Size.cardWidth, height: Size.cardHeight)
            default: return
            }
        }
    }
    
    private func makeFrontCardView()  {
        let topNumberLabel : UILabel = {
            let label = UILabel()
            label.text = String(card.number.rawValue)
            label.font = UIFont(name: "AvenirNext-Bold", size: Size.fontSize)
            label.frame =  CGRect(x: Size.cardPadding, y: Size.cardPadding , width: Size.fontSize+Size.cardPadding, height: Size.fontSize+Size.cardPadding)
            return label
        }()
        let bottomNumberLabel : UILabel = {
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
        self.addSubview(topNumberLabel)
        self.addSubview(bottomNumberLabel)
        self.addSubview(animalLabel)
    }
    
    private func makeBackCardView() {
        let backLabel: UIImageView = {
            let label = UIImageView()
            label.image = UIImage(named: "clover")
            label.frame =  CGRect(x: Size.cardWidth/2-Size.fontSize, y: Size.cardHeight/2-Size.fontSize , width: Size.fontSize*2, height: Size.fontSize*2)
            return label
        }()
        self.addSubview(backLabel)
    }
}
