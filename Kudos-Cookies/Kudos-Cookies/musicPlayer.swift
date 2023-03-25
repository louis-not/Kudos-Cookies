//
//  musicPlayer.swift
//  Kudos-Cookies
//
//  Created by Louis Mayco Dillon Wijaya on 24/03/23.
//

import AVFoundation

var audioPlayer:AVAudioPlayer?

func playSound(sound: String, type: String){
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
            audioPlayer?.numberOfLoops = -1
        } catch {
            print("ERROR: Couldn't find sound file!")
        }
    }
}


