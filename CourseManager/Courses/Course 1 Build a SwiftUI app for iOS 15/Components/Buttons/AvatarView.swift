//
//  AvatarView.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-11-11.
//

import SwiftUI

struct AvatarView: View {
    @AppStorage("isLogged") var isLogged = true
    var body: some View {
        Group {
            if isLogged {
                AsyncImage(url: URL(string: "https://picsum.photos/200"), transaction: Transaction(animation: .easeOut)) {
                    phase in
                    switch phase {
                    case let .success(image):
                        image.resizable()
                            .transition(.scale(scale: 0.5, anchor: .center))
                    case .empty:
                        ProgressView()
                    case .failure:
                        Color.gray
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Image("Avatar Default")
                    .resizable()
            }
        }
        .frame(width: 26, height: 26)
        .cornerRadius(10)
        .padding(8)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
        .strokeStyle(cornerRadius: 18)
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(isLogged: false)
    }
}

