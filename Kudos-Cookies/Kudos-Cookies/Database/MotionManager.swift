//
//  GyroscopeManager.swift
//  Kudos-Cookies
//
//  Created by Sheren Emanuela on 23/03/23.
//

import Foundation
import CoreMotion

public class Motion {
    var motion = CMMotionManager()
    var rotateX = 0.0
    var rotateY = 0.0
    
    func gyro() {
        motion.startGyroUpdates()
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] _ in
            if let data = self.motion.gyroData {
                rotateX = data.rotationRate.x
                rotateY = data.rotationRate.y
                print(data.rotationRate.x)
            }
        }
    }
    
    func accelerometer() {
        motion.startAccelerometerUpdates()
        motion.accelerometerUpdateInterval = 1
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] _ in
            if let data = self.motion.accelerometerData {
                rotateX = data.acceleration.x
                rotateY = data.acceleration.y
                print(data.acceleration.x)
            }
        }
    }
}
