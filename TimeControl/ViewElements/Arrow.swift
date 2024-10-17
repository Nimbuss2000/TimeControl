//
//  Arrow.swift
//  TimeControl
//
//  Created by Alexey Larionov on 16.10.2024.
//

import SwiftUI


enum Arrows {
    case hour
    case minute
    case second
    
    var color: Color {
        switch self {
        case.hour: return Color(hex: 0x891446)
        case.minute: return Color(hex: 0x873260)
        case.second: return Color(hex: 0x6d2b50)
        }
    }
    
    var coeff: CGFloat {
        switch self {
        case.hour: return 0.4
        case.minute: return 0.6
        case.second: return 1
        }
    }
}

struct Arrow: View {
    let arrow_type: Arrows
    let half_screen: CGFloat
        
    var body: some View {
        Rectangle()
            .fill(arrow_type.color)
            .clipShape(Capsule())
            .frame(width: 4, height: half_screen * arrow_type.coeff)
            .offset(y: -(half_screen * arrow_type.coeff)/2)
    }
}

#Preview {
    Arrow(arrow_type: Arrows.hour, half_screen: 200)
}

extension Color {
    init (hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}
