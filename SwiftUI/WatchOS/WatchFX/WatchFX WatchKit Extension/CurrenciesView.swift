////
////  CurrenciesView.swift
////  WatchFX WatchKit Extension
////
////  Created by N on 2020/11/19.
////
//
//import SwiftUI
//
//struct CurrenciesView: View {
//    @State private var selectedCurrencies = UserDefaults.standard.array(forKey: ContentView.selectedCurrenciesKey) as? [String] ?? ContentView.defaultCurrencies
//    let selectedColor = Color(red: 0, green: 0.55, blue: 0.25)
//    let deselectedColor = Color(red: 0.3, green: 0, blue: 0)
//
//    var body: some View {
//        List {
//            ForEach(ContentView.currencies, id: \.self) { currency in
//                Button(currency) {
//                    toggle(currency)
//                }
//                .listItemTint(selectedCurrencies.contains(currency) ? selectedColor : deselectedColor)
//            }
//
//        }
//        .listStyle(CarouselListStyle())
//    }
//
//    func toggle(_ currency: String) {
//        if let index = selectedCurrencies.firstIndex(of: currency) {
//            selectedCurrencies.remove(at: index)
//        } else {
//            selectedCurrencies.append(currency)
//        }
//        UserDefaults.standard.set(selectedCurrencies, forKey: ContentView.selectedCurrenciesKey)
//    }
//}
//
//struct CurrenciesView_Previews: PreviewProvider {
//    static var previews: some View {
//        CurrenciesView()
//    }
//}
