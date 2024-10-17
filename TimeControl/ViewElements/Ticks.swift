//
//  Ticks.swift
//  TimeControl
//
//  Created by Alexey Larionov on 17.10.2024.
//

import SwiftUI

struct Ticks: View {
    let h_size: (w: CGFloat, h: CGFloat)
    let m_size: (w: CGFloat, h: CGFloat)
    let screen_width: CGFloat
    let offset: CGFloat
    
    var body: some View {
        ZStack {
            ForEach(0..<60) {
                tick in VStack {
                    if tick % 5 == 0{
                        ZStack {
                            Rectangle()
                                .fill(Color.primary)
                                .frame(width: h_size.w, height: h_size.h)
                            Text("\(tick == 0 ? 12 : tick/5)")
                                .rotationEffect(Angle.degrees(-180-Double(tick)/60*360))
                                .offset(y: -offset-10)
                        }
                    } else {
                        Rectangle()
                            .fill(Color.primary)
                            .frame(width: m_size.w, height: m_size.h)
                    }
                }
                .offset(y: screen_width - offset)
                .rotationEffect(Angle.degrees(180+Double(tick)/60*360))
            }
        }
    }
}

#Preview {
    Ticks(h_size: (w: 3, h: 18), m_size: (w: 1, h: 15), screen_width: UIScreen.main.bounds.size.width/2, offset: 15)
}
