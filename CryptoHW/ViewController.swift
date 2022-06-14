//
//  ViewController.swift
//  CryptoHW
//
//  Created by GLaDOS on 8.06.2022.
//

import UIKit

class ViewController: UIViewController,CryptoViewProtocol {

    // UI Elements
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // Data
    private var currencies:[Crypto] = []
    private var filteredCurrencies:[Crypto] = []
    
    private var collectionViewHelper: CryptoCollectionViewHelper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI Ops
        setupUI()
        
        collectionViewHelper = .init(with: collectionView, vc: self)
        
        // Tell presenter that the view is loaded
        presenter.viewDidLoad()
    }
    
    var presenter: CryptoHome.Presenter!
    
    func updateCollectionViewData(_ data: [Crypto]) {
        collectionViewHelper.setItems(data)
    }
    
    
    private func setupUI(){
        
        // Search Bar
        searchBar.delegate = self
    }
}
// MARK: Search Bar Delegate
extension ViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Nothing is being searched, show full list
        if(searchText.isEmpty){
            filteredCurrencies = currencies
            collectionViewHelper.setItems(filteredCurrencies)
        }
        // Filter list by name
        else
        {
            filteredCurrencies = currencies.filter{$0.name.lowercased().contains(searchText.lowercased())}
            collectionViewHelper.setItems(filteredCurrencies)
        }
    }
}

