//
//  ContentView.swift
//  TimeControl
//
//  Created by Alexey Larionov on 14.10.2024.
//

import SwiftUI


struct ContentView: View {
    @StateObject var curr_time = TimeControl()
    @StateObject var stopwatch = Stopwatch()
    var emtyList: Bool = true
    
    let board_offset: CGFloat = 15
    let screen_width = UIScreen.main.bounds.size.width/2
    let radian_coeff: Double = 60/360
    let radian_coeff_h: Double = 12/360
    
    var body: some View {
        VStack {
            ZStack {
                if curr_time.curr_sec != nil {
                    Arrow(arrow_type: Arrows.second, arrow_width: 20, half_screen: screen_width-board_offset-10)
                        .rotationEffect(Angle.degrees(Double(curr_time.curr_sec!)/radian_coeff))
                    
                    Arrow(arrow_type: Arrows.minute, arrow_width: 20, half_screen: screen_width-board_offset-10)
                        .rotationEffect(Angle.degrees(Double(curr_time.curr_min!)/radian_coeff))
                    
                    Arrow(arrow_type: Arrows.hour, arrow_width: 20, half_screen: screen_width-board_offset-10)
                        .rotationEffect(Angle.degrees(
                            (Double(curr_time.curr_min!)/60+Double(curr_time.curr_hour!))/radian_coeff_h))
                    
                    Circle()
                        .fill(Color(hex: 0x44b6ff))
                        .frame(width: 10)
                }
                Spacer()
                Ticks(h_size: (w: 3, h: 18), m_size: (w: 1, h: 15), screen_width: screen_width, offset: board_offset)
                    .padding(.vertical, 200)
            }
            .onAppear {
                curr_time.timer()
            }
            
            VStack{
                HStack {
                    Button {
                        stopwatch.startTimer()
                    } label: {
                        Text("start")
                            .padding()
                    }
                    .disabled(stopwatch.startButtonDiasabled)
                    Spacer()
                    HStack {
                        if stopwatch.timer != nil {
                            Text("Minutes: \(stopwatch.stopwatchMin)\nSeconds: \(stopwatch.stopwatchSec)\nmSecondsX100: \(stopwatch.stopwatchTick)")
                                .monospacedDigit()
                        } else {
                            Text("Timer here")
                        }
                    }
                    Spacer()
                    Button {
                        stopwatch.stopTimer()
                    } label: {
                        Text("stop")
                            .padding()
                    }
                    .disabled(stopwatch.stopButtonDiasabled)
                }
                .padding(.horizontal)
                .buttonBorderShape(.circle)
                .buttonStyle(.borderedProminent)
                
                TimeList(stopwatch: stopwatch)
            }
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
