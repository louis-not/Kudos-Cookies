//
//  KudosManager.swift
//  Kudos-Cookies
//
//  Created by Sheren Emanuela on 21/03/23.
//

import Foundation

public class KudosManager {
    
    private let data = DataLoader().kudosData
    var name = "sheren"
    var myKudos = [KudosData]()
    
    func getKudos() -> Void {
        for kudos in data {
            if(kudos.name == name) {
                myKudos.append(kudos)
            }
        }
    }
    
    func getRandomKudos() -> KudosData {
        return myKudos.randomElement()!
    }
}
