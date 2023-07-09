import Foundation
import UIKit

final class CardView: UIView {
    let card: LuckyCard
    
    init(card: LuckyCard, index: Int, cardCount: Int) {
        self.card = card
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        frame =  CGRect(x: ConstantSize.padding * CGFloat(index * 3), y: ConstantSize.padding, width: 40, height: 80)
        backgroundColor = .white
        layer.cornerRadius = ConstantSize.cornerRadiusDegree
        switch card.state {
        case .front: makeFrontCardView()
        case .back: makeBackCardView()
        }
        
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeFrontCardView()  {
        let numberLabel1 : UILabel = {
            let label = UILabel()
            label.text = String(card.number.rawValue)
            label.font = .boldSystemFont(ofSize: 10)
            label.frame =  CGRect(x: 5, y: 5 , width: 15, height: 15)
            return label
        }()
        let numberLabel2 : UILabel = {
            let label = UILabel()
            label.text = String(card.number.rawValue)
            label.font = .boldSystemFont(ofSize: 10)
            label.frame =  CGRect(x: self.bounds.width-15, y: self.bounds.height-15 , width: 15, height: 15)
            return label
        }()
        let animalLabel: UILabel = {
            let label = UILabel()
            label.text = card.animal.rawValue
            label.font = .boldSystemFont(ofSize: 30)
            label.frame =  CGRect(x: self.bounds.width/2-15, y: self.bounds.height/2-15 , width: 35, height: 35)
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
                label.frame =  CGRect(x: self.bounds.width/2-15, y: self.bounds.height/2-15 , width: 35, height: 35)
                return label
            }()
            self.addSubview(backLabel)
        }
}
