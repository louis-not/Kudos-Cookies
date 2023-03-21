
//  Kudos_CookiesApp.swift
//  Kudos-Cookies
//
//  Created by Louis Mayco Dillon Wijaya on 20/03/23.
//

import SwiftUI

@main
struct Kudos_CookiesApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            
            // testing json
            let data = DataLoader().kudosData
//            let _ = print(data[0])
            
            let _ = print(KudosManager().filterByName(name: "Jane"))
        }
    }
}
