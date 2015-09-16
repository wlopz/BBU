//
//  LeggingsJson.swift
//  BBU
//
//  Created by Wilfredo Lopez on 8/11/15.
//  Copyright (c) 2015 DynmK. All rights reserved.
//

import Foundation

class LeggingsJson {
    
    func loadLeggings(completion: ([JsonExtrct] -> Void)?) {
        
        var urlString = "http://bonbonup.x10host.com/json/leggingslst.json"
        
        let session = NSURLSession.sharedSession()
        let leggingsUrl = NSURL(string: urlString)
        //let leggingsUrl = NSURL(scheme: "http", host: "wlodsgn.x10host.com", path: "/json/leggingslst.json")
        
        var task = session.dataTaskWithURL(leggingsUrl!){
            (data, response, error) -> Void in
            
            if error != nil {
                println(error.localizedDescription)
            } else {
                
                var error : NSError?
                
                var leggingsData = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: &error) as! NSArray
                
                var leggings = [JsonExtrct]()
                
                for leggingsextrct in leggingsData{
                    let leggingsextrct = JsonExtrct(data: leggingsextrct as! NSDictionary)
                    leggings.append(leggingsextrct)
                }
                
                let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                dispatch_async(dispatch_get_global_queue(priority, 0)) {
                    dispatch_async(dispatch_get_main_queue()) {
                        completion?(leggings)
                    }
                }
                
            }
        }
        
        task.resume()
    }
    
}
