import UIKit

final class LuckyGameViewController: UIViewController {
    
    // LuckyGame 객체 유일한 생성
    private let game = LuckyGame()
    private var gameView: LuckyGameView {
        view as! LuckyGameView
    }
    
    override func loadView() {
        super.loadView()
        view = LuckyGameView(controller: self, playerCount: game.rule.playerCount, playerArray: game.playerArray, bottom: game.bottom)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        gameView.addTargetToSegmentControl(self, #selector(segmentControllChanged(_:)), for: .valueChanged)
        
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        setSafeAreaSize()
        
        gameView.setFrame(playerCount: game.rule.playerCount)
        // UI 초기화
    }
    
    private func setSafeAreaSize() {
        // SafeAreaInsets이 바뀔 때마다 계산 후 frame 설정
        ConstantSize.topSafeArea = view.safeAreaInsets.top
        ConstantSize.bottomSafeArea = view.safeAreaInsets.bottom
    }
    
    @objc func segmentControllChanged(_: UISegmentedControl) {
        let playerCount = gameView.segmentControl.selectedSegmentIndex + 3
        
        // model 작업 - 게임 카드 비율 변경 후 나눠주기
        game.setRule(playerCount: playerCount)
        game.makeDeckDistribute(playerCount: playerCount)
        
        // view 작업 - 화면 게임 카드 비율에 맞게 다시 그리기
        gameView.setViewBySegmentController(playerArray: game.playerArray, bottom: game.bottom)
    }
}
