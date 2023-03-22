//
//  CrackedView.swift
//  Kudos-Cookies
//
//  Created by Sheren Emanuela on 21/03/23.
//

import SwiftUI

struct CrackedView: View {
    @State var leftCookieLocation = CGPoint(x: 45, y: 82)
    @State var rightCookieLocation = CGPoint(x: 42.5, y: 99)
    @State var leftRotationAngle = 10.0
    @State var rightRotationAngle = 10.0
    @State var isCracked = false
    @State var kudosWidth = 20.0
    @State var kudosFontSize = 1.0
    @State var textOffset = -10.0
    @State var kudosOffset = -20.0
    @Binding var kudosManager: KudosManager
    
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
                Text("Tap to open the cookie!")
                    .font(.title2)
                    .foregroundColor(Color(red: 0.596078431372549, green: 0.3568627450980392, blue: 0.24313725490196078, opacity: 1.0))
                    .bold()
                    .offset(x: 0, y: textOffset)
                
                ZStack {
                    
                    Rectangle()
                        .fill(.white)
                        .frame(width: kudosWidth, height: kudosWidth / 2)
                        .offset(x: 0, y: kudosOffset)
                    
                    Text("\(kudosManager.name)")
                        .font(.system(size: kudosFontSize))
                        .offset(x: 0, y: kudosOffset)
                    
                    HStack {
                        Image("Cookie Left")
                            .rotationEffect(.degrees(leftRotationAngle))
                            .position(leftCookieLocation)
                        Image("Cookie Right")
                            .rotationEffect(.degrees(rightRotationAngle))
                            .position(rightCookieLocation)
                    }
                    .frame(width: 200, height: 200)
                    .padding()
                    .onTapGesture {
                        if isCracked == false {
                            withAnimation(.easeIn(duration: 0.7)) {
                                leftCookieLocation.x -= 60
                                rightCookieLocation.x += 60
                                rightCookieLocation.y += 280
                                leftCookieLocation.y += 290
                                leftRotationAngle -= 60
                                rightRotationAngle += 60
                                kudosWidth *= 15
                                kudosFontSize *= 20
                                textOffset = -100
                            }
                        }
                        isCracked = true
                    }
                }
            }
        }
    }
}
