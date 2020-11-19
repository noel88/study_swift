//
//  ContentView.swift
//  WatchFX WatchKit Extension
//
//  Created by N on 2020/11/19.
//

import SwiftUI

struct ContentView: View {
    
    @State private var amount = 50.0
    @State private var selectedCurrency = "USD"
    @State private var amountFocused = false
//    static let currencies = ["USD", "AUD", "CAD", "CHF", "CNY", "EUR", "GBP", "HKD", "JPY", "SGD"]
    static let selectedCurrenciesKey = "SelectedCurrencies"
    static let defaultCurrencies = ["AUD", "CAD", "CHF", "CNY", "EUR", "GBP", "HKD", "JPY", "SGD", "KRW"]
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                Text("\(Int(amount)) USD")
                    .font(.system(size: 32))
                    .padding()
                    .frame(width: geo.size.width)
                
                Slider(value: $amount, in: 0...1000, step: 10)
                    .focusable{
                        amountFocused = $0
                    }
                    .contentShape(Rectangle())
                    .digitalCrownRotation($amount, from: 0, through: 1000, by: 10, sensitivity: .high, isContinuous: false, isHapticFeedbackEnabled: true)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(amountFocused ? Color.green : Color.white, lineWidth: 1)
                    )
                    .padding(.bottom)
                
                HStack {
//                    Picker("Select a currency", selection: $selectedCurrency) {
//                        ForEach(Self.currencies, id: \.self) { currency in
//                            Text(currency)
//                        }
//                    }
//                    .labelsHidden()
                    
                    NavigationLink(
                        destination: ResultsView(amount: amount, baseCurrency: selectedCurrency)) {
                            Text("Exchange")
                    }
                    .frame(width: geo.size.width)
                }
                .padding()
                .frame(width: geo.size.width)
                
            }
            .navigationTitle("Calculation")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

