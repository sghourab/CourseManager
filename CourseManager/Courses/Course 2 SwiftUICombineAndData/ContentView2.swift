//
//  ContentView.swift
//  SwiftUICombineAndData
//
//  Created by Summer Crow on 2022-10-20.
//

import SwiftUI

struct ContentView2: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State private var contentOffset = CGFloat(0)
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                TrackableScrollView(offsetChanged: {
                    offset in
                    contentOffset = offset.y
                    print("contentOffset", contentOffset)
                }) {
                    content
                }
                VisualEffectBlur(blurStyle: .systemMaterial)
                    .opacity(contentOffset < -16 ? 1 : 0)
                    .animation(.easeIn)
                    .ignoresSafeArea()
                    .frame(height: 0)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .background(AccountBackground())
            .navigationBarHidden(true)
        }
        .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
        .accentColor(colorScheme == .dark ? .white : Color(red: 0.12, green: 0.012, blue: 0.42))
    }
    
    var content: some View {
        VStack {
            VStack {
                NavigationLink {
                    FAQView()
                } label: {
                    MenuRow()
                }
                divider
                
                NavigationLink {
                    PackagesView()
                } label: {
                    MenuRow(title: "SwiftUI Packages", leftIcon: "square.stack.3d.up.fill")
                }
                
                divider
                Link(destination: URL(string: "https://www.youtube.com")!) {
                    MenuRow(title: "YouTube Channel", leftIcon: "play.rectangle.fill", rightIcon: "link")
                }
            }
            .padding(16)
            .background(Color("Background 1"))
            .background(VisualEffectBlur(blurStyle: .systemUltraThinMaterialDark))
            .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous).stroke(Color.white, lineWidth: 1).blendMode(.overlay))
            .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .padding(.top, 20)
            
            Text("Version 1.0")
                .foregroundColor(.white.opacity(0.7))
                .padding(.top, 20)
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
                .font(.footnote)
        }
        .foregroundColor(.white)
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .padding(.bottom, 10)
    }
    
    var divider: some View {
        Divider().background(Color.white.blendMode(.overlay))
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
