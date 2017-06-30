//
//  SSSheetViewController.swift
//  SSSheetLayout
//
//  Created by Macbook on 6/30/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import SSSheetLayout

class SSSheetViewController: UIViewController, SSSheetLayoutDataSource, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    private let cellName = "SLSheetCell"
    private var model = SSDrugModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func register() {
        collectionView.register(UINib(nibName: cellName, bundle: nil), forCellWithReuseIdentifier: cellName)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return model.drugs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.drugs[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellName, for: indexPath) as! SLSheetCell
        cell.updateContent(value: model.drugs[indexPath.section][indexPath.row])
        if indexPath.row == 0 {
            cell.updateLeftDockState()
        } else if indexPath.section == 0 {
            cell.updateTopDockState()
        } else {
            cell.updateCellState(indexPath: indexPath)
        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, sizeForItem indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: 100, height: 30)
        }
        return CGSize(width: 50, height: 30)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.keepDockOffset()
    }
    
}
