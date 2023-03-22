//
//  KudosManager.swift
//  Kudos-Cookies
//
//  Created by Sheren Emanuela on 21/03/23.
//

import Foundation

public class KudosManager {
    
    private let data = DataLoader().kudosData
    let name = "sheren"
    let myKudos = [KudosData]()
    
    func getKudos() -> Array<KudosData> {
        var myKudos = [KudosData]()
        for kudos in data {
            if(kudos.name == name) {
                myKudos.append(kudos)
            }
        }
        return myKudos
    }
    
}
