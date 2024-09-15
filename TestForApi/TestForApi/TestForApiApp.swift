//
//  TestForApiApp.swift
//  TestForApi
//
//  Created by Habibur Rahman on 30/6/24.
//

import SwiftUI
import Kingfisher

@main
struct TestForApiApp: App {
    
   
    
    init() {
        // Set memory cache limit to 100 MB
        ImageCache.default.memoryStorage.config.totalCostLimit = 1024 * 1024 * 100 // 100 MB
        ImageCache.default.diskStorage.config.sizeLimit = 1024 * 1024 * 100 // 100 MB
        // Set cache expiration to 1 hour
        ImageCache.default.memoryStorage.config.expiration = .seconds(3600) // 1 hour
        ImageCache.default.diskStorage.config.expiration = .seconds(3600) // 1 hour
    }
    var body: some Scene {
        WindowGroup {
          // CustomTabView(index: 1)
            ContentView()
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.didEnterBackgroundNotification)) { _ in
                                   ImageCache.default.clearMemoryCache()
                               }
        }
    }
}
