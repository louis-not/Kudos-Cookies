//
//  KudosManager.swift
//  Kudos-Cookies
//
//  Created by Sheren Emanuela on 21/03/23.
//

import Foundation

public class KudosManager {
    
    let data = DataLoader().kudosData
    
    func filterByName(name: String) -> Array<KudosData> {
        var myKudos = [KudosData]()
        for kudos in data {
            if(kudos.name == name) {
                myKudos.append(kudos)
            }
        }
        return myKudos
    }
    
}
