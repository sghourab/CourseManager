//
//  CircularProgressView.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-11-23.
//

import SwiftUI

struct CircularProgressView: View {
    var value: CGFloat = 0.95
    @State var appear = false
    @State var circularProgressViewIsTapped = false
    @State var courseID: String
    var lineWidth: Double = 8
    var body: some View {
        NavigationLink {
            CourseDetailsView(courseID: courseID)
        } label: {
            ZStack {
                Group {
                    Circle()
                        .foregroundColor(.clear)
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
                        .padding(10)
                        .onAppear {
                            withAnimation(.spring().delay(0.7)) {
                                appear = true
                            }
                        }
                        .background(
                            Circle()
                                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                                .fill(Color(.gray).opacity(0.8))
                                .padding(10)
                        )
                        .overlay {
                            Image(systemName: "chevron.right.circle.fill")
                                .font(.title)
                                .foregroundColor(AppColor.accent)
                        }
                }.padding(.horizontal, 10)
            }
            .onDisappear {
                appear = false
            }
        }
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(courseID: "abcd")
    }
}
