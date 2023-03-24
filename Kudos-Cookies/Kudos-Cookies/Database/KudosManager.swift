//
//  KudosManager.swift
//  Kudos-Cookies
//
//  Created by Sheren Emanuela on 21/03/23.
//

import Foundation

public class KudosManager {
    
    private let data = DataLoader().kudosData
    var name = ""
    var myKudos = [KudosData]()
    var userExist = false
    
    func getKudos() -> Void {
        myKudos.removeAll()
        for kudos in data {
            if(kudos.name == name) {
                print(kudos.message)
                myKudos.append(kudos)
            }
        }
    }
    
    func getRandomKudos() -> KudosData {
        return myKudos.randomElement()!
    }
}
