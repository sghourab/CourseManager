//
//  PrimaryButton.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-10-24.
//

import SwiftUI

struct PrimaryButton: View {
    @AppStorage("isLiteMode") var isLiteMode: Bool = false

    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var text: String = "Contact Support"

    var body: some View {
        if colorScheme == .light {
            lightModeButton
        } else {
            darkModeButton
        }
    }

    var lightModeButton: some View {
        VStack {
            Text(text)
                .font(.headline)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3373903036, green: 0.2152278125, blue: 0.887358427, alpha: 1)), Color(#colorLiteral(red: 0.5647058824, green: 0.462745098, blue: 0.9058823529, alpha: 1))]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(16)
        .foregroundColor(.white)
    }

    var darkModeButton: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .frame(height: 50)
                .angularGradientGlow(colors: [Color(#colorLiteral(red: 0.3697733541, green: 0.4473969421, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.5660677474, blue: 0.9790537091, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.8410691433, blue: 0.9285136737, alpha: 1)), Color(#colorLiteral(red: 0.8774839917, green: 1, blue: 0.914270342, alpha: 1)), Color(#colorLiteral(red: 0.6685520482, green: 0.678122099, blue: 1, alpha: 1))])
                .ifMode(!isLiteMode, transform: { view in
                    view.blur(radius: 8)
                })
            Text(text)
                .linearGradientBackground(colors: [Color(#colorLiteral(red: 0.751439087, green: 0.7580721035, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.6807572128, blue: 0.924120021, alpha: 1))])
                .font(.headline)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(Color(red: 0.12, green: 0.012, blue: 0.42).opacity(0.9))
                .cornerRadius(16)
                .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.white, lineWidth: 1).blendMode(.overlay))
        }
        .frame(height: 50)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PrimaryButton()
            PrimaryButton()
                .environment(\.colorScheme, .dark)
        }
    }
}
