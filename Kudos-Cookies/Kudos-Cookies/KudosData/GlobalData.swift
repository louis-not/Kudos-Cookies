//
//  GlobalData.swift
//  Kudos-Cookies
//
//  Created by Sheren Emanuela on 22/03/23.
//

import Foundation

class GlobalData: ObservableObject {
    @Published var kudosManager = KudosManager()
    @Published var user = "sheren"
}
