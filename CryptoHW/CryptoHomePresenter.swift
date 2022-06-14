//
//  CryptoHomePresenter.swift
//  CryptoHW
//
//  Created by GLaDOS on 14.06.2022.
//

import Foundation

class CryptoHomePresenter:CryptoHome.Presenter{
    weak var view: CryptoHome.View?
    
    var interactor: CryptoHome.Interactor!
    
    // Notify interactor
    func viewDidLoad() {
        interactor.fetchData()
    }
    
    // Tell view to update
    func didDataFetch() {
        guard let data = interactor.filteredData else { return }
        
        view?.updateCollectionViewData(data)
    }
    
    
}
