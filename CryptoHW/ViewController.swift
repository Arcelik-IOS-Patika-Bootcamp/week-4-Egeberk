//
//  ViewController.swift
//  CryptoHW
//
//  Created by GLaDOS on 8.06.2022.
//

import UIKit

class ViewController: UIViewController {

    // UI Elements
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Collection View
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Register custom cell
        collectionView.register(.init(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionViewCell")
        
        
    }


}

extension ViewController:UICollectionViewDelegate{
    
}

extension ViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Cell definition
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
        
        // Cell data
        cell.nameLabel.text = "Test " + "\(indexPath.row)"
        
        return cell
    }
}

