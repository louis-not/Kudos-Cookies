//
//  DatabaseView.swift
//  Kudos-Cookies
//
//  Created by Sheren Emanuela on 21/03/23.
//

import SwiftUI
import CoreData

struct DatabaseView: View {
    var body: some View {
        NavigationStack {
            List {
                
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Kudos")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct DatabaseView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
