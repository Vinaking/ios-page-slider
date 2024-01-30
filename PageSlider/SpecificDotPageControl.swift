//
//  SpecificDotPageControl.swift
//  PageSlider
//
//  Created by Tùng on 24/01/2024.
//

import UIKit

public class SpecificDotPageControl: UIPageControl {
    
    var currentPageChanged: ((Int)->())?
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            guard let subview = self.subviews.first else {
                return
            }
            let touchPoint = touch.location(in: subview)
            let dotSize = subview.bounds.size.width / CGFloat(numberOfPages)
            let jumpToPage = touchPoint.x / dotSize
            self.currentPage = Int(jumpToPage)
            self.currentPageChanged?(currentPage)
        }
        
    }
}
