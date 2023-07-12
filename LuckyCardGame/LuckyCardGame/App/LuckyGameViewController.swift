import UIKit

final class LuckyGameViewController: UIViewController {
    
    // LuckyGame 객체 유일한 생성
    private let game = LuckyGame()
    
    private var playerCount:  Int!
    private var segmentControl: UISegmentedControl!
    private var middleView: UIView!
    private var bottomView: ElementView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        // SafeAreaInsets이 바뀔 때마다 계산 후 frame 설정
        ConstantSize.topSafeArea = view.safeAreaInsets.top
        ConstantSize.bottomSafeArea = view.safeAreaInsets.bottom
        // 프로퍼티 초기화
        
        middleView = UIView()
        bottomView = ElementView(bottom: game.bottom)
        segmentControl = UISegmentedControl(items: ["3명", "4명", "5명"])
        playerCount = 3
        
        // UI 초기화
        configurateUI()
        addSubViews()
        setFrame(playerCount: playerCount)
    }
    
    private func configurateUI() {
        segmentControl.backgroundColor = .systemGray5
        segmentControl.tintColor = .white
        segmentControl.addTarget(self, action: #selector(self.segmentControllChanged(_: )), for: UIControl.Event.valueChanged)
        segmentControl.selectedSegmentIndex = 0
        bottomView.backgroundColor = .gray
        for playerIndex in 0..<playerCount {
            middleView.addSubview(ElementView(player: game.playerArray[playerIndex], playerIndex: playerIndex))
        }
    }
    
    private func addSubViews() {
        view.addSubview(segmentControl)
        view.addSubview(middleView)
        view.addSubview(bottomView)
    }
    
    func setFrame(playerCount: Int) {
        segmentControl.frame = CGRect(x: ConstantSize.padding, y:  view.safeAreaInsets.top + ConstantSize.padding , width: ConstantSize.subViewWidth , height:  ConstantSize.segmentHeight)
        bottomView.frame = CGRect(x: ConstantSize.padding, y: view.safeAreaInsets.top + ConstantSize.segmentHeight + ConstantSize.elementViewFrameHeight * 4 + 6*ConstantSize.padding, width: ConstantSize.subViewWidth, height: 2*(ConstantSize.nonSafeArea - 9*ConstantSize.padding -  ConstantSize.segmentHeight - ConstantSize.elementViewFrameHeight*5))
        
        middleView.frame = CGRect(x: ConstantSize.padding, y: view.safeAreaInsets.top + 2*ConstantSize.padding +  ConstantSize.segmentHeight, width: ConstantSize.subViewWidth, height: ConstantSize.elementViewFrameHeight * 5 + 2*ConstantSize.padding)
        
        if playerCount == 5 {
            bottomView.frame = CGRect(x: ConstantSize.padding, y: view.safeAreaInsets.top +  ConstantSize.segmentHeight + ConstantSize.elementViewFrameHeight * 5 + 7*ConstantSize.padding, width: ConstantSize.subViewWidth, height: ConstantSize.grayFrameHeight)
        }
    }
    
    @objc func segmentControllChanged(_: UISegmentedControl) {
        playerCount = segmentControl.selectedSegmentIndex + 3
        
        // model 작업 - 게임 카드 비율 변경 후 나눠주기
        game.rule.setRule(playerCount: playerCount)
        game.makeDeckDistribute(playerCount: playerCount)
        
        // view 작업 - 화면 게임 카드 비율에 맞게 다시 그리기
        setViewBySegmentController(playerCount: playerCount)
    }
  
    // middleView, bottomView 초기화
    private func removeSubView() {
        middleView.subviews.forEach({$0.removeFromSuperview()})
        bottomView.subviews.forEach({$0.removeFromSuperview()})
    }
    
    // middleView, bottomView 하위 뷰들 지우고 다시 add해서 그리기
    private func setViewBySegmentController(playerCount: Int) {
        removeSubView()
        for i in 0..<playerCount {
            middleView.addSubview(ElementView(player: game.playerArray[i], playerIndex: i))
        }
        for j in 0..<game.bottom.owningCards.count {
            bottomView.addSubview(CardView(card: game.bottom.owningCards[j], index: j, cardCount: game.bottom.owningCards.count, isPlayer: false))
        }
        setFrame(playerCount: playerCount)
    }
   
    
}
