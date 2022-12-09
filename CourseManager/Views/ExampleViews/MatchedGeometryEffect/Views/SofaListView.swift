//
//  SofaListView.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-12-08.
//

import SwiftUI

struct SofaListView: View {
    @Namespace var namespace
    @State var selectedID = UUID()
    @State var show = false
    var body: some View {
        ZStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 300), spacing: 20)], spacing: 20) {
                    if !show {
                        sofaCards
                    }
                }
                if show {
                    sofaDetails
                }
            }.padding(.horizontal, 0)

            if show {
                minimizeDetailsButton
            }
        }
        .navigationBarBackButtonHidden(show ? true : false)
        .toolbar(.hidden, for: .tabBar)
    }

    var sofaCards: some View {
        ForEach(sofas) { sofa in
            SofaCard(namespace: namespace, sofa: sofa, show: $show)
                .onTapGesture {
                    withAnimation(.openCard) {
                        show.toggle()
                        selectedID = sofa.id
                    }
                }
        }
    }

    var sofaDetails: some View {
        ForEach(sofas) { sofa in
            if sofa.id == selectedID {
                SofaDetails(namespace: namespace, sofa: sofa)
                    .zIndex(1)
                    .transition(.asymmetric(
                        insertion: .opacity.animation(.easeInOut(duration: 1)),
                        removal: .opacity.animation(.easeInOut(duration: 0.5).delay(0.2))
                    ))
            }
        }
    }

    var minimizeDetailsButton: some View {
        Button {
            withAnimation(.closeCard) {
                show.toggle()
            }
        } label: {
            Image(systemName: "xmark")
                .font(.body.weight(.bold))
                .foregroundColor(.secondary)
                .padding(8)
                .background(.ultraThinMaterial, in: Circle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding(30)
        .padding(.top, 15)
        .ignoresSafeArea()
    }
}

struct SofaListView_Previews: PreviewProvider {
    static var previews: some View {
        SofaListView()
    }
}
