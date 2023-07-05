import UIKit

final class ViewController: UIViewController {
    
    private let yellowView : UIView = {
        let yView = UIView()
        yView.backgroundColor = .yellow
        yView.layer.cornerRadius = 10
        return yView
    }()
    
    private let middleView : UIView = {
        let mView = UIView()
        [Int](0...4).forEach{
            mView.addSubview(AlphabetView($0))
        }
        return mView
    }()
    
    private let grayView : UIView = {
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
        super.viewDidAppear(true)
        setFrame()
    }
    
    private func addSubViews() {
        view.addSubview(yellowView)
        view.addSubview(middleView)
        view.addSubview(grayView)
    }
    
    private func setFrame() {
        let yellowFrameHeight: CGFloat = 44
        let nonSafeArea = ConstantSize.totalHeight - (view.safeAreaInsets.top) - (view.safeAreaInsets.bottom)
        let alphabetViewFrameHeight = (nonSafeArea - 3*ConstantSize.padding - yellowFrameHeight) / CGFloat(7)
        let grayFrameHeight = nonSafeArea - 9*ConstantSize.padding - yellowFrameHeight - alphabetViewFrameHeight*5
        let subViewWidth = ConstantSize.totalWidth - 2*ConstantSize.padding
        
        yellowView.frame = CGRect(x: ConstantSize.padding, y:  view.safeAreaInsets.top + ConstantSize.padding , width: subViewWidth , height: CGFloat(yellowFrameHeight))
        grayView.frame = CGRect(x: ConstantSize.padding, y: view.safeAreaInsets.top + CGFloat(yellowFrameHeight) + alphabetViewFrameHeight * 5 + 7*ConstantSize.padding, width: subViewWidth, height: grayFrameHeight)
        middleView.frame = CGRect(x: ConstantSize.padding, y: view.safeAreaInsets.top + 2*ConstantSize.padding + CGFloat(yellowFrameHeight), width: subViewWidth, height: alphabetViewFrameHeight * 5 + 2*ConstantSize.padding)
        for view in middleView.subviews {
            (view as? AlphabetView)!.reFrame(x: 0, y: 0, width: subViewWidth, height: alphabetViewFrameHeight)
        }
    }
}
