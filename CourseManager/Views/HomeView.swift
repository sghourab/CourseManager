//
//  ContentView.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-09-29.
//

import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift
import SwiftUI

struct HomeView: View {
    @State private var showingSheet = false
    @ObservedObject private var viewModel = CoursesViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.courses) { course in
                HStack {
                    Text(course.name)
                }
            }
            .onAppear {
                self.viewModel.fetchData()
            }

            .toolbar {
                Button {
                    showingSheet.toggle()
                } label: {
                    Text("Add Course")
                        .font(.headline)
                }.sheet(isPresented: $showingSheet) {
                    AddCourseSheet(courseName: "", courseURL: "", comments: "")
                }
            }
            .navigationTitle("Courses")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
