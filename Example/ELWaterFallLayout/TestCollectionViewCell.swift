//
//  TestCollectionViewCell.swift
//  WaterFlow
//
//  Created by 金秋成 on 2017/2/17.
//  Copyright © 2017年 金秋成. All rights reserved.
//

import UIKit

class TestCollectionViewCell: UICollectionViewCell {
    var titleLabel : UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel = UILabel(frame: frame)
        titleLabel.textColor = UIColor.black
//        titleLabel.text = "title"
        self.addSubview(titleLabel)
        
        
        let red = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
        let green = CGFloat( arc4random_uniform(255))/CGFloat(255.0)
        let blue = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
        let colorRun = UIColor.init(red:red, green:green, blue:blue , alpha: 1)

        self.backgroundColor = colorRun
    }
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    
    
    
    
    
}

