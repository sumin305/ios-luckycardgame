import UIKit

final class ViewController: UIViewController {
    
    // segmentTitles을 활용하기 위해 lazy var 사용
    private lazy var segmentControl = UISegmentedControl(items: segmentTitles)
    private let middleView = UIView()
    private let grayView = UIView()
    private let segmentTitles: [String] = ["3명", "4명", "5명"]
    private var elementArray = [Int](0...4)
    
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
        segmentControl.backgroundColor = .systemGray5
        segmentControl.tintColor = .white
        segmentControl.addTarget(self, action: #selector(segmentControllChanged(segcon:)), for: UIControl.Event.valueChanged)
        elementArray.forEach{
            middleView.addSubview(ElementView($0))
        }
        grayView.backgroundColor = .gray
        grayView.layer.cornerRadius = ConstantSize.cornerRadiusDegree
    }
    
    private func addSubViews() {
        view.addSubview(segmentControl)
        view.addSubview(middleView)
        view.addSubview(grayView)
    }
    
    private func setFrame() {
        let nonSafeArea = ConstantSize.totalHeight - (view.safeAreaInsets.top) - (view.safeAreaInsets.bottom)
        let alphabetViewFrameHeight = (nonSafeArea - 3*ConstantSize.padding - ConstantSize.yellowViewHeight) / CGFloat(7)
        let grayFrameHeight = nonSafeArea - 9*ConstantSize.padding -  ConstantSize.yellowViewHeight - alphabetViewFrameHeight*5
        let subViewWidth = ConstantSize.totalWidth - 2*ConstantSize.padding
        
        segmentControl.frame = CGRect(x: ConstantSize.padding, y:  view.safeAreaInsets.top + ConstantSize.padding , width: subViewWidth , height:  ConstantSize.yellowViewHeight)
        grayView.frame = CGRect(x: ConstantSize.padding, y: view.safeAreaInsets.top +  ConstantSize.yellowViewHeight + alphabetViewFrameHeight * 5 + 7*ConstantSize.padding, width: subViewWidth, height: grayFrameHeight)
        middleView.frame = CGRect(x: ConstantSize.padding, y: view.safeAreaInsets.top + 2*ConstantSize.padding +  ConstantSize.yellowViewHeight, width: subViewWidth, height: alphabetViewFrameHeight * 5 + 2*ConstantSize.padding)
        for view in middleView.subviews {
            (view as? ElementView)!.reFrame(x: 0, y: 0, width: subViewWidth, height: alphabetViewFrameHeight)
        }
    }
    
    @objc func segmentControllChanged(segcon: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            LuckyCardGameManager.shared.participantsCount = 3
        case 1:
            LuckyCardGameManager.shared.participantsCount = 4
        case 2:
            LuckyCardGameManager.shared.participantsCount = 5
        default: return
        }
        
        configurateUI()
        setFrame()
    }
    
    // 미션2 출력 구현
    private func printAnimalCards() {
        LuckyCardDeck.shared.makeAllShuffledCards()
        LuckyCardDeck.shared.printAllCards()
    }
}
