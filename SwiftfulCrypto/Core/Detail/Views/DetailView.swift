//
//  DetailView.swift
//  SwiftfulCrypto
//
//  Created by KANISHK VIJAYWARGIYA on 05/04/22.
//

import SwiftUI

struct DetailLoadingView: View {
    @Binding var coin: CoinModel?
    
    var body: some View {
        ZStack {
            if let coin = coin {
                DetailView(coin: coin)
            }
        }
    }
}

struct DetailView: View {
    let coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        print("initializing the detail view for \(coin.name)")
    }
    
    var body: some View {
        ZStack {
            if let coin = coin {
                Text(coin.name)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(coin: dev.coin)
    }
}

/*
 @Binding var coin: CoinModel?
 
 init(coin: Binding<CoinModel?>) {
 self._coin = coin
 print("initializing the detail view for \(String(describing: coin.wrappedValue?.name))")
 }
 
 struct DetailView_Previews: PreviewProvider {
     static var previews: some View {
         DetailView(coin: .constant(dev.coin))
     }
 }

 */
