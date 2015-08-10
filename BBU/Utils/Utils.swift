//
//  Utils.swift
//  BBU
//
//  Created by Wilfredo Lopez on 8/8/15.
//  Copyright (c) 2015 DynmK. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    
    class func asyncLoadShotImage(jsonextrct: JsonExtrct, imageView : UIImageView){
        
        let downloadQueue = dispatch_queue_create("com.Jns.processsdownload", nil)
        
        dispatch_async(downloadQueue) {
            
            var data = NSData(contentsOfURL: NSURL(string: jsonextrct.imageUrl)!)
            
            var image : UIImage?
            if data != nil {
                jsonextrct.imageData = data
                image = UIImage(data: data!)!
            }
            
            dispatch_async(dispatch_get_main_queue()) {
                imageView.image = image
            }
        }
    }
    
    class func getStringFromJSON(data: NSDictionary, key: String) -> String{
        
        let info : AnyObject? = data[key]
        
        if let info = data[key] as? String {
            return info
        }
        return ""
    }
    
}
