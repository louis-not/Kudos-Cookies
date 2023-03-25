//
//  NameView.swift
//  Kudos-Cookies
//
//  Created by Sheren Emanuela on 22/03/23.
//

import SwiftUI

struct NameView: View {
    
    @State var nameInput: String = ""
    @State var currUser = ""
    @Binding var kudosManager: KudosManager
    @Binding var page: Int
    @State var showAlert = false
    @State var cookieCount:Int = 5
    
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
                        Text("Input your full name")
                            .font(.title2)
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
                
                if kudosManager.userExist {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            page = 2
                        }, label: {
                            HStack {
                                Image(systemName: "chevron.backward")
                                    .foregroundColor(.brown)
                                    .font(.caption)
                                Text("Back")
                                    .foregroundColor(.brown)
                            }
                        })
                    }
                }
                
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        let tempUser = kudosManager.name
                        
                        kudosManager.name = nameInput
                        kudosManager.getKudos()
                        
                        if(kudosManager.myKudos.isEmpty) {
                            showAlert = true
                            kudosManager.name = tempUser
                            kudosManager.getKudos()
                        } else {
                            showAlert = false
                            kudosManager.userExist = true
                            page = 2
                        }
                    }, label: {
                        HStack {
                            Text("Next")
                                .foregroundColor(.brown)
                            Image(systemName: "chevron.forward")
                                .foregroundColor(.brown)
                                .font(.caption)
                        }
                    })
                }
            }
            .alert("Name does not exist!", isPresented: $showAlert) {
                Button(action:{}, label: {
                    Text("Try Again")
                        .foregroundColor(.brown)
                })
            }
        }
    }
}
