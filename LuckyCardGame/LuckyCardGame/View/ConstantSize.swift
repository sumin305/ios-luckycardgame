import UIKit

enum ConstantSize {
    static let subViewWidth: CGFloat = totalWidth - 2*padding
    static let totalHeight: CGFloat = UIScreen.main.bounds.height
    static let totalWidth: CGFloat = UIScreen.main.bounds.width
    static var topSafeArea: CGFloat = 0
    static var bottomSafeArea: CGFloat = 0
    static var nonSafeArea: CGFloat = 0
    static let padding: CGFloat = totalWidth / 30
    static let cornerRadiusDegree: CGFloat = 5
    static let yellowViewHeight: CGFloat = 44
    static let elementViewFrameHeight = (ConstantSize.nonSafeArea - 3*ConstantSize.padding - ConstantSize.yellowViewHeight) / CGFloat(7)
    static let grayFrameHeight = ConstantSize.nonSafeArea
                            - (ConstantSize.padding)*9
                            - (ConstantSize.yellowViewHeight)
                            - elementViewFrameHeight*5

}
