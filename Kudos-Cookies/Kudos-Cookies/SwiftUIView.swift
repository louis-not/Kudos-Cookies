//
//  SwiftUIView.swift
//  Kudos-Cookies
//
//  Created by Louis Mayco Dillon Wijaya on 24/03/23.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var offset = CGSize.zero
    let minOffset = CGSize(width: -85, height: -180)
    let maxOffset = CGSize(width: 85, height: 180)
    
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
            Circle()
                .fill(Color.blue)
                .frame(width: 50, height: 50)
                .offset(offset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            let proposedOffset = CGSize(width: offset.width + value.translation.width, height: offset.height + value.translation.height)
                            offset = CGSize(width: min(max(proposedOffset.width, minOffset.width), maxOffset.width),
                                            height: min(max(proposedOffset.height, minOffset.height), maxOffset.height))
                        }
                        .onEnded { _ in
                            offset = offset
                        }
                )
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
