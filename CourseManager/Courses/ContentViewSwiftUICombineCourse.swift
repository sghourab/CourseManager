//
//  ContentView.swift
//  SwiftUICombineAndData
//
//  Created by Summer Crow on 2022-10-20.
//

import SwiftUI

struct ContentViewSwiftUICombineCourse: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State private var contentOffset = CGFloat(0)
    @State private var showCertificates: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                TrackableScrollView(offsetChanged: {
                    offset in
                    contentOffset = offset.y
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
            .background(AccountBackground())
            .navigationBarHidden(true)
        }
        .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
       // Updated the code below (line 37) to use color from Assests. Denis commented on last week pull request which I updated this week.
        .accentColor(Color("NavigationViewColor"))
    }
    
    private var content: some View {
        VStack {
            
            ProfileRow()
                .onTapGesture {
                    showCertificates.toggle()
                }
            
            VStack {
                NotificationRow()
                
                divider
                
                LiteModeRow()
            }
            .blurBackground()
            .padding(.top, 20)
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
            .blurBackground()
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
        .sheet(isPresented: $showCertificates) {
            CertificatesView()
        }
    }
    
    var divider: some View {
        Divider().background(Color.white.blendMode(.overlay))
    }
}

struct ContentViewSwiftUICombineCourse_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewSwiftUICombineCourse()
    }
}
