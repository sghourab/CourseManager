//
//  LineProgressView.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-12-13.
//

import SwiftUI

struct LineProgressView: View {
    var value: CGFloat = 1
    @State var appear: Bool = false
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                GeometryReader { proxy in
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .frame(width: appear ? proxy.size.width * value : 0)
                        .foregroundStyle(LinearGradient(colors: [AppColor.accent, .blue, .teal, .green, .red, .purple], startPoint: .leading, endPoint: .trailing))
                }
            }
            .padding(7)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(AppColor.accent, lineWidth: 2)
            )
            .background(
                RoundedRectangle(cornerRadius: 15, style: .continuous).fill(.ultraThinMaterial)
            )
            
        }.frame(maxWidth: .infinity)
            .frame(height: 30)
            .padding()
            .shadow(color: AppColor.shadow.opacity(0.7), radius: 5, x: 5, y: 5)
            .onAppear {
                withAnimation(.easeIn(duration: 0.8)) {
                    appear = true
                }
            }
    }
}

struct LineProgressView_Previews: PreviewProvider {
    static var previews: some View {
        LineProgressView()
    }
}
