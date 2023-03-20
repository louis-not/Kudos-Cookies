//
//  homeView.swift
//  Kudos-Cookies
//
//  Created by Louis Mayco Dillon Wijaya on 21/03/23.
//

import SwiftUI

struct homeView: View {
//    @Binding var name:String
    
    var body: some View {
        VStack{
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .padding(.top, 30)
        
            VStack(alignment: .leading){
                HStack(){
                    Text("Hi")
                        .font(.title2)
                        .foregroundColor(Color(red: 0.596078431372549, green: 0.3568627450980392, blue: 0.24313725490196078, opacity: 1.0))
                        .bold()
                    Button {
                        print("New name: hello")
                    } label: {
                        Text("hello")
                            .font(.title2)
                            .foregroundColor(Color(red: 0.7176470588235294, green: 0.30196078431372547, blue: 0.10196078431372549))
                            .bold()
                    }

                }
                Text("It's time to get your cookie!")
                    .font(.title2)
                    .foregroundColor(Color(red: 0.596078431372549, green: 0.3568627450980392, blue: 0.24313725490196078, opacity: 1.0))
                    .bold()
            }
            .padding(.top,30)
            
            Spacer()
        }
    }
}

struct homeView_Previews: PreviewProvider {
    static var previews: some View {
        homeView()
    }
}
