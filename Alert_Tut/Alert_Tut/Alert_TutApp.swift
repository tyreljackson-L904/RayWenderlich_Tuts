//
//  Alert_TutApp.swift
//  Alert_Tut
//
//  Created by Tyrel Jackson on 11/6/20.
//

import SwiftUI

@main
struct Alert_TutApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
