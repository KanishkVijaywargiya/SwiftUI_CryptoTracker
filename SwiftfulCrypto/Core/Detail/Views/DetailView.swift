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
    @StateObject private var vm: DetailViewModel
    
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    private let spacing: CGFloat = 30
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("1")
                    .frame(height: 150)
                
                overviewTitle
                Divider()
                overviewGrid
                
                additionalTitle
                Divider()
                additionalGrid
            }
            .padding()
        }
        .navigationTitle(vm.coin.name)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(coin: dev.coin)
        }
    }
}

extension DetailView {
    private var overviewTitle: some View {
        Text("Overview")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    private var overviewGrid: some View {
        LazyVGrid(
            columns: columns,
            alignment: .leading,
            spacing: spacing,
            pinnedViews: []) {
                ForEach(vm.overviewStatistics) { stat in
                    StatisticView(stat: stat)
                }
            }
    }
    private var additionalTitle: some View {
        Text("Additional Detail")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    private var additionalGrid: some View {
        LazyVGrid(
            columns: columns,
            alignment: .leading,
            spacing: spacing,
            pinnedViews: []) {
                ForEach(vm.additionalStatistics) { stat in
                    StatisticView(stat: stat)
                }
            }
    }
}

/* when this dosen't work
 @StateObject var vm = DetailViewModel(coin: <#T##CoinModel#>)
 let coin: CoinModel
 
 both these statements are getting initialize at the same time. So this is not possible to pass in vm.
 So use init() {...}
 init(coin: CoinModel) {
 ----- _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
 print("initializing the detail view for \(coin.name)")
 }
 */

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
