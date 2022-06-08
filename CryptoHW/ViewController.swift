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
    @IBOutlet weak var searchBar: UISearchBar!
    
    /* Data
     TODO: Create currency struct
     */
    private var currencies:[Any] = []
    private var filteredCurrencies:[Any] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI Ops
        setupUI()
    }
    
    
    private func setupUI(){
        // Collection View
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Search Bar
        searchBar.delegate = self
        
        // Register custom cell
        collectionView.register(.init(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionViewCell")
    }
}

extension ViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Nothing is being searched, show full list
        if(searchText.isEmpty){
            filteredCurrencies = currencies
            collectionView.reloadData()
        }
        // Show filtered list
        else
        {
            // TODO: filter list
        }
    }
}

extension ViewController:UICollectionViewDelegate{
    
}

extension ViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Cell definition, use our custom cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
        
        // Cell data
        cell.nameLabel.text = "Test " + "\(indexPath.row)"
        
        return cell
    }
}

