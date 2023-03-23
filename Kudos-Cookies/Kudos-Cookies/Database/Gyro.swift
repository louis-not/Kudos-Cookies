//
//  Gyro.swift
//  Kudos-Cookies
//
//  Created by Sheren Emanuela on 23/03/23.
//

import Foundation
import CoreMotion

public class Gyroscope {
    
    var motion = CMMotionManager()
    
    func gyro() {
        motion.gyroUpdateInterval = 0.5
        motion.startGyroUpdates(to: OperationQueue.current!){ (data, error) in
            if let trueData = data {
                print(trueData.rotationRate.x)
                print(trueData.rotationRate.y)
            } else {
                print("hi")
            }
        }
    }
}
