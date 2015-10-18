//
//  JnsZoomController.swift
//  BBU
//
//  Created by Wilfredo Lopez on 8/15/15.
//  Copyright (c) 2015 DynmK. All rights reserved.
//

import Foundation
import UIKit

class JnsZoomController : UIViewController {
    
    @IBOutlet var scrollView : UIScrollView!
    @IBOutlet var jnsImageView : UIImageView!
    
    var jsonextrct : JsonExtrct!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageData = jsonextrct.imageData {
            
            jnsImageView.image = UIImage(data: imageData)
    
        }
        
        scrollView.contentSize = jnsImageView.frame.size
        
    }
    
    
    @IBAction func closeZoom(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion:nil)
        
    }
}
