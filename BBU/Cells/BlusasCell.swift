//
//  BlusasCell.swift
//  BBU
//
//  Created by Wilfredo Lopez on 8/11/15.
//  Copyright (c) 2015 DynmK. All rights reserved.
//

import Foundation
import UIKit


class BlusasCell: UICollectionViewCell {
    
    @IBOutlet var coverImageView : UIImageView!
    @IBOutlet var titleLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.textColor = UIColor.redColor()
        titleLabel.font = UIFont(name: mTheme.fontName, size: 14)
        
        coverImageView.layer.borderColor = UIColor.redColor().CGColor
        coverImageView.layer.borderWidth = 0.5
    }
}