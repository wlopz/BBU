//
//  JnsGridController.swift
//  BBU
//
//  Created by Wilfredo Lopez on 8/8/15.
//  Copyright (c) 2015 DynmK. All rights reserved.
//

import Foundation

import UIKit

class JnsGridController : UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var collectionView : UICollectionView!
    @IBOutlet var layout : UICollectionViewFlowLayout!
    
    var jns : [JsonExtrct]!
    var cellHeight : CGFloat = 240
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Jeans"
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clearColor()
        
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        //let cellWidth = calcCellWidth(self.view.frame.size)
        let cellWidth = self.view.frame.width/2
        layout.itemSize = CGSizeMake(cellWidth, cellHeight)
        
        jns = [JsonExtrct]()
        let json = JnsJson()
        json.loadJns(nil)
    }
    
    func didLoadJns(jnslst: [JsonExtrct]){
        self.jns = jnslst
        collectionView.reloadData()
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("JnsCell", forIndexPath: indexPath) as! JnsCell
        
        let JsonExtrct = jns[indexPath.row]
        cell.titleLabel.text = JsonExtrct.titulo
        
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jns.count
    }
    
}
