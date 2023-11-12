//
//  StoreApp.swift
//  Store
//
//  Created by Rahmat Susanto on 12/11/23.
//

import SwiftUI

@main
struct StoreApp: App {
    
    @StateObject private var controller = StoreController()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(controller)
        }
    }
}
