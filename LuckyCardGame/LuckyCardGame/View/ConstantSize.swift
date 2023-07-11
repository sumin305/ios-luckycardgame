import UIKit

enum ConstantSize {
    
    // safe area
    static var topSafeArea: CGFloat = 0
    static var bottomSafeArea: CGFloat = 0
    static var nonSafeArea: CGFloat = ConstantSize.totalHeight - ConstantSize.topSafeArea - ConstantSize.bottomSafeArea
    
    // total size
    static let totalHeight: CGFloat = UIScreen.main.bounds.height
    static let totalWidth: CGFloat = UIScreen.main.bounds.width

    // ui setting
    static let padding: CGFloat = totalWidth / 30
    static let cornerRadiusDegree: CGFloat = 5
    
    // width
    static let subViewWidth: CGFloat = totalWidth - 2*padding
    
    // height
    static let segmentHeight: CGFloat = 44
    static let elementViewFrameHeight = (ConstantSize.nonSafeArea - 3*ConstantSize.padding - ConstantSize.segmentHeight) / CGFloat(7)
    static let grayFrameHeight = ConstantSize.nonSafeArea
                            - (ConstantSize.padding)*9
                            - (ConstantSize.segmentHeight)
                            - elementViewFrameHeight*5
    static let longGrayFrameHeight = 2*(ConstantSize.nonSafeArea - 9*ConstantSize.padding -  ConstantSize.segmentHeight - elementViewFrameHeight*5)
}
