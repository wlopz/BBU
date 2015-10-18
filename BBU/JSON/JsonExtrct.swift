//
//  JsonExtrct.swift
//  BBU
//
//  Created by Wilfredo Lopez on 8/8/15.
//  Copyright (c) 2015 DynmK. All rights reserved.
//

import Foundation

class JsonExtrct {
    
    var titulo : String!
    var imageUrl : String!
    var imageData : NSData?
    var imageUrl2 : String!
    var imageData2 : NSData?
    var imageUrl3 : String!
    var imageData3 : NSData?
    var marca : String!
    var color : String!
    var tipo : String!
    var ref : Int!
    
    init(data : NSDictionary) {
        
        self.titulo = Utils.getStringFromJSON(data, key: "titulo")
        
        if let imageUrl = data["image"] as? String {
            self.imageUrl = imageUrl
        }
        
        if let imageUrl2 = data["image2"] as? String {
            self.imageUrl2 = imageUrl2
        }
        
        if let imageUrl3 = data["image3"] as? String {
            self.imageUrl3 = imageUrl3
        }
        
        self.marca = Utils.getStringFromJSON(data, key: "marca")
        
        self.color = Utils.getStringFromJSON(data, key: "color")
        
        self.tipo = Utils.getStringFromJSON(data, key: "tipo")
        
        self.ref = data["ref"] as? Int
        
    }
    
}

