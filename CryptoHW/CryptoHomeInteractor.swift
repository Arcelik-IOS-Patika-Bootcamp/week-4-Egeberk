//
//  CryptoHomeInteractor.swift
//  CryptoHW
//
//  Created by GLaDOS on 14.06.2022.
//

import Foundation

class CryptoHomeInteractor: CryptoHome.Interactor{

    private let cryptoApiURL = "https://api.nomics.com/v1/currencies/ticker?key=bf6bf2bc4da0f3eb7194d88d021513897b17fbd3&interval=1d&convert=EUR"
    
    weak var presenter: CryptoHome.Presenter?
    
    var data: [Crypto]?
    var filteredData: [Crypto]?
    
    func fetchData() {
        if let url = URL.init(string: cryptoApiURL)
        {
            // Try to fetch crypto data
            let task = URLSession.shared.dataTask(with: url){ [weak self] data, response, error in
                guard let self = self else { return }
                do{
                    guard let data = data else{
                        return
                    }
                    let object = try JSONDecoder().decode([Crypto].self, from: data)
                    self.data = object
                    self.filteredData = self.data
                    
                    // Notify presenter
                    DispatchQueue.main.async {
                        self.presenter?.didDataFetch()
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
