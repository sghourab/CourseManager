//
//  TabBarMain.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-11-30.
//

import SwiftUI

struct TabBarMain: View {
    var body: some View {
        TabView {
            CoursesView()
                .tabItem {
                    Label("Courses", systemImage: "books.vertical")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
            SampleListView()
                .tabItem {
                    Label("Achievements", systemImage: "apps.iphone")
                }
        }
    }
}

struct TabBarMain_Previews: PreviewProvider {
    static var previews: some View {
        TabBarMain()
    }
}
