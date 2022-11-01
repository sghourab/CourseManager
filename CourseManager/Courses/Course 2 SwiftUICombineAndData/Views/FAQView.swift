//
//  FAQView.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-10-21.
//

import SwiftUI

struct FAQView: View {
    @State private var contentOffset = CGFloat(0)
    var body: some View {
        ZStack(alignment: .top) {
            TrackableScrollView(offsetChanged: { offsetPoint in
                contentOffset = offsetPoint.y
            }) {
                content
            }
            VisualEffectBlur(blurStyle: .systemMaterial)
                .opacity(contentOffset < -16 ? 1 : 0)
                .animation(.easeIn, value: contentOffset < -16)
                .ignoresSafeArea()
                .frame(height: 0)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .navigationTitle("FAQ")
        .background(Color("Background 2").edgesIgnoringSafeArea(.all))
    }

    var content: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(faqData, id: \.id) { faq in
                FAQRow(faq: faq)
            }
            Text("Have any questions?")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.subheadline)
                .opacity(0.7)
        }
        .padding(.horizontal, 20)
    }
}

struct FAQView_Previews: PreviewProvider {
    static var previews: some View {
        FAQView()
    }
}
