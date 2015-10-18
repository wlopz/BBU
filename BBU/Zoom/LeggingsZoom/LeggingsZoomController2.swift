//
//  LeggingsZoomController2.swift
//  BBU
//
//  Created by Wilfredo Lopez on 8/18/15.
//  Copyright (c) 2015 DynmK. All rights reserved.
//

import Foundation
import UIKit

class LeggingsZoomController2 : UIViewController {
    
    @IBOutlet var scrollView : UIScrollView!
    @IBOutlet var leggingsImageView2 : UIImageView!
    
    var jsonextrct : JsonExtrct!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageData2 = jsonextrct.imageData2 {
        
        leggingsImageView2.image = UIImage(data: imageData2)
        }
        
        scrollView.contentSize = leggingsImageView2.frame.size
        
    }
    
    
    @IBAction func closeZoom(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion:nil)
        
    }
}

