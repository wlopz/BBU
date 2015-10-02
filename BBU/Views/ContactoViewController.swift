//
//  ContactoViewController.swift
//  BBU
//
//  Created by Wilfredo Lopez on 8/18/15.
//  Copyright (c) 2015 DynmK. All rights reserved.
//

import UIKit

import MessageUI

class ContactoViewController : UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var menuContacto: UIBarButtonItem!
    @IBOutlet weak var asuntoContacto: UITextField!
    @IBOutlet weak var bodyContacto: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuContacto.target = self.revealViewController()
            menuContacto.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
        title = "Contacto"
        
    }
    
    @IBAction func enviarContacto(sender: AnyObject) {
        
        var asuntoText = ""
        asuntoText += asuntoContacto.text
        
        var mensajeBody = bodyContacto
        
        var toRecipients = ["bonbonup@hotmail.com"]
        
        var mc: MFMailComposeViewController = MFMailComposeViewController()
        mc.mailComposeDelegate = self
            mc.setSubject(asuntoText)
            mc.setMessageBody(mensajeBody.text, isHTML: false)
            mc.setToRecipients(toRecipients)
        
        self.presentViewController(mc, animated: true, completion: nil)
        
    }
    
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        
        switch result.value{
            
            case MFMailComposeResultCancelled.value:
                NSLog("Correo Cancelado")
            case MFMailComposeResultSaved.value:
                NSLog("Correo Salvado")
            case MFMailComposeResultSent.value:
                NSLog("Correo Enviado")
            case MFMailComposeResultFailed.value:
                NSLog("Correo Enviado Fallo: %@", [error.localizedDescription])
            default:
                break
            
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
}