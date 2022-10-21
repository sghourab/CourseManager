//
//  GradientIcon.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-10-21.
//

import SwiftUI

struct GradientIcon: View {
    var icon: String = "questionmark"
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6808851361, green: 0.7434214354, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.654221952, blue: 0.9848131537, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .mask(Image(systemName: icon).font(.system(size: 17)))
            .background(Color(red: 0.102, green: 0.07, blue: 0.24).opacity(0.8))
            .frame(width: 36, height: 36)
            .mask(RoundedRectangle(cornerRadius: 12, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 12, style: .continuous).stroke(lineWidth: 1).foregroundColor(.white).blendMode(.overlay))
    }
}

struct GradientIcon_Previews: PreviewProvider {
    static var previews: some View {
        GradientIcon()
    }
}
