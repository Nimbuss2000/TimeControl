//
//  Conten.swift
//  TimeControl
//
//  Created by Alexey Larionov on 14.10.2024.
//

import Foundation
import Combine


class TimeControl: ObservableObject {

    @Published var curr_hour: Int = 0
    @Published var curr_min: Int = 0
    @Published var curr_sec: Int = 0
    
    var curr_date: Date?

    @Published var stopwatches = [Stopwatch]()
    var stopwatch: Stopwatch?
    
    var subs: AnyCancellable?
    
    func start_stopwatch() {
        stopwatch = Stopwatch(start: curr_date)
    }
    
    func finish_stopwatch() {
        stopwatch?.end_time = curr_date
        stopwatch?.calc_duration()
        stopwatches.append(stopwatch!)
        stopwatch = nil
    }
    
    func timer() {
        subs = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { date in
                let calendar = Calendar.current
                self.curr_hour = calendar.component(.hour, from: date)
                self.curr_min = calendar.component(.minute, from: date)
                self.curr_sec = calendar.component(.second, from: date)
                self.curr_date = date
            }
    }
}
    
