//
//  cookie.swift
//  Kudos-Cookies
//
//  Created by Louis Mayco Dillon Wijaya on 23/03/23.
//

import SwiftUI

struct cookie: View {

    @State var currOffset = CGSize(width: CGFloat.random(in: -80...80), height: 165)
    @State var lastOffset = CGSizeZero
    @State var initialPosition = true
    @Binding var page: Int
    let minOffset = CGSize(width: -80, height: -180)
    let maxOffset = CGSize(width: 80, height: 180)
    
    var body: some View {
        ZStack{
            Image("Cookie")
                .resizable(resizingMode: .stretch)
                .scaledToFit()
                .frame(width: 100, height: 100)
//                .rotationEffect(.degrees(CGFloat.random(in:-90...90)))
                .offset(currOffset)
                .animation(.easeIn, value: currOffset)
                .gesture(
                    DragGesture()
                        .onChanged({ dragValue in
                            if initialPosition == true {
                                initialPosition = false
                                lastOffset = currOffset
                            }
                            
                            if currOffset.height <= -180 {
                                page = 3
                            }
                            
                            let proposedOffset = CGSize(
                                width: lastOffset.width + dragValue.translation.width,
                                height: lastOffset.height + dragValue.translation.height)

                            currOffset = CGSize(
                                width: min(max(proposedOffset.width, minOffset.width), maxOffset.width),
                                height: min(max(proposedOffset.height, minOffset.height), maxOffset.height))
                        })
                        .onEnded({ _ in
                            lastOffset = currOffset
                        })
//                )
//        }
//            .overlay(
//                RoundedRectangle(cornerRadius: 10)
////                    .frame(width: 300, height: 400, alignment: .center)
////                    .resizable(resizingMode: .stretch)
//                    .stroke(Color.red, lineWidth: 2)
            )
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
    }
}

//struct cookie_Previews: PreviewProvider {
//    static var previews: some View {
//        cookie(page: $page)
//    }
//}
