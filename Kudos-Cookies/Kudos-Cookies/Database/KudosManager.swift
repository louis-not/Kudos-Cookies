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
    var nickname = ""
    var currIndex = -1
    
    func getKudos() -> Void {
        myKudos.removeAll()
        for kudos in data {
            if(kudos.name.lowercased() == name.lowercased()) {
                myKudos.append(kudos)
                nickname = kudos.nickname
            }
        }
    }
    
    func getRandomKudos() -> KudosData {
        var index = currIndex
        while true {
            index = Int.random(in: 0 ..< myKudos.count)
            if myKudos.count == 1 {
                currIndex = index
                return myKudos[currIndex]
            }
            if index != currIndex {
                currIndex = index
                break
            }
        }
        return myKudos[currIndex]
//        return myKudos[Int.random(in: 0 ..< myKudos.count)]
    }
}
