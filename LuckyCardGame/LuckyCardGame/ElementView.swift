import UIKit

final class ElementView: UIView {
    
    var alphabet: String
    var target: Int
    
    init(_ target: Int) {
        self.target = target
        self.alphabet = String(UnicodeScalar(target + 65)!)
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.backgroundColor = .systemGray5
        self.layer.cornerRadius = 10
        self.addSubview(makeElement(alphabet))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeElement(_ alphabet: String) -> UILabel {
        let label = UILabel()
        label.text = alphabet
        label.font = UIFont(name: "AvenirNext-BoldItalic", size: 40)
        label.layer.opacity = 0.5

        label.textColor = .systemGray2
        return label
    }
    
    func reFrame(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        self.frame = CGRect(x: x, y: y + CGFloat(target)*(ConstantSize.padding + height) , width: width, height:   height)
    }
}
