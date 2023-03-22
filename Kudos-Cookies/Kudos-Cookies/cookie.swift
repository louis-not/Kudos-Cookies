//
//  cookie.swift
//  Kudos-Cookies
//
//  Created by Louis Mayco Dillon Wijaya on 23/03/23.
//

import SwiftUI

struct cookie: View {
    @State var isDragging=false
    @State var position = CGSize(width: CGFloat.random(in: -85...85),
                                 height: 175)
    
    var body: some View {
        Circle()
            .frame(width: 100, height: 100)
            .offset(x: position.width, y: position.height)
            .foregroundColor(.brown)
            .animation(.spring(), value: position)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        position = value.translation
                        isDragging = true
                    })
                    .onEnded({ value in
                        position = CGSize(width: position.width, height: 175) // CGSize(width: 0, height: 200)
                        isDragging = false
                    })
            )
    }
}

struct cookie_Previews: PreviewProvider {
    static var previews: some View {
        cookie()
    }
}
