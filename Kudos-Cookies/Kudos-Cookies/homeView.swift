//
//  homeView.swift
//  Kudos-Cookies
//
//  Created by Louis Mayco Dillon Wijaya on 21/03/23.
//

import SwiftUI

struct homeView: View {
//    @Binding var name:String
    @Binding var showNameView:Bool
    // buat 1 variable sebagai constraint dari zstack batas si circle
    @Binding var cookieCount:Int
//    @State var getCookie: Bool
    
    var body: some View {
        VStack{
            Image("logo")
                .imageScale(.large)
                .foregroundColor(.accentColor)
        
            VStack(alignment: .leading){
                HStack(){
                    Text("Hi")
                        .font(.title2)
                        .foregroundColor(Color(red: 0.596078431372549, green: 0.3568627450980392, blue: 0.24313725490196078, opacity: 1.0))
                        .bold()
                    Button {
                        showNameView = !showNameView
                        print("New name: hello")
                    } label: {
                        Text("hello")
                            .font(.title2)
                            .foregroundColor(Color(red: 0.7176470588235294, green: 0.30196078431372547, blue: 0.10196078431372549))
                            .bold()
                    }
                }
                .padding(.leading, 30)
                Text("It's time to get your cookie!")
                    .font(.title2)
                    .foregroundColor(Color(red: 0.596078431372549, green: 0.3568627450980392, blue: 0.24313725490196078, opacity: 1.0))
                    .bold()
                    .padding(.leading, 30)
                Spacer()
                ZStack{
                    Color.blue
                    ZStack {
                        Color.red
                        Image("jar")
                            .resizable(resizingMode: .stretch)
                            .foregroundColor(.accentColor)
                            .scaledToFit()
                            .frame(width: 300, height: 400, alignment: .center)
                            .padding(.top,50)
                        // foreach di loop sebanyak jumlah cookiecount
                        ForEach(0..<cookieCount, id:\.self){ _ in
                            cookie()
//                                .clipped()
                        }

                    }.frame(width: 100,height: 50)
                }
                Spacer()
                // Cookie Object
                
            }

            
            Spacer()
        }
    }
}

struct homeView_Previews: PreviewProvider {
    static var previews: some View {
        homeView(showNameView: .constant(false),
                 cookieCount: .constant(5))
    }
}
