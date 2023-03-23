//
//  NameView.swift
//  Kudos-Cookies
//
//  Created by Sheren Emanuela on 22/03/23.
//

import SwiftUI

struct NameView: View {
    
    @State var nameInput: String = ""
    @Binding var kudosManager: KudosManager
    @Binding var page: Int
    @State var showAlert = false
    
    var body: some View {
        
        NavigationView {
            ZStack {
                homeView(kudosManager: $kudosManager, page: $page)
                    .blur(radius: 10)

                Rectangle()
                    .fill(Color(red: 0.9568627450980393, green: 0.8627450980392157, blue: 0.7607843137254902))
                    .opacity(0.5)
                    .frame(width: .infinity, height: .infinity)
                    .ignoresSafeArea()

                ZStack {
                    if nameInput.isEmpty {
                        Text("Input your name")
                            .font(.title)
                            .foregroundColor(Color(red: 0.7176470588235294, green: 0.30196078431372547, blue: 0.10196078431372549, opacity: 0.5))
                            .bold()
                    }

                    TextField("", text: $nameInput)
                        .overlay(Rectangle().frame(height: 5).padding(.top, 55))
                        .foregroundColor(Color(red: 0.7176470588235294, green: 0.30196078431372547, blue: 0.10196078431372549))
                        .padding(80)
                        .font(.title)
                        .bold()
                        .multilineTextAlignment(.center)
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Next") {
                        kudosManager.name = nameInput
                        kudosManager.getKudos()
                        
                        if(kudosManager.myKudos.isEmpty) {
                            showAlert = true
                        } else {
                            showAlert = false
                            page = 3
                        }
                    }
                    .foregroundColor(.brown)
                }
            }
            .alert("Name does not exist!", isPresented: $showAlert) {
                Button("Try Again", role: .cancel) { }
            }
        }
    }
}

//struct NameView_Previews: PreviewProvider {
//    static var previews: some View {
//        NameView()
//    }
//}
