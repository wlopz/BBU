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
        
        tituloLabel.font = UIFont(name: mTheme.fontName, size: 21)
        tituloLabel.textColor = UIColor.blackColor()
        tituloLabel.text = jsonextrct.titulo
        
        //marca = jsonextrct.marca
        
        marcaLabel.font = UIFont(name: mTheme.fontName, size: 21)
        marcaLabel.textColor = UIColor.blackColor()
        marcaLabel.text = jsonextrct.marca
        
        //color = jsonextrct.color
        
        colorLabel.font = UIFont(name: mTheme.fontName, size: 21)
        colorLabel.textColor = UIColor.blackColor()
        colorLabel.text = jsonextrct.color
        
        //tipo = jsonextrct.tipo
        
        tipoLabel.font = UIFont(name: mTheme.fontName, size: 21)
        tipoLabel.textColor = UIColor.blackColor()
        tipoLabel.text = jsonextrct.tipo
        
        //ref = jsonextrct.ref
        
        refLabel.font = UIFont(name: mTheme.fontName, size: 21)
        refLabel.textColor = UIColor.blackColor()
        refLabel.text = "\(jsonextrct.ref)"
        
        if let imageData = jsonextrct.imageData {
            imageView.image = UIImage(data: imageData)
        }else{
            Utils.asyncLoadJsonImage(jsonextrct, imageView: imageView)
        }
        //topImageViewHeightConstraint.constant = 240
        
        imageView.layer.borderColor = UIColor(white: 0.2, alpha: 1.0).CGColor
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
        
        //var tapGestureZoom = UITapGestureRecognizer(target: self, action: "zoomShot:")
        //tapGestureZoom.numberOfTapsRequired = 1
        //tapGestureZoom.numberOfTouchesRequired = 1
        //topImageView.userInteractionEnabled = true
        //topImageView.addGestureRecognizer(tapGestureZoom)
        
    }
    
    //override func viewWillAppear(animated: Bool) {
    //super.viewWillAppear(animated)
    
    //addShotGradient()
    //}
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.Default
    }
    
    func backTapped(sender: AnyObject?){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //func addShotGradient(){
    
    //topGradientView.clipsToBounds = true
    
    //let gradientLayer = CAGradientLayer()
    //gradientLayer.frame = CGRectMake(0, 0, 1000, 90)
    //gradientLayer.colors = [UIColor(white: 0.0, alpha: 0.0).CGColor, UIColor(white: 0.0, alpha: 0.5).CGColor]
    
    //self.topGradientView.layer.addSublayer(gradientLayer)
    //}
    
    //@IBAction func zoomShot(sender: AnyObject?){
    //let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //let controller = storyboard.instantiateViewControllerWithIdentifier("ShotZoomController") as! ShotZoomController
    //self.modalPresentationStyle = UIModalPresentationStyle.Custom
    //controller.transitioningDelegate = transitionOperator
    //controller.shot = shot
    
    //presentViewController(controller, animated: true, completion: nil)
    //}
    
}
