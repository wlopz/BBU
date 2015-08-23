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
    //@IBOutlet var imageView2 : UIImageView!
    //@IBOutlet var imageView3 : UIImageView!
    
    @IBOutlet var backbutton : UIButton!
    
    var jsonextrct : JsonExtrct!
    
    var photos : [String]!
    
    var transitionOperator = TransitionOperator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //titulo = jsonextrct.titulo
        
        tituloLabel.font = UIFont(name: mTheme.fontName, size: 28)
        tituloLabel.textColor = UIColor.redColor()
        tituloLabel.text = jsonextrct.titulo
        
        //marca = jsonextrct.marca
        
        marcaLabel.font = UIFont(name: mTheme.fontName, size: 18)
        marcaLabel.textColor = UIColor.redColor()
        marcaLabel.text = jsonextrct.marca
        
        //color = jsonextrct.color
        
        colorLabel.font = UIFont(name: mTheme.fontName, size: 18)
        colorLabel.textColor = UIColor.redColor()
        colorLabel.text = jsonextrct.color
        
        //tipo = jsonextrct.tipo
        
        tipoLabel.font = UIFont(name: mTheme.fontName, size: 18)
        tipoLabel.textColor = UIColor.redColor()
        tipoLabel.text = jsonextrct.tipo
        
        //ref = jsonextrct.ref
        
        refLabel.font = UIFont(name: mTheme.fontName, size: 18)
        refLabel.textColor = UIColor.redColor()
        refLabel.text = "\(jsonextrct.ref)"
        
        if let imageData = jsonextrct.imageData {
            imageView.image = UIImage(data: imageData)
        }else{
            Utils.asyncLoadJsonImage(jsonextrct, imageView: imageView)
        }
        //topImageViewHeightConstraint.constant = 240
        
        imageView.layer.borderColor = UIColor.redColor().CGColor
        imageView.layer.borderWidth = 0.5
        
        //if let imageData2 = jsonextrct.imageData2 {
            //imageView2.image = UIImage(data: imageData2)
        //}else{
            //UtilsBlusas.asyncLoadJsonImage(jsonextrct, imageView2: imageView2)
        //}
        
        //imageView2.layer.borderColor = UIColor(white: 0.2, alpha: 1.0).CGColor
        //imageView2.layer.borderWidth = 0.5
        
        //if let imageData3 = jsonextrct.imageData3 {
            //imageView3.image = UIImage(data: imageData3)
        //}else{
            //Utils.asyncLoadJsonImage(jsonextrct, imageView3: imageView3)
        //}
        
        //imageView3.layer.borderColor = UIColor(white: 0.2, alpha: 1.0).CGColor
        //imageView3.layer.borderWidth = 0.5
        
        var tapGestureZoom = UITapGestureRecognizer(target: self, action: "zoomBlusas:")
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
