//
//  SLSheetLayout.swift
//  SLSheetLayout
//
//  Created by Macbook on 6/29/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import UIKit

@objc protocol SSSheetLayoutDataSource: class {
    
    func collectionView(collectionView: UICollectionView, sizeForItem indexPath: IndexPath) -> CGSize
    
}

class SSSheetLayout: UICollectionViewLayout {
    
    #if TARGET_INTERFACE_BUILDER
    @IBOutlet open weak var dataSource: AnyObject?
    #else
    open weak var dataSource: SSSheetLayoutDataSource?
    #endif
    
    private var contentSize: CGSize = CGSize.zero
    private var itemAttributes: [[UICollectionViewLayoutAttributes]]?
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func prepare() {
        if collectionView?.numberOfSections == 0 {
            return
        }
        guard let itemAttributes = itemAttributes, !itemAttributes.isEmpty else {
            prepareLayoutAttributes()
            return
        }
        guard let collectionView = collectionView else {
            return
        }
        let numOfSection = collectionView.numberOfSections
        for section in 0 ..< numOfSection {
            let numOfItem = collectionView.numberOfItems(inSection: section)
            for item in 0 ..< numOfItem {
                if section != 0 && item != 0 {
                    continue
                }
                let indexPath = IndexPath(item: item, section: section)
                if let attributes = layoutAttributesForItem(at: indexPath) {
                    var frame = attributes.frame
                    if section == 0 {
                        frame.origin.y = collectionView.contentOffset.y
                    }
                    if item == 0 {
                        frame.origin.x = collectionView.contentOffset.x
                    }
                    attributes.frame = frame
                }
            }
        }
    }
    
    private func prepareLayoutAttributes() {
        var column: Int = 0
        var xOffset: CGFloat = 0.0
        var yOffset: CGFloat = 0.0
        var contentWidth: CGFloat = 0.0
        var contentHeight: CGFloat = 0.0
        
        guard let collectionView = collectionView else {
            return
        }
        let numOfSection = collectionView.numberOfSections
        for section in 0 ..< numOfSection {
            var sectionAttributes = [UICollectionViewLayoutAttributes]()
            let numOfItem = collectionView.numberOfItems(inSection: section)
            for item in 0 ..< numOfItem {
                
                let indexPath = IndexPath(item: item, section: section)
                var itemSize: CGSize {
                    if let size = dataSource?.collectionView(collectionView: collectionView, sizeForItem: indexPath) {
                        return size
                    }
                    return CGSize.zero
                }
                let itemAttibute = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                itemAttibute.frame = CGRect(x: xOffset, y: yOffset, width: itemSize.width, height: itemSize.height).integral
                if section == 0 && item == 0 {
                    itemAttibute.zIndex = 1024
                } else if section == 0 || item == 0 {
                    itemAttibute.zIndex = 1023
                }
                
                var frame = itemAttibute.frame
                if section == 0 {
                    frame.origin.y = collectionView.contentOffset.y
                }
                if item == 0 {
                    frame.origin.x = collectionView.contentOffset.x
                }
                itemAttibute.frame = frame
                sectionAttributes.append(itemAttibute)
                
                xOffset = xOffset + itemSize.width
                column = column + 1
                if column == numOfItem {
                    if xOffset > contentWidth {
                        contentWidth = xOffset
                    }
                    column = 0
                    xOffset = 0
                    yOffset = yOffset + itemSize.height
                }
            }
            
            if itemAttributes == nil {
                itemAttributes = [[UICollectionViewLayoutAttributes]]()
            }
            itemAttributes?.append(sectionAttributes)
        }
        
        if let lastAttributes = itemAttributes?.last?.last {
            contentHeight = lastAttributes.frame.origin.y + lastAttributes.frame.size.height
            contentSize = CGSize(width: contentWidth, height: contentHeight)
        }
    }
    
    override var collectionViewContentSize: CGSize {
        return contentSize
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let itemAttributes = itemAttributes else {
            return nil
        }
        if itemAttributes.count > indexPath.section {
            let sectionAttributes = itemAttributes[indexPath.section]
            if sectionAttributes.count > indexPath.row {
                return sectionAttributes[indexPath.row]
            }
        }
        return nil
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributes: [UICollectionViewLayoutAttributes]?
        guard let itemAttributes = itemAttributes else {
            return attributes
        }
        attributes = [UICollectionViewLayoutAttributes]()
        for sectionAttributes in itemAttributes {
            for itemAttribute in sectionAttributes {
                if rect.intersects(itemAttribute.frame) {
                    attributes?.append(itemAttribute)
                }
            }
        }
        return attributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
}
