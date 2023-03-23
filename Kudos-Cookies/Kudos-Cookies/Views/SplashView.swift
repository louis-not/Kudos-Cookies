//
//  SplashView.swift
//  Kudos-Cookies
//
//  Created by Sheren Emanuela on 23/03/23.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        
        ZStack {
            if self.isActive {
                ContentView()
            } else {
                Color(red: 0.9568627450980393, green: 0.8627450980392157, blue: 0.7607843137254902)
                    .ignoresSafeArea()
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
        
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
