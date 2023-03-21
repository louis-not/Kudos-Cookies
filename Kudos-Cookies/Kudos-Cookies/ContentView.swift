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
    @State private var isDragging = false
    @State var position = CGSize(width: 0, height: 200)
    
    var body: some View {
        ZStack{
            // Background Color
            Color(red: 0.9568627450980393, green: 0.8627450980392157, blue: 0.7607843137254902)
                .ignoresSafeArea()
            
            // Home Element
            VStack {
                homeView()
            }
            
            // Cookie Object
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
                            position = .zero // CGSize(width: 0, height: 200)
                            isDragging = false
                        })
                )
                .ignoresSafeArea()
//                .background(isDragging ? Color.gray: Color.white)
    
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
