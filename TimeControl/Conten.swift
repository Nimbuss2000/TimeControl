//
//  Conten.swift
//  TimeControl
//
//  Created by Alexey Larionov on 14.10.2024.
//

import Foundation
import Combine


class MyClass: ObservableObject {

    @Published var curr_hour: Int = 0
    @Published var curr_min: Int = 0
    @Published var curr_sec: Int = 0
//
//    let timerr = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { timer in
//        print("Timer fired!")
//    }
//
    var subs: AnyCancellable?
        
    func timer() {
        subs = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { date in
                let calendar = Calendar.current
                self.curr_hour = calendar.component(.hour, from: date)
                self.curr_min = calendar.component(.minute, from: date)
                self.curr_sec = calendar.component(.second, from: date)
            }
        
//        let timer = Timer()
//
//
//        while true {
////            let d = Date()
//            let calendar = Calendar.current
//
//            let minute = calendar.component(.minute, from: Date())
//
//            await MainActor.run {
//                if currminute != minute {
//                    currminute = minute
//                }
//            }
//            try? await Task.sleep(nanoseconds: 5_000_000_000)
//        }
    }
}
    
