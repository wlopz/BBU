//
//  BlusasGridController.swift
//  BBU
//
//  Created by Wilfredo Lopez on 8/11/15.
//  Copyright (c) 2015 DynmK. All rights reserved.
//

import Foundation

import UIKit

class BlusasGridController : UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var collectionView : UICollectionView!
    @IBOutlet var layout : UICollectionViewFlowLayout!
    
    var blusas : [JsonExtrct]!
    var cellHeight : CGFloat = 240
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        
        title = "Blusas"
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clearColor()
        
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        //let cellWidth = calcCellWidth(self.view.frame.size)
        let cellWidth = self.view.frame.width/2
        layout.itemSize = CGSizeMake(cellWidth, cellHeight)
        
        blusas = [JsonExtrct]()
        let json = BlusasJson()
        json.loadBlusas(didLoadBlusas)
    }
    
    func didLoadBlusas(blusas: [JsonExtrct]){
        self.blusas = blusas
        collectionView.reloadData()
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("BlusasCell", forIndexPath: indexPath) as! BlusasCell
        
        let JsonExtrct = blusas[indexPath.row]
        
        cell.titleLabel.text = JsonExtrct.titulo
        Utils.asyncLoadShotImage(JsonExtrct, imageView: cell.coverImageView)
        
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return blusas.count
    }
    
}