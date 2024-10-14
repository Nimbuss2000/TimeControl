//
//  ContentView.swift
//  TimeControl
//
//  Created by Alexey Larionov on 14.10.2024.
//

import SwiftUI


struct ContentView: View {
    @StateObject var curr_time = MyClass()
    
    let elem_offset: CGFloat = 15
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color(hue: 0.629, saturation: 0.705, brightness: 0.594, opacity: 0.911))
                    .clipShape(Capsule())
                    .frame(width: 4, height: UIScreen.main.bounds.size.width/2-elem_offset*8)
                    .offset(y: -UIScreen.main.bounds.size.width/4+elem_offset*4)
                    .rotationEffect(Angle.degrees(
                        (Double(curr_time.curr_min)/60+Double(curr_time.curr_hour))/12*360))
                
                Rectangle()
                    .fill(Color(hue: 0.682, saturation: 0.346, brightness: 0.276, opacity: 0.581))
                    .clipShape(Capsule())
                    .frame(width: 3, height: UIScreen.main.bounds.size.width/2-elem_offset*4)
                    .offset(y: -UIScreen.main.bounds.size.width/4+elem_offset*2)
                    .rotationEffect(Angle.degrees(Double(curr_time.curr_min)/60*360))

                
                Rectangle()
                    .fill(Color(hue: 0.578, saturation: 0.935, brightness: 0.289, opacity: 0.92))
                    .clipShape(Capsule())
                    .frame(width: 3, height: UIScreen.main.bounds.size.width/2 - elem_offset-10)
                    .offset(y: -UIScreen.main.bounds.size.width/4 + elem_offset/2+5)
                    .rotationEffect(Angle.degrees(Double(curr_time.curr_sec)/60*360))
                
                Circle()
                    .frame(width: 10)
                
                ForEach(0..<60) {
                    tick in VStack {
                        if tick % 5 == 0 {
                            ZStack{
                                Rectangle()
                                    .fill(Color.teal)
                                    .frame(width: 3, height: 18)
                                Text("\(tick == 0 ? 12 : tick/5)")
                                    .rotationEffect(Angle.degrees(-180-Double(tick)/60*360))
                                    .offset(y: -elem_offset-10)
                            }
                        } else {
                            Rectangle()
                                .fill(Color.primary)
                                .frame(width: 1, height: 15)
                        }
                    }
                    .offset(y: UIScreen.main.bounds.size.width/2 - elem_offset)
                    .rotationEffect(Angle.degrees(180+Double(tick)/60*360))
                }

            }
            .padding(.vertical, 150)
            .onAppear {
                curr_time.timer()
            }
            VStack{
                HStack {
                    Button {
//                        stopwatch.start_time(curr_time: curr_time)
                        print("start")
                    } label: {
                        Text("start").padding()
                    }
                    .buttonBorderShape(.circle)
                    .buttonStyle(.borderedProminent)
                    
                    Spacer()
                    
                    Button {
                        print("Stop")
                    } label: {
                        Text("stop").padding()
                    }
                    .buttonBorderShape(.circle)
                    .buttonStyle(.borderedProminent)
                }
                .padding(.horizontal)
                HStack {
                    Text ("Name")
                    Text ("start")
                    Text ("stop")
                    Text ("count")
                }
            }
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
