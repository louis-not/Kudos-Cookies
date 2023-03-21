
//  Kudos_CookiesApp.swift
//  Kudos-Cookies
//
//  Created by Louis Mayco Dillon Wijaya on 20/03/23.
//

import SwiftUI

@main
struct Kudos_CookiesApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
