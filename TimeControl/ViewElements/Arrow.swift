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
        case.hour: return Color(hex: 0x6f9940)
        case.minute: return Color(hex: 0x02075d)
        case.second: return Color(hex: 0xf5c71a)
        }
    }
    
    var coeff: CGFloat {
        switch self {
        case.hour: return 0.65
        case.minute: return 0.8
        case.second: return 1
        }
    }
}

struct Arrow: View {
    let arrow_type: Arrows
    let arrow_width: CGFloat
    let half_screen: CGFloat
        
    var body: some View {
        CustomArrow(radius: arrow_width/2)
            .fill(arrow_type.color)
//            .clipShape(Capsule())
            .frame(width: arrow_width, height: half_screen * arrow_type.coeff)
            .offset(y: -(half_screen * arrow_type.coeff)/2)  }
}

#Preview {
    Arrow(arrow_type: Arrows.hour, arrow_width: 20, half_screen: 200)
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

struct CustomArrow: Shape {
    
    let radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var trPath = Path()
        trPath.move(to: CGPoint(x: rect.midX, y: rect.minY))
        trPath.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        trPath.addArc(center: CGPoint(x: rect.midX, y: rect.maxY), radius: radius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 180), clockwise: true)
        trPath.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        return trPath
    }
}
