//
//  AngularButtonStyle.swift
//  SwiftUIPractice1
//
//  Created by Summer Crow on 2022-10-12.
//

import SwiftUI

struct AngularButtonStyle: ButtonStyle {
    @Environment(\.controlSize) var controlSize

    var extraPadding: CGFloat {
        switch controlSize {
        case .mini:
            return 0
        case .small:
            return 0
        case .regular:
            return 4
        case .large:
            return 12
        @unknown default:
            return 0
        }
    }

    var cornerRadius: CGFloat {
        switch controlSize {
        case .mini:
            return 12
        case .small:
            return 12
        case .regular:
            return 16
        case .large:
            return 20
        @unknown default:
            return 12
        }
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 10 + extraPadding)
            .padding(.vertical, 4 + extraPadding)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(.linearGradient(colors: [Color(.systemBackground), Color(.systemBackground).opacity(0.8)], startPoint: .top, endPoint: .bottom))
                    .blendMode(.softLight)
            )
            .background(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(.angularGradient(colors: [MainColors.accent, .blue, MainColors.accent], center: .center, startAngle: .degrees(-90), endAngle: .degrees(270)))
                    .blur(radius: cornerRadius)
            )
            .strokeStyle(cornerRadius: cornerRadius)
    }
}

extension ButtonStyle where Self == AngularButtonStyle {
    static var angular: Self {
        return .init()
    }
}
