//
//  homeView.swift
//  Kudos-Cookies
//
//  Created by Louis Mayco Dillon Wijaya on 21/03/23.
//

import SwiftUI

struct homeView: View {
//    @Binding var name:String
    @State var isDragging=false
    @State var position = CGSize.zero
    @Binding var kudosManager: KudosManager
    @Binding var cookieCount:Int
    @Binding var page: Int
    
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
                        page = 1
                    } label: {
                        Text("\(kudosManager.nickname)")
                            .font(.title2)
                            .foregroundColor(Color(red: 0.7176470588235294, green: 0.30196078431372547, blue: 0.10196078431372549))
                            .bold()
                    }
                    
                }
                .padding(.leading, 40)
                
                Text("It's time to get your cookie!")
                    .font(.title2)
                    .foregroundColor(Color(red: 0.596078431372549, green: 0.3568627450980392, blue: 0.24313725490196078, opacity: 1.0))
                    .bold()
                    .padding(.leading, 40)
                Spacer()
        
                ZStack {
                    Image("jar")
                        .resizable(resizingMode: .stretch)
                        .foregroundColor(.accentColor)
                        .scaledToFit()
                        .frame(width: 300, height: 400, alignment: .center)
                        .padding(.top,50)
                    
                    ForEach(0..<cookieCount, id:\.self){ _ in
                        cookie(page: $page)
                    }
                }
                Spacer()
            }
            Spacer()
        }
    }
}

//struct homeView_Previews: PreviewProvider {
//    static var previews: some View {
//        homeView(
//                 cookieCount: .constant(5))
//    }
//}
