//
//  cookie.swift
//  Kudos-Cookies
//
//  Created by Louis Mayco Dillon Wijaya on 23/03/23.
//

import SwiftUI

struct cookie: View {

    @State var position=CGSize(width: CGFloat.random(in: -80...80),
                                 height: 165)
    @State var dragOffset=CGSize.zero

    @State var getCookie:Bool=false
    let minOffset = CGSize(width: -80, height: -180)
    let maxOffset = CGSize(width: 80, height: 180)
    
//    @State var offset = CGSize(width: position.width, height: , position.height)
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: maxOffset.width-minOffset.width+Double(50),
                       height: maxOffset.height-minOffset.height+Double(50))
                .foregroundColor(.red)
            Image("jar")
                .resizable(resizingMode: .stretch)
                .foregroundColor(.accentColor)
                .scaledToFit()
                .frame(width: 300, height: 400, alignment: .center)
                .padding(.top,50)
            Image("Cookie")
                .resizable(resizingMode: .stretch)
                .scaledToFit()
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(CGFloat.random(in:-90...90)))
                .offset(position)
//                .offset(dragOffset)
                .animation(.easeIn, value: position)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            dragOffset = value.translation
                            let proposedOffset = CGSize(
                                width: position.width + value.translation.width,
                                height: position.height + value.translation.height)
                            
                            position = CGSize(
                                width: min(max(proposedOffset.width, minOffset.width), maxOffset.width),
                                height: min(max(proposedOffset.height, minOffset.height), maxOffset.height))
                        })
                        .onEnded({ _ in
                            if position.height >= 100 {
                                getCookie =  true
                            }

                            position.height = 165
                            position = position

    //                        isDragging = false
                        })
                )
        }
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
