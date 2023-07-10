import UIKit

final class ViewController: UIViewController {
    
    private let game = LuckyGame.shared
    
    // segmentTitles을 활용하기 위해 lazy var 사용
    private lazy var segmentControl = UISegmentedControl(items: segmentTitles)
    private let middleView = UIView()
    private let grayView = UIView()
    private let segmentTitles: [String] = ["3명", "4명", "5명"]
    private var playerRange = [Int](0...2)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurateUI()
        addSubViews()
        printAnimalCards()
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        setFrame(playerCount: game.rule.playerCount)
    }
    
    private func configurateUI() {
        segmentControl.backgroundColor = .systemGray5
        segmentControl.tintColor = .white
        segmentControl.addTarget(self, action: #selector(segmentControllChanged(segcon:)), for: UIControl.Event.valueChanged)
        playerRange.forEach { player in
            middleView.addSubview(ElementView(5, player))
        }
        grayView.backgroundColor = .gray
        grayView.layer.cornerRadius = ConstantSize.cornerRadiusDegree
    }
    
    private func addSubViews() {
        view.addSubview(segmentControl)
        view.addSubview(middleView)
        view.addSubview(grayView)
    }
    
    private func setFrame(playerCount: Int) {
       
        ConstantSize.topSafeArea = view.safeAreaInsets.top
        ConstantSize.bottomSafeArea = view.safeAreaInsets.bottom
        ConstantSize.nonSafeArea = ConstantSize.totalHeight - ConstantSize.topSafeArea - ConstantSize.bottomSafeArea
        
        let elementViewFrameHeight = ConstantSize.elementViewFrameHeight
        let grayFrameHeight = ConstantSize.grayFrameHeight
        
        segmentControl.frame = CGRect(x: ConstantSize.padding, y:  view.safeAreaInsets.top + ConstantSize.padding , width: ConstantSize.subViewWidth , height:  ConstantSize.yellowViewHeight)
        grayView.frame = CGRect(x: ConstantSize.padding, y: view.safeAreaInsets.top + ConstantSize.yellowViewHeight + elementViewFrameHeight * 4 + 6*ConstantSize.padding, width: ConstantSize.subViewWidth, height: 2*(ConstantSize.nonSafeArea - 9*ConstantSize.padding -  ConstantSize.yellowViewHeight - elementViewFrameHeight*5))
        
        middleView.frame = CGRect(x: ConstantSize.padding, y: view.safeAreaInsets.top + 2*ConstantSize.padding +  ConstantSize.yellowViewHeight, width: ConstantSize.subViewWidth, height: elementViewFrameHeight * 5 + 2*ConstantSize.padding)
        
        for view in middleView.subviews {
            (view as? ElementView)!.reFrame(x: 0, y: 0, width: ConstantSize.subViewWidth, height: elementViewFrameHeight)
        }

        if playerCount == 5 {
            grayView.frame = CGRect(x: ConstantSize.padding, y: view.safeAreaInsets.top +  ConstantSize.yellowViewHeight + elementViewFrameHeight * 5 + 7*ConstantSize.padding, width: ConstantSize.subViewWidth, height: grayFrameHeight)
        }
    }
    
    private func removeSubView() {
        middleView.subviews.forEach({$0.removeFromSuperview()})
        grayView.subviews.forEach({$0.removeFromSuperview()})
    }
    
    private func setViewBySegmentController(playerCount: Int) {
        removeSubView()
        for i in 0...playerCount-1 {
            middleView.addSubview(ElementView(playerCount, i))
        }
        for j in 0..<game.bottom.owningCards.count {
            grayView.addSubview(CardView(card: game.bottom.owningCards[j], index: j, cardCount: game.bottom.owningCards.count, isPlayer: false))
        }
        setFrame(playerCount: playerCount)
    }
    
    @objc func segmentControllChanged(segcon: UISegmentedControl) {
        let index = segmentControl.selectedSegmentIndex
        let playerCount = index + 3
        switch index {
        case 0:
            game.rule.playerCount = playerCount
        case 1:
            game.rule.playerCount = playerCount
        case 2:
            game.rule.playerCount = playerCount
        default: return
        }
        game.setRule(playerCount: playerCount)
        setViewBySegmentController(playerCount: playerCount)
    }
    
    // 미션2 출력 구현
    private func printAnimalCards() {
        game.deck.makeAllShuffledCards()
        game.deck.printAllCards()
    }
}
