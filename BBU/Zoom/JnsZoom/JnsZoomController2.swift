//
//  JnsZoomController2.swift
//  BBU
//
//  Created by Wilfredo Lopez on 8/17/15.
//  Copyright (c) 2015 DynmK. All rights reserved.
//

import Foundation
import UIKit

class JnsZoomController2 : UIViewController {
    
    @IBOutlet var scrollView : UIScrollView!
    @IBOutlet var jnsImageView2 : UIImageView!
    
    var jsonextrct : JsonExtrct!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageData2 = jsonextrct.imageData2 {
            
            jnsImageView2.image = UIImage(data: imageData2)

        }
        
        scrollView.contentSize = jnsImageView2.frame.size
        
    }
    
    
    @IBAction func closeZoom(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion:nil)
        
    }
}

