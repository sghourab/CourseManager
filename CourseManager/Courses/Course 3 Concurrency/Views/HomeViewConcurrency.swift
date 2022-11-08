//
//  HomeViewConcurrency.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-11-01.
//

import SwiftUI

struct HomeViewConcurrency: View {
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                DateTitle(title: "Learn SwiftUI")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
                FeaturedCourseListConcurrency()
                    .padding(.top, 20)
                Text("All Courses")
                    .fontWeight(.bold)
                    .padding(.horizontal, 20)
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 40)
                CourseListConcurrency()
                    .padding(.top, 20)
                
            }
            Color(.white)
                .ignoresSafeArea()
                .frame(height: 0)
        }
    }
}

struct HomeViewConcurrency_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewConcurrency()
    }
}
