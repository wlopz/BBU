//
//  LeggingsDetail.swift
//  BBU
//
//  Created by Wilfredo Lopez on 8/13/15.
//  Copyright (c) 2015 DynmK. All rights reserved.
//

import Foundation
import UIKit

class LeggingsDetail: UIViewController {
    
    @IBOutlet var tituloLabel : UILabel!
    @IBOutlet var marcaLabel : UILabel!
    @IBOutlet var colorLabel : UILabel!
    @IBOutlet var tipoLabel : UILabel!
    @IBOutlet var refLabel : UILabel!
    
    @IBOutlet var imageView : UIImageView!
    @IBOutlet var imageView2 : UIImageView!
    @IBOutlet var imageView3 : UIImageView!
    
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
        
        if let imageData2 = jsonextrct.imageData2 {
            imageView2.image = UIImage(data: imageData2)
        }else{
            Utils.asyncLoadJsonImage(jsonextrct, imageView2: imageView2)
        }
        
        imageView2.layer.borderColor = UIColor.redColor().CGColor
        imageView2.layer.borderWidth = 0.5
        
        if let imageData3 = jsonextrct.imageData3 {
            imageView3.image = UIImage(data: imageData3)
        }else{
            Utils.asyncLoadJsonImage(jsonextrct, imageView3: imageView3)
        }
        
        imageView3.layer.borderColor = UIColor.redColor().CGColor
        imageView3.layer.borderWidth = 0.5
        
        let tapGestureZoom = UITapGestureRecognizer(target: self, action: "zoomLeggings:")
        tapGestureZoom.numberOfTapsRequired = 1
        tapGestureZoom.numberOfTouchesRequired = 1
        imageView.userInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureZoom)
        
        let tapGestureZoom2 = UITapGestureRecognizer(target: self, action: "zoomLeggings2:")
        tapGestureZoom2.numberOfTapsRequired = 1
        tapGestureZoom2.numberOfTouchesRequired = 1
        imageView2.userInteractionEnabled = true
        imageView2.addGestureRecognizer(tapGestureZoom2)
        
        let tapGestureZoom3 = UITapGestureRecognizer(target: self, action: "zoomLeggings3:")
        tapGestureZoom3.numberOfTapsRequired = 1
        tapGestureZoom3.numberOfTouchesRequired = 1
        imageView3.userInteractionEnabled = true
        imageView3.addGestureRecognizer(tapGestureZoom3)
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.Default
    }
    
    func backTapped(sender: AnyObject?){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func zoomLeggings(sender: AnyObject?){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewControllerWithIdentifier("LeggingsZoomController") as! LeggingsZoomController
        self.modalPresentationStyle = UIModalPresentationStyle.Custom
        controller.transitioningDelegate = transitionOperator
        controller.jsonextrct = jsonextrct
        
        presentViewController(controller, animated: true, completion: nil)
    }
    
    @IBAction func zoomLeggings2(sender: AnyObject?){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewControllerWithIdentifier("LeggingsZoomController2") as! LeggingsZoomController2
        self.modalPresentationStyle = UIModalPresentationStyle.Custom
        controller.transitioningDelegate = transitionOperator
        controller.jsonextrct = jsonextrct
        
        presentViewController(controller, animated: true, completion: nil)
    }
    
    @IBAction func zoomLeggings3(sender: AnyObject?){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewControllerWithIdentifier("LeggingsZoomController3") as! LeggingsZoomController3
        self.modalPresentationStyle = UIModalPresentationStyle.Custom
        controller.transitioningDelegate = transitionOperator
        controller.jsonextrct = jsonextrct
        
        presentViewController(controller, animated: true, completion: nil)
    }
    
}
