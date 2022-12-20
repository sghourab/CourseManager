//
//  HandbookItem.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-11-11.
//

import SwiftUI

struct HandbookItem: View {
    var handbook: Handbook = CourseMockData.MockData.handbooks[0]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            RoundedRectangle(cornerRadius: 20)
                .fill(.black.opacity(0.2))
                .blendMode(.overlay)
                .frame(height: 90)
                .overlay(
                    Image(handbook.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 100)
                )
            Text(handbook.title)
                .fontWeight(.semibold)
                .padding(.top, 8)
                .layoutPriority(1)
            Text(handbook.subtitle)
                .font(.caption.weight(.medium))
                .foregroundStyle(.secondary)
            Text(handbook.text)
                .font(.caption)
                .foregroundStyle(.secondary)
                .lineLimit(3)
            Spacer()
        }
        .padding()
        .frame(maxWidth: 200)
        .frame(height: 260)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(LinearGradient(colors: [handbook.colorTop, handbook.colorBottom], startPoint: .top, endPoint: .bottomTrailing))
                .rotation3DEffect(.degrees(10), axis: (x: 0, y: 1, z: 0), anchor: .bottomTrailing)
                .rotationEffect(.degrees(180))
                .padding(.trailing, 40)
        )
        .shadow(color: .clear, radius: 0, x: 0, y: 0)
    }
}

struct HandbookItem_Previews: PreviewProvider {
    static var previews: some View {
        HandbookItem(handbook: CourseMockData.MockData.handbooks[1])
    }
    
}


