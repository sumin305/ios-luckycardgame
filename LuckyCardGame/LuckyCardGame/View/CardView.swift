import Foundation
import UIKit

final class CardView: UIView {
    let card: LuckyCard
    
    init(card: LuckyCard, index: Int) {
        self.card = card
        super.init(frame: CGRect(x: 20, y: 20, width: 20, height: 20))
        self.frame =  CGRect(x: ConstantSize.padding, y: ConstantSize.padding, width: 20, height: 20)
        makeNumberView(index: index)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeNumberView(index: Int)  {
        let numberLabel1 : UILabel = {
            let label = UILabel()
            label.text = String(card.number.rawValue)
            label.frame =  CGRect(x: ConstantSize.padding * CGFloat(index * 2), y: ConstantSize.padding , width: 20, height: 20)
            return label
        }()
        self.addSubview(numberLabel1)
       
    }
}
