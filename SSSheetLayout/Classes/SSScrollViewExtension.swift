//
//  SSScrollViewExtension.swift
//  Pods
//
//  Created by Macbook on 6/30/17.
//
//

import Foundation

public extension UIScrollView {
    
    func keepDockOffset() {
        if contentOffset.x < 0 {
            contentOffset.x = 0
        }
        if contentOffset.y < 0 {
            contentOffset.y = 0
        }
        if contentOffset.x > (contentSize.width - frame.width) {
            contentOffset.x = contentSize.width - frame.width
        }
        if contentOffset.y > (contentSize.height - frame.height) {
            contentOffset.y = contentSize.height - frame.height
        }
    }
    
}
