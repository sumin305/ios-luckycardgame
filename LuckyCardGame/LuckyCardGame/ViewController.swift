import UIKit

class ViewController: UIViewController {

    let yellowView : UIView = {
        let yView = UIView()
        yView.backgroundColor = .yellow
        yView.frame = CGRect(x: 20, y: 70, width: 353, height: 44)
        yView.layer.cornerRadius = 10
        return yView
    }()
    
    let middleView : UIView = {
        let mView = UIView()
        for i in 0...4 {
            mView.addSubview(SubView(i))
        }
        return mView
    }()
    
    let grayView : UIView = {
        let gView = UIView()
        gView.backgroundColor = .gray
        gView.frame = CGRect(x: 20, y: 650, width: 353, height: 130)
        gView.layer.cornerRadius = 10
        return gView
    }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
    }
    
    func addSubViews() {
        view.addSubview(yellowView)
        view.addSubview(middleView)
        view.addSubview(grayView)
    }
}

class SubView: UIView {
    
    var alphabet: String
    
    init(_ target: Int) {
        
        self.alphabet = String(UnicodeScalar(target + 65)!)
        super.init(frame: CGRect(x: 20, y: target * 100 + 150, width: 353, height: 90))
        self.backgroundColor = .systemGray5
        self.layer.cornerRadius = 10
        self.addSubview(makeAlphabet(alphabet))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeAlphabet(_ alphabet: String) -> UILabel {
        let label = UILabel()
        label.textAlignment = .left
        label.text = alphabet
        label.font = label.font.boldItalic()
        label.layer.opacity = 0.5
        label.frame = CGRect(x: 10, y: 0, width: 100, height: 100)
        label.textColor = .systemGray2
        return label
        
    }
    
}
extension UIFont {
    func withTraits(traits:UIFontDescriptor.SymbolicTraits...) -> UIFont? {
        guard let descriptorL = self.fontDescriptor.withSymbolicTraits(UIFontDescriptor.SymbolicTraits(traits)) else{
            return nil
        }
        return UIFont(descriptor: descriptorL, size: 40)
    }

    func boldItalic() -> UIFont? {
        return withTraits(traits: .traitBold, .traitItalic)
    }
}
