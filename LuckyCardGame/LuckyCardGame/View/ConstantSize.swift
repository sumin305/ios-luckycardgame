import UIKit

enum ConstantSize {
    static var topSafeArea: CGFloat = 0
    static var bottomSafeArea: CGFloat = 0
    static var nonSafeArea: CGFloat = 0
    
    static let totalHeight: CGFloat = UIScreen.main.bounds.height
    static let totalWidth: CGFloat = UIScreen.main.bounds.width

    static let padding: CGFloat = totalWidth / 30
    static let cornerRadiusDegree: CGFloat = 5
    
    static let subViewWidth: CGFloat = totalWidth - 2*padding
    static let yellowViewHeight: CGFloat = 44
    static let elementViewFrameHeight = (ConstantSize.nonSafeArea - 3*ConstantSize.padding - ConstantSize.yellowViewHeight) / CGFloat(7)
    static let grayFrameHeight = ConstantSize.nonSafeArea
                            - (ConstantSize.padding)*9
                            - (ConstantSize.yellowViewHeight)
                            - elementViewFrameHeight*5
    static let longGrayFrameHeight = 2*(ConstantSize.nonSafeArea - 9*ConstantSize.padding -  ConstantSize.yellowViewHeight - elementViewFrameHeight*5)
}
