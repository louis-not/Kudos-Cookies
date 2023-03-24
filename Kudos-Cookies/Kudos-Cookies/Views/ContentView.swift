//
//  ContentView.swift
//  Kudos-Cookies
//
//  Created by Louis Mayco Dillon Wijaya on 20/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var kudosManager = KudosManager()
    @State private var index:Int = 0
    @State private var name:String = "Alice"
    @State var page = 1
    @State var motion = Motion()
    @State var cookieCount:Int = 5
    
    // Dragging state
//    @State private var isDragging = false
//    @State var position = CGSize.zero
    
//    init() {
//        motion.gyro()
//        motion.accelerometer()
//    }
    
    init(){
        playSound(sound:"light-step-081", type: "mp3")
    }
    
    var body: some View {
        ZStack{
            // Background Color
            Color(red: 0.9568627450980393, green: 0.8627450980392157, blue: 0.7607843137254902)
                .ignoresSafeArea()
            
            // Views
            VStack {
                if page == 1 {
                    NameView(kudosManager: $kudosManager, page: $page)
                } else if page == 2 {
                    homeView(kudosManager: $kudosManager, cookieCount: $cookieCount, page: $page )
                } else if page == 3 {
                    CrackedView(kudosManager: $kudosManager, page: $page, kudos: kudosManager.getRandomKudos())
                }
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
