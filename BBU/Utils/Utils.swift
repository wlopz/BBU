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
    
    class func asyncLoadJsonImage(jsonextrct: JsonExtrct, imageView : UIImageView){
        
        let downloadQueue = dispatch_queue_create("com.Img.processsdownload", nil)
        
        dispatch_async(downloadQueue) {
            
            let data = NSData(contentsOfURL: NSURL(string: jsonextrct.imageUrl)!)
            
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
    
    class func asyncLoadJsonImage(jsonextrct: JsonExtrct, imageView2 : UIImageView){
        
        let downloadQueue = dispatch_queue_create("com.Img2.processsdownload", nil)
        
        dispatch_async(downloadQueue) {
            
            let data = NSData(contentsOfURL: NSURL(string: jsonextrct.imageUrl2)!)
            
            var image2 : UIImage?
            if data != nil {
                jsonextrct.imageData2 = data
                image2 = UIImage(data: data!)!
            }
            
            dispatch_async(dispatch_get_main_queue()) {
                imageView2.image = image2
            }
        }
    }
    
    class func asyncLoadJsonImage(jsonextrct: JsonExtrct, imageView3 : UIImageView){
        
        let downloadQueue = dispatch_queue_create("com.Img3.processsdownload", nil)
        
        dispatch_async(downloadQueue) {
            
            let data = NSData(contentsOfURL: NSURL(string: jsonextrct.imageUrl3)!)
            
            var image3 : UIImage?
            if data != nil {
                jsonextrct.imageData3 = data
                image3 = UIImage(data: data!)!
            }
            
            dispatch_async(dispatch_get_main_queue()) {
                imageView3.image = image3
            }
        }
    }
    
    class func getStringFromJSON(data: NSDictionary, key: String) -> String{
        
        if let info = data[key] as? String {
            return info
        }
        return ""
    }
    
}
