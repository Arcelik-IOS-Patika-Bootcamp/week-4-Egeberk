//
//  CryptoContract.swift
//  CryptoHW
//
//  Created by GLaDOS on 14.06.2022.
//

import Foundation

// MARK: View
protocol CryptoViewProtocol: AnyObject{
    var presenter:CryptoHome.Presenter! {get set}
    func updateCollectionViewData(_ data:Crypto)
}

// MARK: Presenter
protocol CryptoPresenterProtocol:AnyObject {
    var view:CryptoHome.View? {get set}
    var interactor:CryptoHome.Interactor! {get set}
    func viewDidLoad()
    func didDataFetch()
}

// MARK: Interactor
protocol CryptoInteractorProtocol: AnyObject {
    var presenter:CryptoHome.Presenter? {get set}
    var data:Crypto?  {get}
    
    func fetchData()
}

struct CryptoHome{
    typealias View = CryptoViewProtocol
    typealias Interactor = CryptoInteractorProtocol
    typealias Presenter = CryptoPresenterProtocol
}
