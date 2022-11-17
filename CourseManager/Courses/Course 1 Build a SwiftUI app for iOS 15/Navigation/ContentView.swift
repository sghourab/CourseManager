//
//  FirstView.swift
//  SwiftUIPractice1
//
//  Created by Summer Crow on 2022-09-26.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @AppStorage("showModal") var showModal = false
    @EnvironmentObject var model: Model

    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch selectedTab {
                case .home:
                    HomeView()
                case .explore:
                    ExploreView()
                case .notifications:
                    NotificationView()
                case .library:
                    LibraryView()
                }
            }

            TabBar()
                .offset(y: model.showDetail ? 200 : 0)
            if showModal {
                ZStack {
                    ModalView()
                }
                .zIndex(1)
                .accessibilityAddTraits(.isModal)
            }
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            Color.clear.frame(height: 88)
        }
        .dynamicTypeSize(.large ... .xxLarge)
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
                .previewDevice("iPhone 13 mini")
        }.environmentObject(Model())
    }
}
