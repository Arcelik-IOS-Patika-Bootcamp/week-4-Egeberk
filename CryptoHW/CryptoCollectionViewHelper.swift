//
//  CryptoCollectionViewHelper.swift
//  CryptoHW
//
//  Created by GLaDOS on 14.06.2022.
//

import UIKit

class CryptoCollectionViewHelper:NSObject{
    
    weak var viewController:UIViewController?
    weak var collectionView:UICollectionView?
    
    // Data
    private var currencies:[Crypto] = []
    private var filteredCurrencies:[Crypto] = []
    
    init(with collectionView:UICollectionView, vc:ViewController){
        super.init()
        self.collectionView = collectionView
        self.viewController = vc
        
        // Collection View
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
    
        // Register custom cell
        self.collectionView?.register(.init(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionViewCell")
    }
    
    func setItems(_ items:[Crypto]){
        currencies = items
        filteredCurrencies = currencies
        collectionView?.reloadData()
    }
}

extension CryptoCollectionViewHelper:UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return filteredCurrencies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Cell definition, use our custom cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
        
        let rowitem = filteredCurrencies[indexPath.row]
        // Set cell data
        cell.nameLabel.text = rowitem.name
        
        return cell
    }
}
