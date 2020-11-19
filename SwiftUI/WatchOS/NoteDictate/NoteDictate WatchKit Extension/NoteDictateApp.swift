//
//  NoteDictateApp.swift
//  NoteDictate WatchKit Extension
//
//  Created by N on 2020/11/18.
//

import SwiftUI

@main
struct NoteDictateApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
