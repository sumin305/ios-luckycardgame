import UIKit

let totalHeight = UIScreen.main.bounds.height
let totalWidth = UIScreen.main.bounds.width
let padding = totalWidth / 30

class ViewController: UIViewController {
    
    let yellowView : UIView = {
        let yView = UIView()
        yView.backgroundColor = .yellow
        yView.layer.cornerRadius = 10
        return yView
    }()
    
    let middleView : UIView = {
        let mView = UIView()
        [Int](0...4).forEach{
            mView.addSubview(AlphabetView($0))
        }
        return mView
    }()
    
    let grayView : UIView = {
        let gView = UIView()
        gView.backgroundColor = .gray
        gView.layer.cornerRadius = 10
        return gView
    }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let yellowFrameHeight = 44
        let subViewFrameHeight = (totalHeight
                            - view.safeAreaInsets.top
                            - view.safeAreaInsets.bottom
                            - 3*padding
                            - 44) / 7
        
        yellowView.frame = CGRect(x: padding, y:  view.safeAreaInsets.top + padding , width: totalWidth - 2*padding , height: CGFloat(yellowFrameHeight))
        grayView.frame = CGRect(x: padding, y: totalHeight - view.safeAreaInsets.bottom - 2*padding - (subViewFrameHeight + 20), width: totalWidth - 2*padding, height: subViewFrameHeight + 2*padding)
        middleView.frame = CGRect(x: padding, y: view.safeAreaInsets.top + 2*padding + CGFloat(yellowFrameHeight), width: totalWidth - 2*padding, height: subViewFrameHeight * 6 + 2*padding)
        for view in middleView.subviews {
            (view as? AlphabetView)!.reFrame(x: 0, y: 0, width: totalWidth - 2*padding, height: subViewFrameHeight)
        }
    }
    
    func addSubViews() {
        view.addSubview(yellowView)
        view.addSubview(middleView)
        view.addSubview(grayView)
    }
}

class AlphabetView: UIView {
    
    var alphabet: String
    var target: Int
    
    init(_ target: Int) {
        self.target = target
        self.alphabet = String(UnicodeScalar(target + 65)!)
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.backgroundColor = .systemGray5
        self.layer.cornerRadius = 10
        self.addSubview(makeAlphabet(alphabet))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeAlphabet(_ alphabet: String) -> UILabel {
        let label = UILabel()
        label.text = alphabet
        label.font = UIFont(name: "AvenirNext-BoldItalic", size: 40)
        label.layer.opacity = 0.5
        label.frame = CGRect(x: padding, y: 25, width: 50, height: 50)
        label.textColor = .systemGray2
        return label
    }
    
    func reFrame(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        self.frame = CGRect(x: x, y: y + CGFloat(target)*(padding + height) , width: width, height:   height)
    }
}
