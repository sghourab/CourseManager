//
//  ProgressViews.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-12-13.
//

import SwiftUI

struct ProgressViews: View {
    @State var value: Double = 0.5
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 0) {
                CircleProgressView(value: value, percent: "80", lineWidth: 15)
                    .padding(.horizontal, 50)

                LineProgressView(value: value)
                    .padding(.bottom, 80)

                Spacer()
                
                percentageProgressSection
                    .padding(.bottom, 20)

                Spacer()
            }
        }
    }

    var percentageProgressSection: some View {
        HStack {
            Text("0%")
            Slider(value: $value)
            Text("100%")
        }
        .tint(AppColor.accent)
        .foregroundColor(.white)
        .padding()
    }
}

struct ProgressViews_Previews: PreviewProvider {
    static var previews: some View {
        ProgressViews()
    }
}
