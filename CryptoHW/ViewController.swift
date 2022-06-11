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
    
    // Data
    private var currencies:[Crypto] = []
    private var filteredCurrencies:[Crypto] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI Ops
        setupUI()
        
        // API call
        fetchData()
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
    
    // MARK: API Call
    private func fetchData(){
        if let url = URL.init(string: "https://api.nomics.com/v1/currencies/ticker?key=bf6bf2bc4da0f3eb7194d88d021513897b17fbd3&interval=1d&convert=EUR")
        {
            // Try to fetch crypto data
            let task = URLSession.shared.dataTask(with: url){ [weak self] data, response, error in
                guard let self = self else { return }
                do{
                    guard let data = data else{
                        return
                    }
                    let object = try JSONDecoder().decode([Crypto].self, from: data)
                    self.currencies = object
                    self.filteredCurrencies = self.currencies
                    
                    // Cant call for UI elements from ".shared.dataTask"
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                }
                catch{
                    print(error)
                }
            }
            task.resume()
        }
    }
}
// MARK: Search Bar Delegate
extension ViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Nothing is being searched, show full list
        if(searchText.isEmpty){
            filteredCurrencies = currencies
            collectionView.reloadData()
        }
        // Filter list by name
        else
        {
            filteredCurrencies = currencies.filter{$0.name.lowercased().contains(searchText.lowercased())}
            collectionView.reloadData()
        }
    }
}

// MARK: CollectionView Delegate & Data Source
extension ViewController:UICollectionViewDataSource,UICollectionViewDelegate {
    
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

