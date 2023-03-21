//
//  KudosManager.swift
//  Kudos-Cookies
//
//  Created by Sheren Emanuela on 21/03/23.
//

import Foundation
import CoreData

class KudosManager {
    
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "Kudos")
        persistentContainer.loadPersistentStores{ (description, error) in
            if let error = error {
                fatalError("Core Data Store Failed \(error.localizedDescription)")
            }
        }
    }
}



