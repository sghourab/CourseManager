//
//  TrackableScrollView.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-10-21.
//

import SwiftUI

struct TrackableScrollView<Content: View>: View {
    let axes: Axis.Set
    let offsetChanged: (CGPoint) -> Void
    let content: Content
    let coordinateSpaceName = "scrollView"

    init(axes: Axis.Set = .vertical, offsetChanged: @escaping (CGPoint) -> Void = { _ in }, @ViewBuilder content: () -> Content) {
        self.axes = axes
        self.offsetChanged = offsetChanged
        self.content = content()
    }

    var body: some View {
        SwiftUI.ScrollView(axes) {
            GeometryReader { geometry in
                Color.clear.preference(key: ScrollOffsetPreferenceKey.self, value: geometry.frame(in: .named(coordinateSpaceName)).origin)
            }
            .frame(width: 0, height: 0)

            content
        }
        .coordinateSpace(name: coordinateSpaceName)
        .onPreferenceChange(ScrollOffsetPreferenceKey.self, perform: offsetChanged)
    }
}

private struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero
    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {}
}
