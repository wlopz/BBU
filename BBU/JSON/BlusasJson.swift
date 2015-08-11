//
//  BlusasJson.swift
//  BBU
//
//  Created by Wilfredo Lopez on 8/11/15.
//  Copyright (c) 2015 DynmK. All rights reserved.
//

import Foundation

class BlusasJson {
    
    func loadBlusas(completion: ([JsonExtrct] -> Void)?) {
        
        var urlString = "http://wlodsgn.x10host.com/json/blusaslst.json"
        
        let session = NSURLSession.sharedSession()
        let blusasUrl = NSURL(string: urlString)
        //let blusasUrl = NSURL(scheme: "http", host: "wlodsgn.x10host.com", path: "/json/blusaslst.json")
        
        var task = session.dataTaskWithURL(blusasUrl!){
            (data, response, error) -> Void in
            
            if error != nil {
                println(error.localizedDescription)
            } else {
                
                var error : NSError?
                
                var blusasData = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: &error) as! NSArray
                
                var blusas = [JsonExtrct]()
                
                for blusasextrct in blusasData{
                    let blusasextrct = JsonExtrct(data: blusasextrct as! NSDictionary)
                    blusas.append(blusasextrct)
                }
                
                let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                dispatch_async(dispatch_get_global_queue(priority, 0)) {
                    dispatch_async(dispatch_get_main_queue()) {
                        completion?(blusas)
                    }
                }
                
            }
        }
        
        task.resume()
    }
    
}