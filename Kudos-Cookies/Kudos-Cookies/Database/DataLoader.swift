//
//  DataLoader.swift
//  Kudos-Cookies
//
//  Created by Sheren Emanuela on 21/03/23.
//

import Foundation
import CoreMotion

public class DataLoader {
    @Published var kudosData = [KudosData]()
    
    init() {
        load()
    }
    
    func load() {
        if let fileLocation = Bundle.main.url(forResource: "KudosSeeder", withExtension: "json") {
            
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([KudosData].self, from: data)
                
                self.kudosData = dataFromJson
            } catch {
                print(error)
            }
            
        }
    }
}
