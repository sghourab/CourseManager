//
//  ContentView.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-09-29.
//

import SwiftUI

struct CoursesView: View {
    @State private var showingSheet = false
    @State private var selectedCourseID = ""
    @ObservedObject private var viewModel = CoursesViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                AppColor.accent.ignoresSafeArea()

                listOfCourses

                    .onDisappear {
                        self.viewModel.firestoreListener?.remove()
                    }

                    .toolbar {
                        Button {
                            showingSheet.toggle()
                        } label: {
                            Image(systemName: "plus")
                                .font(.title2)
                        }.sheet(isPresented: $showingSheet) {
                            AddOrEditCourseSheet(course: CourseInformation(id: "", name: "", url: "", imageName: "", progressPercentage: 0.5, gitHubURL: "", status: .todo, dateOfCompletion: Date(), comments: ""))
                        }
                    }
            }
            .navigationTitle("Courses")
        }
    }

    var listOfCourses: some View {
        ScrollView {
            ForEach(viewModel.courses) { course in
                if let course = course, let courseID = course.id {
                    VStack {
                        ZStack(alignment: .bottomTrailing) {
                            VStack {
                                CourseRowImageItem(courseName: course.name, imageName: course.imageName)

                                    .padding(.horizontal, 20)
                                    .padding(.top, 20)
                            }
                            CircularProgressView(value: course.progressPercentage, courseID: courseID)
                                .offset(x: 0, y: 10)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
