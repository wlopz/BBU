//
//  BlusasDetail.swift
//  BBU
//
//  Created by Wilfredo Lopez on 8/13/15.
//  Copyright (c) 2015 DynmK. All rights reserved.
//

import Foundation
import UIKit

class BlusasDetail: UIViewController {
    
    @IBOutlet var tituloLabel : UILabel!
    @IBOutlet var marcaLabel : UILabel!
    @IBOutlet var colorLabel : UILabel!
    @IBOutlet var tipoLabel : UILabel!
    @IBOutlet var refLabel : UILabel!
    
    @IBOutlet var imageView : UIImageView!
    
    @IBOutlet var backbutton : UIButton!
    
    var jsonextrct : JsonExtrct!
    
    var photos : [String]!
    
    var transitionOperator = TransitionOperator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tituloLabel.font = UIFont(name: mTheme.fontName, size: 28)
        tituloLabel.textColor = UIColor.redColor()
        tituloLabel.text = jsonextrct.titulo
        
        marcaLabel.font = UIFont(name: mTheme.fontName, size: 18)
        marcaLabel.textColor = UIColor.redColor()
        marcaLabel.text = jsonextrct.marca
        
        colorLabel.font = UIFont(name: mTheme.fontName, size: 18)
        colorLabel.textColor = UIColor.redColor()
        colorLabel.text = jsonextrct.color
        
        tipoLabel.font = UIFont(name: mTheme.fontName, size: 18)
        tipoLabel.textColor = UIColor.redColor()
        tipoLabel.text = jsonextrct.tipo
        
        refLabel.font = UIFont(name: mTheme.fontName, size: 18)
        refLabel.textColor = UIColor.redColor()
        refLabel.text = "\(jsonextrct.ref)"
        
        if let imageData = jsonextrct.imageData {
            imageView.image = UIImage(data: imageData)
        }else{
            Utils.asyncLoadJsonImage(jsonextrct, imageView: imageView)
        }
        
        imageView.layer.borderColor = UIColor.redColor().CGColor
        imageView.layer.borderWidth = 0.5
        
        let tapGestureZoom = UITapGestureRecognizer(target: self, action: "zoomBlusas:")
        tapGestureZoom.numberOfTapsRequired = 1
        tapGestureZoom.numberOfTouchesRequired = 1
        imageView.userInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureZoom)
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.Default
    }
    
    func backTapped(sender: AnyObject?){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func zoomBlusas(sender: AnyObject?){
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewControllerWithIdentifier("BlusasZoomController") as! BlusasZoomController
    self.modalPresentationStyle = UIModalPresentationStyle.Custom
    controller.transitioningDelegate = transitionOperator
    controller.jsonextrct = jsonextrct
    
    presentViewController(controller, animated: true, completion: nil)
    }
    
}
