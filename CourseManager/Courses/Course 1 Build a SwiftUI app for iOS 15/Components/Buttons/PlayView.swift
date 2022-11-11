//
//  PlayView.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-11-11.
//

import SwiftUI

struct PlayView: View {
    var body: some View {
        Image(systemName: "play.fill")
            .foregroundColor(Color("Shadow").opacity(0.8))
            .font(.system(size: 60))
            .overlay(Image(systemName: "play")
                .font(.system(size: 60))
                .foregroundColor(.white.opacity(0.8)))
            .background(
                LinearGradient(gradient: Gradient(colors: [.blue, .red, .blue]), startPoint: .leading, endPoint: .trailing)
                    .mask(
                        Image(systemName: "play.fill")
                            .font(.system(size: 61)))
                    .blur(radius: 15)
            )
            .foregroundStyle(.white)
            .frame(width: 120, height: 120)
            .background(.ultraThinMaterial, in:
                            RoundedRectangle(cornerRadius: 46, style: .continuous))
            .strokeStyle(cornerRadius: 46)
            .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
            .overlay(
                Text("12:08")
                    .font(.footnote.weight(.semibold))
                    .padding(.vertical, 2)
                    .padding(.horizontal, 4)
                    .background(Color(UIColor.systemBackground).opacity(0.3))
                    .cornerRadius(4)
                    .offset(y: 44)
        )
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
    }
}

