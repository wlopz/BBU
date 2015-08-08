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
    
    class func getStringFromJSON(data: NSDictionary, key: String) -> String{
        
        //let info : AnyObject? = data[key]
        
        if let info = data[key] as? String {
            return info
        }
        return ""
    }
    
}
