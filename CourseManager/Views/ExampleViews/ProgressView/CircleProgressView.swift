//
//  CircleProgressView.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-12-14.
//

import SwiftUI

struct CircleProgressView: View {
    var value: CGFloat = 0.95
    var percent: String = "95"
    @State var appear = false
    var lineWidth: Double = 8
    var body: some View {
        ZStack {
            Group {
                Circle()
                    .stroke()
                    .foregroundColor(AppColor.accent)
                    .background(
                        .ultraThinMaterial,
                        in: Circle()
                    )
                    .shadow(color: AppColor.shadow.opacity(0.7), radius: 5, x: 5, y: 5)

                Circle()
                    .trim(from: 0, to: appear ? value : 0)
                    .rotation(Angle(degrees: 270))
                    .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                    .fill(AngularGradient(colors: [AppColor.accent, .teal, .green, .red, .purple, .blue, AppColor.accent], center: .center))
                    .padding(20)
                    .onAppear {
                        withAnimation(.spring().delay(0.7)) {
                            appear = true
                        }
                    }
                    .background(
                        Circle()
                            .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                            .fill(Color(.gray).opacity(0.8))
                            .padding(20)
                    )
                    .overlay {
                        Text("\(Int(value * 100))%")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
            }
        }
        .onDisappear {
            appear = false
        }
    }
}

struct CircleProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgressView()
    }
}
