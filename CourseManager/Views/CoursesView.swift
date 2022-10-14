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
        NavigationView {
            listOfCourses
                .onAppear {
                    self.viewModel.fetchData()
                }

                .toolbar {
                    Button {
                        showingSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .font(.title2)
                    }.sheet(isPresented: $showingSheet) {
                        AddOrEditCourseSheet(course: CourseInformation(id: "", name: "", url: "", gitHubURL: "", status: .todo, dateOfCompletion: Date(), comments: ""))
                    }
                }
                .navigationTitle("Courses")
        }
    }

    var listOfCourses: some View {
        List {
            ForEach(viewModel.courses) { course in

                NavigationLink {
                    if let courseID = course.id {
                        CourseDetailsView(courseID: courseID)
                    }
                } label: {
                    HStack {
                        Text(course.name)
                        Spacer()
                        Group {
                            course.status == .complete ? Status.complete.image : course.status == .inProgress ? Status.inProgress.image : Status.todo.image
                        }
                        .foregroundStyle(course.status == .todo ? Color.primary : Color.green, Color.primary)
                    }
                }
            }.onDelete { offsets in

                viewModel.handleOnDeleteSwipeAction(offSets: offsets)
            }
        }.listStyle(.automatic)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
