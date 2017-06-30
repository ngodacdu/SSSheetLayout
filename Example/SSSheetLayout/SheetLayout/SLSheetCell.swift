//
//  SLSheetCell.swift
//  SLSheetLayout
//
//  Created by Macbook on 6/29/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import UIKit

class SLSheetCell: UICollectionViewCell {

    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        valueLabel.text = nil
        backgroundColor = UIColor.white
        valueLabel.textColor = UIColor.black
    }
    
    func updateContent(value: String?) {
        valueLabel.text = value
    }
    
    func updateTopDockState() {
        backgroundColor = UIColor(
            red: 41/255.0,
            green: 56/255.0,
            blue: 74/255.0,
            alpha: 1.0
        )
        valueLabel.textColor = UIColor.white
    }
    
    func updateLeftDockState() {
        backgroundColor = UIColor(
            red: 41/255.0,
            green: 56/255.0,
            blue: 74/255.0,
            alpha: 1.0
        )
        valueLabel.textColor = UIColor.white
    }
    
    func updateCellState(indexPath: IndexPath) {
        if indexPath.section % 2 == 0 {
            backgroundColor = UIColor.groupTableViewBackground
        } else {
            backgroundColor = UIColor.white
        }
    }

}
