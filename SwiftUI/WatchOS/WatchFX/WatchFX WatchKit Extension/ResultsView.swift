//
//  ResultsView.swift
//  WatchFX WatchKit Extension
//
//  Created by N on 2020/11/19.
//

import SwiftUI
import Combine

struct ResultsView: View {
    @State private var fetchState = FetchState.fetching
    @State private var fetchedCurrencies = [(symbol: String, rate: Double)]()
    @State private var request: AnyCancellable?
    let appID = "877086a014914c378bf4684307b7be45"
    
    let amount: Double
    let baseCurrency: String
    
    var body: some View {
        Group {
            if fetchState == .success {
                List {
                    ForEach(fetchedCurrencies, id: \.symbol) { currency in
                        Text(rate(for: currency))
                    }
                }
            } else {
                Text(fetchState == .fetching ? "Fetching..." : "Fetch failed")
            }
        }
        .onAppear(perform: fetchData)
    }
    
    func parse(result: CurrencyResult) {
        if result.rates.isEmpty {
            fetchState = .failed
        } else {
            fetchState = .success
            
            let selectCurrencies = UserDefaults.standard.array(forKey: ContentView.selectedCurrenciesKey) as? [String] ?? ContentView.defaultCurrencies
            
            for symbol in result.rates {
                guard selectCurrencies.contains(symbol.key) else {
                    continue
                }
                let rateName = symbol.key
                let rateValue = symbol.value
                fetchedCurrencies.append((symbol: rateName, rate: rateValue))
            }
            fetchedCurrencies.sort {
                $0.symbol < $1.symbol
            }
        }
    }
    
    func rate(for currency: (symbol: String, rate: Double)) -> String {
        let value = currency.rate * amount
        let rate = String(format: "%.2f", value)
        return "\(currency.symbol) \(rate)"
    }
    
    func fetchData() {
        if let url = URL(string: "https://openexchangerates.org/api/latest.json?app_id=\(appID)&base=\(baseCurrency)") {
            request = URLSession.shared.dataTaskPublisher(for: url)
                .map(\.data)
                .decode(type: CurrencyResult.self, decoder: JSONDecoder())
                .replaceError(with: CurrencyResult(base: "", rates: [:]))
                .receive(on: DispatchQueue.main)
                .sink(receiveValue: parse)
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(amount: 500, baseCurrency: "USD")
    }
}

enum FetchState {
    case fetching, success, failed
}


struct CurrencyResult: Codable {
    let base: String
    let rates: [String: Double]
}
