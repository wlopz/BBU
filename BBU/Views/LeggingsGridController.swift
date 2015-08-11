//
//  LeggingsGridController.swift
//  BBU
//
//  Created by Wilfredo Lopez on 8/11/15.
//  Copyright (c) 2015 DynmK. All rights reserved.
//

import Foundation

import UIKit

class LeggingsGridController : UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var collectionView : UICollectionView!
    @IBOutlet var layout : UICollectionViewFlowLayout!
    
    var leggings : [JsonExtrct]!
    var cellHeight : CGFloat = 240
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        
        title = "Leggings"
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clearColor()
        
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        //let cellWidth = calcCellWidth(self.view.frame.size)
        let cellWidth = self.view.frame.width/2
        layout.itemSize = CGSizeMake(cellWidth, cellHeight)
        
        leggings = [JsonExtrct]()
        let json = LeggingsJson()
        json.loadLeggings(didLoadLeggings)
    }
    
    func didLoadLeggings(leggings: [JsonExtrct]){
        self.leggings = leggings
        collectionView.reloadData()
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("LeggingsCell", forIndexPath: indexPath) as! LeggingsCell
        
        let JsonExtrct = leggings[indexPath.row]
        
        cell.titleLabel.text = JsonExtrct.titulo
        Utils.asyncLoadShotImage(JsonExtrct, imageView: cell.coverImageView)
        
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return leggings.count
    }
    
}