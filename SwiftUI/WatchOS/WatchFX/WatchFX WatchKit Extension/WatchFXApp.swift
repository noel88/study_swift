//
//  WatchFXApp.swift
//  WatchFX WatchKit Extension
//
//  Created by N on 2020/11/19.
//

import SwiftUI

@main
struct WatchFXApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
