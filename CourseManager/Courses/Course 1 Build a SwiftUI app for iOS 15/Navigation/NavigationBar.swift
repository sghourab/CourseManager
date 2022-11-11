//
//  NavigationBar.swift
//  SwiftUIPractice1
//
//  Created by Summer Crow on 2022-10-05.
//

import SwiftUI

struct NavigationBar: View {
    var title = ""
    @State private var showSearch = false
    @State private var showAccount = false
    @AppStorage("showModal") var showModal = false
    @AppStorage("isLogged") var isLogged = false

    var body: some View {
        HStack(spacing: 16) {
            Button {
                showSearch = true

            } label: {
                Image(systemName: "magnifyingglass")
                    .font(.body.weight(.bold))
                    .frame(width: 36, height: 36)
                    .foregroundColor(.secondary)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                    .strokeStyle(cornerRadius: 14)
            }
            .sheet(isPresented: $showSearch) {
                SearchView()
            }

            Button {
                if isLogged {
                    showAccount = true
                } else {
                    withAnimation {
                        showModal = true
                    }
                }
            } label: {
                AvatarView()
            }
            .accessibilityElement()
            .accessibilityLabel("Account")
            .accessibilityAddTraits(.isButton)
            .sheet(isPresented: $showAccount) {
                AccountView()
            }
        }
    }
}
