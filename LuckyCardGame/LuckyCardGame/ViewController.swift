import UIKit

final class ViewController: UIViewController {
    
    private let yellowView = UIView()
    private let middleView = UIView()
    private let grayView = UIView()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        configurateUI()
        addSubViews()
        printAnimalCards()
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        setFrame()
    }
    
    private func configurateUI() {
        yellowView.backgroundColor = .yellow
        yellowView.layer.cornerRadius = ConstantSize.cornerRadiusDegree
        [Int](0...4).forEach{
            middleView.addSubview(AlphabetView($0))
        }
        grayView.backgroundColor = .gray
        grayView.layer.cornerRadius = ConstantSize.cornerRadiusDegree
    }
    
    private func addSubViews() {
        view.addSubview(yellowView)
        view.addSubview(middleView)
        view.addSubview(grayView)
    }
    
    private func setFrame() {
        let nonSafeArea = ConstantSize.totalHeight - (view.safeAreaInsets.top) - (view.safeAreaInsets.bottom)
        let alphabetViewFrameHeight = (nonSafeArea - 3*ConstantSize.padding - ConstantSize.yellowViewHeight) / CGFloat(7)
        let grayFrameHeight = nonSafeArea - 9*ConstantSize.padding -  ConstantSize.yellowViewHeight - alphabetViewFrameHeight*5
        let subViewWidth = ConstantSize.totalWidth - 2*ConstantSize.padding
        
        yellowView.frame = CGRect(x: ConstantSize.padding, y:  view.safeAreaInsets.top + ConstantSize.padding , width: subViewWidth , height:  ConstantSize.yellowViewHeight)
        grayView.frame = CGRect(x: ConstantSize.padding, y: view.safeAreaInsets.top +  ConstantSize.yellowViewHeight + alphabetViewFrameHeight * 5 + 7*ConstantSize.padding, width: subViewWidth, height: grayFrameHeight)
        middleView.frame = CGRect(x: ConstantSize.padding, y: view.safeAreaInsets.top + 2*ConstantSize.padding +  ConstantSize.yellowViewHeight, width: subViewWidth, height: alphabetViewFrameHeight * 5 + 2*ConstantSize.padding)
        for view in middleView.subviews {
            (view as? AlphabetView)!.reFrame(x: 0, y: 0, width: subViewWidth, height: alphabetViewFrameHeight)
        }
    }
    
    private func printAnimalCards() {
        var cm = CardManager()
        cm.makeAllCards()
        cm.printCards()
    }
}
