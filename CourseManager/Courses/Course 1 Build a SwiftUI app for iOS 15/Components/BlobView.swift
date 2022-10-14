//
//  BlobView.swift
//  SwiftUIPractice1
//
//  Created by Summer Crow on 2022-09-27.
//

import SwiftUI

struct BlobView: View {
    @State var appear = false
    var body: some View {
        // BlobShape()
        TimelineView(.animation) { timeline in
            let now = timeline.date.timeIntervalSinceReferenceDate
            let angle = Angle.degrees(now.remainder(dividingBy: 3)*30)
            let x = cos(angle.radians)
            let angle2 = Angle.degrees(now.remainder(dividingBy: 6)*5)
            let x2 = cos(angle2.radians)
            // Text("Value: \(x)")

            Canvas { context, size in
                context.fill(path(in: CGRect(x: 0, y: 0, width: size.width, height: size.height), x: x, x2: x2), with: .linearGradient(Gradient(colors: [.pink, .blue]), startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 200, y: 200)))
            }
            .frame(width: 250, height: 250)
            .foregroundStyle(.linearGradient(colors: [.pink, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
            .rotationEffect(.degrees(appear ? 360 : 0))
        }
        .onAppear {
            withAnimation(.linear(duration: 18).repeatForever(autoreverses: true)) {
                appear = true
            }
        }
    }

    func path(in rect: CGRect, x: Double, x2: Double) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.48389*width, y: 0.9584*height))
        path.addCurve(to: CGPoint(x: 0.9394*width*x2, y: 0.49081*height), control1: CGPoint(x: 0.72797*width, y: 0.9584*height), control2: CGPoint(x: 0.80071*width, y: 0.71026*height))
        path.addCurve(to: CGPoint(x: 0.48389*width, y: 0.02322*height), control1: CGPoint(x: 1.07814*width, y: 0.27129*height*x), control2: CGPoint(x: 0.83347*width, y: 0.1297*height*x))
        path.addCurve(to: CGPoint(x: 0.02838*width, y: 0.49081*height), control1: CGPoint(x: 0.13432*width, y: -0.08326*height*x2), control2: CGPoint(x: 0.10056*width*x2, y: 0.19444*height))
        path.addCurve(to: CGPoint(x: 0.48389*width, y: 0.9584*height), control1: CGPoint(x: -0.0438*width*x, y: 0.78719*height), control2: CGPoint(x: 0.23981*width*x, y: 0.9584*height*x2))
        path.closeSubpath()
        return path
    }
}

struct BlobView_Previews: PreviewProvider {
    static var previews: some View {
        BlobView()
    }
}

struct BlobShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.48389*width, y: 0.9584*height))
        path.addCurve(to: CGPoint(x: 0.9394*width, y: 0.49081*height), control1: CGPoint(x: 0.72797*width, y: 0.9584*height), control2: CGPoint(x: 0.80071*width, y: 0.71026*height))
        path.addCurve(to: CGPoint(x: 0.48389*width, y: 0.02322*height), control1: CGPoint(x: 1.07814*width, y: 0.27129*height), control2: CGPoint(x: 0.83347*width, y: 0.1297*height))
        path.addCurve(to: CGPoint(x: 0.02838*width, y: 0.49081*height), control1: CGPoint(x: 0.13432*width, y: -0.08326*height), control2: CGPoint(x: 0.10056*width, y: 0.19444*height))
        path.addCurve(to: CGPoint(x: 0.48389*width, y: 0.9584*height), control1: CGPoint(x: -0.0438*width, y: 0.78719*height), control2: CGPoint(x: 0.23981*width, y: 0.9584*height))
        path.closeSubpath()
        return path
    }
}
