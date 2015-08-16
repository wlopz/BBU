//
//  BlusasZoomController.swift
//  BBU
//
//  Created by Wilfredo Lopez on 8/15/15.
//  Copyright (c) 2015 DynmK. All rights reserved.
//

import Foundation
import UIKit

class BlusasZoomController : UIViewController {
    
    @IBOutlet var scrollView : UIScrollView!
    @IBOutlet var blusasImageView : UIImageView!
    //@IBOutlet var blusasImageView2 : UIImageView!
    //@IBOutlet var blusasImageView3 : UIImageView!
    
    var jsonextrct : JsonExtrct!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageData = jsonextrct.imageData {
            
            let image = UIImage(data: imageData)
            blusasImageView.image = UIImage(data: imageData)
            //jnsImageView.bounds = CGRectMake(0, 0, image?.size.width, image?.size.height);
        }
        
        //if let imageData2 = jsonextrct.imageData2 {
            
            //let image2 = UIImage(data: imageData2)
            //blusasImageView2.image = UIImage(data: imageData2)
            //jnsImageView2.bounds = CGRectMake(0, 0, image?.size.width, image?.size.height);
        //}
        
        //if let imageData3 = jsonextrct.imageData3 {
            
            //let image3 = UIImage(data: imageData3)
            //blusasImageView3.image = UIImage(data: imageData3)
            //jnsImageView3.bounds = CGRectMake(0, 0, image?.size.width, image?.size.height);
        //}
        
        scrollView.contentSize = blusasImageView.frame.size
        //scrollView.contentSize = blusasImageView2.frame.size
        //scrollView.contentSize = blusasImageView3.frame.size
        
    }
    
    
    @IBAction func closeZoom(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion:nil)
        
    }
}

