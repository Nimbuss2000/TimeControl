//
//  Conten.swift
//  TimeControl
//
//  Created by Alexey Larionov on 14.10.2024.
//

import Foundation
import Combine


class TimeControl: ObservableObject {

    @Published var curr_hour: Int?
    @Published var curr_min: Int?
    @Published var curr_sec: Int?
    
    var curr_date: Date?
    var subs: AnyCancellable?
    
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
    
