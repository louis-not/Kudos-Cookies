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
    let minOffset = CGSize(width: -73, height: -180)
    let maxOffset = CGSize(width: 73, height: 169)
    let motionActivity = Motion()
    let movementTimer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    let rotationTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let sensitivity = 20.0
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
                    let x = motionActivity.getAccelerometerDataX()
                    let y = motionActivity.getAccelorometerDataY()
                    var proposedOffset = currOffset
                    
                    if(abs(x) > sensitivity) {
                        proposedOffset.width = currOffset.width + x
                    }

                    if(abs(y) > sensitivity) {
                        proposedOffset.height = currOffset.height - y
                    }

                    currOffset = CGSize(
                        width: min(max(proposedOffset.width, minOffset.width), maxOffset.width),
                        height: min(max(proposedOffset.height, minOffset.height + 62), maxOffset.height))

                    lastOffset = currOffset
                }
            }
            .onReceive(rotationTimer) { _ in
                if(motionEnabled && abs(motionActivity.getAccelerometerDataX()) > sensitivity && currOffset.width > minOffset.width && currOffset.width < maxOffset.width) {
                    rotation += motionActivity.getGyroDataX()
                }
                if(motionEnabled && abs(motionActivity.getAccelorometerDataY()) > sensitivity && currOffset.height > (minOffset.height + 62) && currOffset.height < maxOffset.height) {
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
