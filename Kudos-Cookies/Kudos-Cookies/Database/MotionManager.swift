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
   
    init() {
        motion.startGyroUpdates()
        motion.startAccelerometerUpdates()
    }
    
    func stopGyroUpdate() {
        motion.stopAccelerometerUpdates()
    }
    
    func stopAccelerometerUpdate() {
        motion.stopAccelerometerUpdates()
    }
    
    func getAccelerometerDataX() -> Double {
        if let data = self.motion.accelerometerData {
            return data.acceleration.x * 100
        }
        return 0
    }
    
    func getAccelorometerDataY() -> Double {
        if let data = self.motion.accelerometerData {
            return data.acceleration.y * 100
        }
        return 0
    }
    
    func getGyroDataX() -> Double {
        if let data = self.motion.gyroData {
            return data.rotationRate.x * 50
        }
        return 0
    }
    
    func getGyroDataY() -> Double {
        if let data = self.motion.gyroData {
            return data.rotationRate.y * 50
        }
        return 0
    }
    
}
