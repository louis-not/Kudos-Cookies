//
//  CrackedView.swift
//  Kudos-Cookies
//
//  Created by Sheren Emanuela on 21/03/23.
//

import SwiftUI

struct CrackedView: View {
    @State var leftCookieLocation = CGPoint(x: 45, y: 82)
    @State var rightCookieLocation = CGPoint(x: 46, y: 99)
    
    var body: some View {
        ZStack {
            homeView()
                .blur(radius: 10)
            
            Rectangle()
                .fill(Color(red: 0.9568627450980393, green: 0.8627450980392157, blue: 0.7607843137254902))
                .opacity(0.5)
                .frame(width: .infinity, height: .infinity)
                .ignoresSafeArea()
            
            VStack {
                Text("Crack open the cookie!")
                    .font(.title2)
                    .foregroundColor(Color(red: 0.596078431372549, green: 0.3568627450980392, blue: 0.24313725490196078, opacity: 1.0))
                    .bold()
                HStack {
                    Image("Cookie Left")
                        .position(leftCookieLocation)
                        .rotationEffect(.degrees(10))
                    Image("Cookie Right")
                        .position(rightCookieLocation)
                        .rotationEffect(.degrees(10))
                }
                .frame(width: 200, height: 200)
                .padding()
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        self.leftCookieLocation.x -= 20
                        self.leftCookieLocation.y += 300
                        self.rightCookieLocation.x += 120
                        self.rightCookieLocation.y += 280
                    }
                }
            }
        }
    }
}

struct CrackedView_Previews: PreviewProvider {
    static var previews: some View {
        CrackedView()
    }
}
