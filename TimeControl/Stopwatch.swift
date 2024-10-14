//
//  Stopwatch.swift
//  TimeControl
//
//  Created by Alexey Larionov on 14.10.2024.
//

import Foundation
import Combine


struct Stopwatch {
    
    var start_time: Date?
    var end_time: Date?
    var duration: Int=0
    
    init(start: Date?) {
        start_time = start
        end_time = nil
    }
    
    mutating func calc_duration() {
        let calendar_start = Calendar.current.component(.second, from: start_time!)
        let calendar_finish = Calendar.current.component(.second, from: end_time!)
        duration = calendar_finish - calendar_start
    }
}
