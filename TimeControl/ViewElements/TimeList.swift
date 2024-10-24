//
//  TimwList.swift
//  TimeControl
//
//  Created by Alexey Larionov on 20.10.2024.
//

import SwiftUI

struct TimeList: View {
    
    @StateObject var stopwatch: Stopwatch
    
    var body: some View {
        List {
            if (stopwatch.stopwatchs.count > 0 )  {
                ForEach (0 ..< stopwatch.stopwatchs.count, id: \.self) {
                    t in
                    Text("Min: \(stopwatch.stopwatchs["stopwatch_\(t)"]!["minutes"]!)   Sec: \(stopwatch.stopwatchs["stopwatch_\(t)"]!["seconds"]!)  mSecx100: \(stopwatch.stopwatchs["stopwatch_\(t)"]!["msecondsX100"]!)")
                }
            } else {
                Text("simple text")

            }

        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    TimeList(stopwatch: Stopwatch())
}
