//
//  JnsJson.swift
//  BBU
//
//  Created by Wilfredo Lopez on 8/8/15.
//  Copyright (c) 2015 DynmK. All rights reserved.
//

import Foundation

class JnsJson {
    
    func loadJns(completion: ([JsonExtrct] -> Void)?) {
        
        let urlString = "http://bonbonup.x10host.com/json/jnslst.json"
        
        let session = NSURLSession.sharedSession()
        let jnsUrl = NSURL(string: urlString)
        
        let task = session.dataTaskWithURL(jnsUrl!){
            (data, response, error) -> Void in
            
            if error != nil {
                print(error!.localizedDescription)
            } else {
                
                let jnsData = (try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)) as! NSArray
                
                var jns = [JsonExtrct]()
                
                for jnsextrct in jnsData{
                    let jnsextrct = JsonExtrct(data: jnsextrct as! NSDictionary)
                    jns.append(jnsextrct)
                }
                
                let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                dispatch_async(dispatch_get_global_queue(priority, 0)) {
                    dispatch_async(dispatch_get_main_queue()) {
                        completion?(jns)
                    }
                }
                
            }
        }
        
        task.resume()
    }
    
}
