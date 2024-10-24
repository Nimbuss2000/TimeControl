//
//  Stopwatch.swift
//  TimeControl
//
//  Created by Alexey Larionov on 14.10.2024.
//

import Foundation
import Combine


class Stopwatch: ObservableObject {
    
    @Published var stopwatchTick: Int = 0 // 100 msec
    @Published var stopwatchSec: Int = 0
    @Published var stopwatchMin: Int = 0
    @Published var stopwatchs: [String: [String: Int]] = [:]
        
    var timer: Timer?

    var start: Date?
    var end: Date?

    
    func startTimer() {
        if timer == nil {
            start = Date()
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) {[self] _ in
                stopwatchTick += 1
                if stopwatchTick == 10 {
                    stopwatchSec += 1
                    stopwatchTick = 0
                }
                if stopwatchSec % 60 == 0 && stopwatchSec != 0{
                    stopwatchMin += 1
                }
            }
        } else {
            print("timer just run")
        }
    }
    
    func stopTimer() {
        if timer != nil {
            end = Date()
            timer?.invalidate()
            timer = nil
            
            stopwatchs["stopwatch_\(stopwatchs.count)"] = ["minutes": stopwatchMin, "seconds": stopwatchSec, "msecondsX100": stopwatchTick]
            
            stopwatchTick = 0
            stopwatchMin = 0
            stopwatchSec = 0
        }
    }
    
    var startButtonDiasabled: Bool {
        guard timer != nil else { return false}
        return true
    }
    
    var stopButtonDiasabled: Bool {
        guard timer != nil else { return true}
        return false
    }
}
