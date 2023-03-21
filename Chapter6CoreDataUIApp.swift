//
//  Chapter6CoreDataUIApp.swift
//  Chapter6CoreDataUI
//
//  Created by Timur on 20.03.2023.
//

import SwiftUI

@main
struct Chapter6CoreDataUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(coreDM: CoreDataManager())
        }
    }
}
