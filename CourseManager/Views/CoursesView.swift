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
                    CourseDetailsView(courseID: course.id!)
                } label: {
                    HStack {
                        Text(course.name)
                        Spacer()
                        Group {
                            if course.status == .complete {
                                Image(systemName: "rectangle.inset.filled")
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(Color.green, Color.black)
                            } else if course.status == .inProgress {
                                Image(systemName: "rectangle.lefthalf.inset.filled")
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(Color.green, Color.black)
                            } else {
                                Image(systemName: "rectangle")
                                    .foregroundStyle(Color.black)
                            }
                        }
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
