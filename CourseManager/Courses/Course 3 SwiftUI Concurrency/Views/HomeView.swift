//
//  HomeView.swift
//  SwiftUIConcurrency
//
//  Created by Summer Crow on 2022-10-31.
//

import SwiftUI

struct ConcurrencyHomeView: View {
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                DateTitle(title: "Learn SwiftUI")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
                FeaturedCourseList()
                    .padding(.top, 20)
                Text("All Courses")
                    .fontWeight(.bold)
                    .padding(.horizontal, 20)
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 40)
                CourseList()
                    .padding(.top, 20)
                
            }
            Color(.white)
                .ignoresSafeArea()
                .frame(height: 0)
        }
    }
}

struct ConcurrencyHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ConcurrencyHomeView()
    }
}
