//
//  to_doApp.swift
//  to do
//
//  Created by Kennedy Miller on 6/13/23.
//

import SwiftUI

@main
struct to_doApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
