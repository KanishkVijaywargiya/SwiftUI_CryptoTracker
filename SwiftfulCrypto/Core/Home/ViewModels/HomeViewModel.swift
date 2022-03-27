//
//  HomeViewModel.swift
//  SwiftfulCrypto
//
//  Created by KANISHK VIJAYWARGIYA on 24/03/22.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    private let dataService = CoinDataService.instance
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscibers()
    }
    
    func addSubscibers() {
        dataService.$allCoins
            .sink { [weak self] returnedCoinModels in
                guard let self = self else { return }
                self.allCoins = returnedCoinModels
            }
            .store(in: &cancellables)
    }
}

/*
 DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
 self.allCoins.append(DeveloperPreview.instance.coin)
 self.portfolioCoins.append(DeveloperPreview.instance.coin)
 }
 */
