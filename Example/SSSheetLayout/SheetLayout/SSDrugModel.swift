//
//  SSPopularManager.swift
//  SSSheetLayout
//
//  Created by Macbook on 6/30/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation

class SSDrugModel {
    
    private var drugCategorys = [
        "ENBREL", "HUMIRA", "TYSABRI", "DIANEAL", "AVONEX",
        "REMICADE", "AVANDIA", "FORTEO", "MIRENA", "PHARMICS",
        "LILLY", "ORGANON", "LILLY", "MYLAN", "ORGANON",
        "MERCK", "ILLY", "PARKE DAVIS", "ISO TEX", "GD LLC",
        "POYTHRESS", "SCHERING", "NOVARTIS", "PARKE DAVIS", "US PHARM",
        "ROCHE", "PARKEDALE", "LILLY", "LEDERLE", "BRISTOL M"
    ]
    
    var drugs = [[String]]()
    
    init() {
        prepare()
    }
    
    private func prepare() {
        let topBar = [
            "Name|Year", "2000", "2001", "2002", "2003",
            "2004", "2005", "2006", "2007", "2008",
            "2009", "2010", "2011", "2012", "2013",
            "2014", "2015", "2016", "2017"
        ]
        drugs.append(topBar)
        for category in drugCategorys {
            var drugObject = [String]()
            for index in 0 ..< topBar.count {
                if index == 0 {
                    drugObject.append(category)
                } else {
                    let value = arc4random_uniform(5000) + 3000 // for 3000...5000
                    drugObject.append("\(value)")
                }
            }
            drugs.append(drugObject)
        }
    }
    
}
