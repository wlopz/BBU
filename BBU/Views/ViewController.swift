//
//  ViewController.swift
//  BBU
//
//  Created by Wilfredo Lopez on 8/8/15.
//  Copyright (c) 2015 DynmK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let json = JnsJson()
        json.loadJns(nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

