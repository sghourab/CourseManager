//
//  Extensions.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-11-09.
//

import SwiftUI

extension Color {
    static let weatherBackground = LinearGradient(gradient: Gradient(colors: [Color("Weather Background 1"), Color("Weather Background 2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
    static let bottomSheetBackground = LinearGradient(gradient: Gradient(colors: [Color("Weather Background 1").opacity(0.26), Color("Weather Background 2").opacity(0.26)]), startPoint: .topLeading, endPoint: .bottomTrailing)
    static let navBarBackground = LinearGradient(gradient: Gradient(colors: [Color("Weather Background 1").opacity(0.1), Color("Weather Background 2").opacity(0.1)]), startPoint: .topLeading, endPoint: .bottomTrailing)
    static let tabBarBackground = LinearGradient(gradient: Gradient(colors: [Color("Weather Tab Bar Background 1").opacity(0.26), Color("Weather Tab Bar Background 2").opacity(0.26)]), startPoint: .top, endPoint: .bottom)
    static let weatherWidgetBackground = LinearGradient(gradient: Gradient(colors: [Color("Weather Widget Background 1"), Color("Weather Widget Background 2")]), startPoint: .leading, endPoint: .trailing)
    static let bottomSheetBorderMiddle = LinearGradient(gradient: Gradient(stops: [.init(color: .white, location: 0), .init(color: .clear, location: 0.2)]), startPoint: .top, endPoint: .bottom)
    static let bottomSheetBorderTop = LinearGradient(gradient: Gradient(colors: [.white.opacity(0), .white.opacity(0.5), .white.opacity(0)]), startPoint: .leading, endPoint: .trailing)
    static let underline = LinearGradient(gradient: Gradient(colors: [.white.opacity(0), .white, .white.opacity(0)]), startPoint: .leading, endPoint: .trailing)
    static let tabBarBorder = Color("Weather Tab Bar Border").opacity(0.5)
    static let forecastCardBackground = Color("Weather Forecast Card Background")
    static let probabilityText = Color("Weather Probability Text")
    static let background = Color("Background")
}

enum MyColor {
   

    static let blu = Color("Background")
    static let whit = Color("White")
}

extension View {
    func innerShadow<S: Shape, SS: ShapeStyle>(shape: S, color: SS, lineWidth: CGFloat = 1, offsetX: CGFloat = 0, offsetY: CGFloat = 0, blur: CGFloat = 4, blendMode: BlendMode = .normal, opacity: Double = 1) -> some View {
        self
            .overlay {
                shape
                    .stroke(color, lineWidth: lineWidth)
                    .blendMode(blendMode)
                    .offset(x: offsetX, y: offsetY)
                    .blur(radius: blur)
                    .mask(shape)
                    .opacity(opacity)
            }
    }
}
