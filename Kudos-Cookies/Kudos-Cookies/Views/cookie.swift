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
    @State var rotation = CGFloat.random(in:-90...90)
    let minOffset = CGSize(width: -80, height: -180)
    let maxOffset = CGSize(width: 80, height: 180)
    let motionActivity = Motion()
    let movementTimer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    let rotationTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var motionEnabled = true
    
    var body: some View {
        Image("Cookie")
            .resizable(resizingMode: .stretch)
            .scaledToFit()
            .frame(width: 100, height: 100)
            .rotationEffect(.degrees(rotation))
            .offset(currOffset)
            .animation(.linear, value: currOffset)
            .onReceive(movementTimer) { _ in
                if(motionEnabled) {
                    let proposedOffset = CGSize(
                        width: currOffset.width + motionActivity.getAccelerometerDataX(),
                        height: currOffset.height - motionActivity.getAccelorometerDataY())

                    currOffset = CGSize(
                        width: min(max(proposedOffset.width, minOffset.width), maxOffset.width),
                        height: min(max(proposedOffset.height, minOffset.height), maxOffset.height))

                    lastOffset = currOffset
                }
            }
            .onReceive(rotationTimer) { _ in
                if(motionEnabled && motionActivity.getAccelerometerDataX() > 2 && currOffset.width > minOffset.width && currOffset.width < maxOffset.width) {
                    rotation += motionActivity.getGyroDataX()
                }
                if(motionEnabled && motionActivity.getAccelorometerDataY() > 2 && currOffset.height < maxOffset.height) {
                    rotation += motionActivity.getGyroDataY()
                }
            }
            .gesture(
                DragGesture()
                    .onChanged({ dragValue in
                        motionEnabled = false
                        
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
                        if currOffset.height > -180 {
                            currOffset.height = lastOffset.height
                            lastOffset.width = currOffset.width
                        }
                        motionEnabled = true
                    })
                )
        }
}

//struct cookie_Previews: PreviewProvider {
//    static var previews: some View {
//        cookie(page: $page)
//    }
//}
