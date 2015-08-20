//
//  ContactoViewController.swift
//  BBU
//
//  Created by Wilfredo Lopez on 8/18/15.
//  Copyright (c) 2015 DynmK. All rights reserved.
//

import Foundation

import UIKit

class ContactoViewController : UIViewController {
    
    @IBOutlet weak var menuContacto: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuContacto.target = self.revealViewController()
            menuContacto.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
        title = "Contacto"
        
    }
}