//
//  LaunchViewController.swift
//  Bon Bon Up
//
//  Created by Wilfredo Lopez on 9/22/15.
//  Copyright (c) 2015 DynmK. All rights reserved.
//

import Foundation

import UIKit

class LaunchViewController : UIViewController {
    
    @IBOutlet weak var verButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        verButton.layer.borderColor = UIColor.redColor().CGColor
        verButton.layer.cornerRadius = 5
        verButton.layer.borderWidth = 1
        
        verButton.layer.shadowColor = UIColor.grayColor().CGColor
        verButton.layer.shadowOffset = CGSizeMake(5, 5)
        verButton.layer.shadowRadius = 5
        verButton.layer.shadowOpacity = 1.0
        
    }

}