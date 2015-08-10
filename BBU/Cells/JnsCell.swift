//
//  JnsCell.swift
//  BBU
//
//  Created by Wilfredo Lopez on 8/8/15.
//  Copyright (c) 2015 DynmK. All rights reserved.
//

import Foundation
import UIKit


class JnsCell: UICollectionViewCell {
    
    @IBOutlet var coverImageView : UIImageView!
    //@IBOutlet var nameLabel : UILabel!
    @IBOutlet var titleLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //nameLabel.textColor = UIColor.blackColor()
        //nameLabel.font = UIFont(name: MTheme.fontName, size: 14)
        
        titleLabel.textColor = UIColor(white: 0.45, alpha: 1.0)
        titleLabel.font = UIFont(name: mTheme.fontName, size: 11)
        
        coverImageView.layer.borderColor = UIColor(white: 0.2, alpha: 1.0).CGColor
        coverImageView.layer.borderWidth = 0.5
    }
}
