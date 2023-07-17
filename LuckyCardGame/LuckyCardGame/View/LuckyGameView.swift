import UIKit

final class LuckyGameView: UIView {
    let segmentControl: UISegmentedControl = UISegmentedControl(items: ["3명", "4명", "5명"])
    private let middleView = UIView()
    private var bottomView: ElementView!
    private var controller: LuckyGameViewController
    private var playerCount: Int
    private var playerArray: [LuckyCardPlayer]
    private var bottom: BottomPlayer
    
    init(controller: LuckyGameViewController, frame: CGRect, playerCount: Int, playerArray: [LuckyCardPlayer], bottom: BottomPlayer) {
        self.controller = controller
        self.playerCount = playerCount
        self.playerArray = playerArray
        self.bottom = bottom
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        setSubViews()
        configurateUI()
        addSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setSubViews() {
        for playerIndex in 0..<playerCount {
            middleView.addSubview(ElementView(player: playerArray[playerIndex], playerIndex: playerIndex))
        }
        bottomView = ElementView(bottom: bottom)
    }
    
    private func configurateUI() {
        segmentControl.selectedSegmentIndex = 0
        segmentControl.backgroundColor = .systemGray5
        segmentControl.tintColor = .white
        bottomView.backgroundColor = .gray
    }
    
    private func addSubViews() {
        self.addSubview(segmentControl)
        self.addSubview(middleView)
        self.addSubview(bottomView)
    }
    
    func setFrame(playerCount: Int) {
        segmentControl.frame = CGRect(x: ConstantSize.padding, y:  ConstantSize.topSafeArea + ConstantSize.padding , width: ConstantSize.subViewWidth , height:  ConstantSize.segmentHeight)
        bottomView.frame = CGRect(x: ConstantSize.padding, y: ConstantSize.topSafeArea + ConstantSize.segmentHeight + ConstantSize.elementViewFrameHeight * 4 + 6*ConstantSize.padding, width: ConstantSize.subViewWidth, height: 2*(ConstantSize.nonSafeArea - 9*ConstantSize.padding -  ConstantSize.segmentHeight - ConstantSize.elementViewFrameHeight*5))
        
        middleView.frame = CGRect(x: ConstantSize.padding, y: ConstantSize.topSafeArea + 2*ConstantSize.padding +  ConstantSize.segmentHeight, width: ConstantSize.subViewWidth, height: ConstantSize.elementViewFrameHeight * 5 + 2*ConstantSize.padding)
        
        if playerCount == 5 {
            bottomView.frame = CGRect(x: ConstantSize.padding, y: ConstantSize.topSafeArea +  ConstantSize.segmentHeight + ConstantSize.elementViewFrameHeight * 5 + 7*ConstantSize.padding, width: ConstantSize.subViewWidth, height: ConstantSize.grayFrameHeight)
        }
    }
    
       // middleView, bottomView 초기화
       private func removeSubView() {
           middleView.subviews.forEach({$0.removeFromSuperview()})
           bottomView.subviews.forEach({$0.removeFromSuperview()})
       }
       
       // middleView, bottomView 하위 뷰들 지우고 다시 add해서 그리기
    func setViewBySegmentController(playerCount: Int, playerArray: [LuckyCardPlayer], bottom: BottomPlayer) {
            self.playerCount = playerCount
           removeSubView()
           for i in 0..<playerArray.count {
               middleView.addSubview(ElementView(player: playerArray[i], playerIndex: i))
           }
           for j in 0..<bottom.owningCards.count {
               bottomView.addSubview(CardView(card: bottom.owningCards[j], index: j, cardCount: bottom.owningCards.count, isPlayer: false))
           }
           setFrame(playerCount: playerCount)
       }
}

extension LuckyGameView {
    func addTargetToSegmentControl(_ target: Any, _ selector: Selector, for controlEvent: UIControl.Event) {
        segmentControl.addTarget(target, action: selector, for: controlEvent)
    }
}
