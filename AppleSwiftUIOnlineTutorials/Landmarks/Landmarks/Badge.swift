//
//  Badge.swift
//  Landmarks
//
//  Created by guillaume MAIANO on 17/09/2019.
//


import SwiftUI


struct RotatedBadgeSymbol: View {
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: .init(degrees: 25))
    }
}

struct Badge: View {
    // Apple made it a static var, but I'd rather pass in the amount of points myself...
    var points: Int = 8

    var badgeSymbols: some View {
        ForEach(0..<points) { rotation in
          
            return RotatedBadgeSymbol(angle: .degrees(Double(rotation) / Double(self.points)) * 360.0)
        }
            .opacity(0.5)
    }

    var body: some View {
        ZStack {
            BadgeBackground()
            // Geometry reader checks the surrounding geometry
            GeometryReader { geometry in
                self.badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }.scaledToFit()
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}

struct BadgeSymbol: View {
    static let symbolColor = Color(red: 79.0 / 255, green: 79.0 / 255, blue: 191.0 / 255)
    
    var body: some View {

        GeometryReader { geometry in
            Path { path in
                let width = min(geometry.size.width, geometry.size.height)
                let height = width * 0.75
                let spacing = width * 0.030
                let middle = width / 2
                let topWidth = 0.226 * width
                let topHeight = 0.488 * height
                
                path.addLines([
                    CGPoint(x: middle, y: spacing),
                    CGPoint(x: middle - topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: topHeight / 2 + spacing),
                    CGPoint(x: middle + topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: spacing)
                ])
                // move(to:) inserts a gap
                path.move(to: CGPoint(x: middle, y: topHeight / 2 + spacing * 3))
                               path.addLines([
                                   CGPoint(x: middle - topWidth, y: topHeight + spacing),
                                   CGPoint(x: spacing, y: height - spacing),
                                   CGPoint(x: width - spacing, y: height - spacing),
                                   CGPoint(x: middle + topWidth, y: topHeight + spacing),
                                   CGPoint(x: middle, y: topHeight / 2 + spacing * 3)
                               ])
            }.fill(Self.symbolColor)
        }
    }
}

struct BadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        BadgeSymbol()
    }
}

struct BadgeBackground: View {
        var body: some View {
            GeometryReader { geometry in
                    Path { path in
                        var width: CGFloat = min(geometry.size.width, geometry.size.height)
                        let height = width
                        let xScale: CGFloat = 0.832
                        let xOffset = (width * (1.0 - xScale)) / 2.0
                        width *= xScale
                        path.move(
                            to: CGPoint(
                                x: xOffset + width * 0.95,
                                y: height * (0.20 + HexagonParameters.adjustment)
                            )
                        )
                        
                        HexagonParameters.points.forEach {
                            path.addLine(
                                to: .init(
                                    x: xOffset + width * $0.useWidth.0 * $0.xFactors.0,
                                    y: height * $0.useHeight.0 * $0.yFactors.0
                                )
                            )
                            
                            path.addQuadCurve(
                                to: .init(
                                    x: xOffset + width * $0.useWidth.1 * $0.xFactors.1,
                                    y: height * $0.useHeight.1 * $0.yFactors.1
                                ),
                                control: .init(
                                    x: xOffset + width * $0.useWidth.2 * $0.xFactors.2,
                                    y: height * $0.useHeight.2 * $0.yFactors.2
                                )
                            )
                        }
                    }
                    .fill(LinearGradient(
                        gradient: .init(colors: [Self.gradientStart, Self.gradientEnd]),
                        startPoint: .init(x: 0.5, y: 0),
                        endPoint: .init(x: 0.5, y: 0.6)
                    ))
                }
            }
            static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
            static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
