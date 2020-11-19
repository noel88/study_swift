//
//  MainView.swift
//  WatchFX WatchKit Extension
//
//  Created by N on 2020/11/19.
//

import SwiftUI

//@main
//struct WatchFX: App {
//    var body: some Scene {
//        WindowGroup {
//            NavigationView {
//                ContentView()
//            }
//        }
//    }
//}

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
//            CurrenciesView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

