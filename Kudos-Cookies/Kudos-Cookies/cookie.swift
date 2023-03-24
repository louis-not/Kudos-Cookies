//
//  cookie.swift
//  Kudos-Cookies
//
//  Created by Louis Mayco Dillon Wijaya on 23/03/23.
//

import SwiftUI

struct cookie: View {

    @State var position=CGSize(width: CGFloat.random(in: -85...85),
                                 height: 165)
    @State var dragOffset=CGSize.zero

    @State var getCookie:Bool=false
//    @State var offset = CGSize(width: position.width, height: , position.height)
    
    var body: some View {
        Image("Cookie")
            .resizable(resizingMode: .stretch)
            .scaledToFit()
            .frame(width: 100, height: 100)
            .rotationEffect(.degrees(CGFloat.random(in:-90...90)))
            .offset(position)
            .offset(dragOffset)
            .animation(.easeIn, value: position)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        dragOffset = value.translation
//                        isDragging = true
                    })
                    .onEnded({ _ in
                        if position.height >= 100 {
                            getCookie =  true
//                            Color.red
                        }
                        position.width += dragOffset.width
                        position.height = 165
                        dragOffset = .zero
//                        isDragging = false
                    })
            )
//            .overlay(
//                RoundedRectangle(cornerRadius: 10)
////                    .frame(width: 300, height: 400, alignment: .center)
////                    .resizable(resizingMode: .stretch)
//                    .stroke(Color.red, lineWidth: 2)
//            )
//            .clipped()

    }
//
//    private func updateOffset() {
//        let maxX = UIScreen.main.bounds.width
//        let maxY = UIScreen.main.bounds.height
//        let proposedOffset = CGSize(width: offset.width + position.width, height: offset.height + position.height)
//        let x = max(0, min(proposedOffset.width, maxX))
//        let y = max(0, min(proposedOffset.height, maxY))
//        offset = CGSize(width: x, height: y)
//    }
}

struct cookie_Previews: PreviewProvider {
    static var previews: some View {
        cookie()
    }
}
