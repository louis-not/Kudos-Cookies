//
//  ContentView.swift
//  Kudos-Cookies
//
//  Created by Louis Mayco Dillon Wijaya on 20/03/23.
//

import SwiftUI

struct ContentView: View {
    @State private var index:Int = 0
    @State private var name:String = "Alice"
    
    // Dragging state
//    @State private var isDragging = false
//    @State var position = CGSize.zero
    
    var body: some View {
        ZStack{
            // Background Color
            Color(red: 0.9568627450980393, green: 0.8627450980392157, blue: 0.7607843137254902)
                .ignoresSafeArea()
            
            // Home Element
            VStack {
//                homeView()
                CrackedView()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}
