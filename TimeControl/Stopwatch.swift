//
//  Stopwatch.swift
//  TimeControl
//
//  Created by Alexey Larionov on 14.10.2024.
//

import Foundation


class Stopwatch {
    
    var start_time = 0
    var end_time = 0
    
    func start_stopwatch(curr_time: MyClass) {
        start_time = curr_time.curr_min
    }
    
    func stop_stopwatch(curr_time: MyClass) {
        end_time = curr_time.curr_min
    }
    
}
