//
//  ContentView.swift
//  TimeControl
//
//  Created by Alexey Larionov on 14.10.2024.
//

import SwiftUI


struct ContentView: View {
    @StateObject var curr_time = TimeControl()
    
    let elem_offset: CGFloat = 15
    let board_offset: CGFloat = 15
    let screen_width = UIScreen.main.bounds.size.width/2
    let radian_coeff: Double = 60/360
    let radian_coeff_h: Double = 12/360
    
    var body: some View {
        VStack {
            ZStack {
                Arrow(arrow_type: Arrows.second, half_screen: screen_width-board_offset-10)
                    .rotationEffect(Angle.degrees(Double(curr_time.curr_sec)/radian_coeff))
                
                Arrow(arrow_type: Arrows.minute, half_screen: screen_width-board_offset-10)
                    .rotationEffect(Angle.degrees(Double(curr_time.curr_min)/radian_coeff))
                
                Arrow(arrow_type: Arrows.hour, half_screen: screen_width-board_offset-10)
                    .rotationEffect(Angle.degrees(
                        (Double(curr_time.curr_min)/60+Double(curr_time.curr_hour))/radian_coeff_h))
                
                Circle()
                    .frame(width: 20)
                
                Ticks(h_size: (w: 3, h: 18), m_size: (w: 1, h: 15), screen_width: screen_width, offset: board_offset)
            }
            .padding(.vertical, 150)
            .onAppear {
                curr_time.timer()
            }
            
            VStack{
                HStack {
                    Button {
                        curr_time.start_stopwatch()
                    } label: {
                        Text("start").padding()
                    }
                    .buttonBorderShape(.circle)
                    .buttonStyle(.borderedProminent)
                    
                    Spacer()
                    
                    Button {
                        curr_time.finish_stopwatch()
                        print("\(curr_time.stopwatches.count)")
                    } label: {
                        Text("stop").padding()
                    }
                    .buttonBorderShape(.circle)
                    .buttonStyle(.borderedProminent)
                }
                .padding(.horizontal)
                
                if curr_time.stopwatches.count == 0 {
                    List {
                        ForEach(0 ... 6, id: \.self) { timer_element in
                            Text("")
//                            HStack {
//                                Text("timer")
//                                Spacer()
//                                Text("time")
//                            }
//                            .padding(.horizontal)
                        }
                    }
                    .listStyle(PlainListStyle())
                } else {
                    List {
                        ForEach(0 ... curr_time.stopwatches.count, id: \.self) { timer_element in
                            Text("timer furstion: \(curr_time.stopwatches[0].duration)")
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
