//
//  FiveStarRatingView.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-12-08.
//

import SwiftUI

struct FiveStarRatingView: View {
    @State var appear = false
    @State var rating: Double = 4.6
    var body: some View {
        ZStack {
            starsView
                .overlay(
                    overlayView
                )
                .mask(starsView)
        }
        .onAppear {
            withAnimation(.spring().delay(0.7)) {
                appear = true
            }
        }
    }

    private var starsView: some View {
        HStack(spacing: 0) {
            ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { _ in
                Image(systemName: "star.fill")
                    .foregroundColor(.gray)
            }
        }
    }

    private var overlayView: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(width: appear ? (CGFloat(rating) / 5 * geometry.size.width) : 0)
            }
        }
    }
}

struct FiveStarRatingView_Previews: PreviewProvider {
    static var previews: some View {
        FiveStarRatingView()
    }
}
