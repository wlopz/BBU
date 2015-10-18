//
//  JnsZoomController3.swift
//  BBU
//
//  Created by Wilfredo Lopez on 8/17/15.
//  Copyright (c) 2015 DynmK. All rights reserved.
//

import Foundation
import UIKit

class JnsZoomController3 : UIViewController {
    
    @IBOutlet var scrollView : UIScrollView!
    @IBOutlet var jnsImageView3 : UIImageView!
    
    var jsonextrct : JsonExtrct!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageData3 = jsonextrct.imageData3 {
            
            jnsImageView3.image = UIImage(data: imageData3)
    
        }
        
        scrollView.contentSize = jnsImageView3.frame.size
        
    }
    
    
    @IBAction func closeZoom(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion:nil)
        
    }
}

