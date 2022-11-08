//
//  CourseDetailsView.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-10-03.
//

import SwiftUI

struct CourseDetailsView: View {
    var courseID: String
    @StateObject var viewModel = CourseDetailsViewModel()
    @State private var showingAddCourseSheet: Bool = false
    @State private var isOpeningCourse = false
    var view = ContentView()

    var body: some View {
        Form {
            courseNameSection
            courseLinkSection
            if viewModel.course.gitHubURL != "" {
                gitHubLinkSection
            }
            statusSection
            if viewModel.course.status == .complete {
                dateCompletedSection
            }
            if viewModel.course.comments != "" {
                commentsSection
            }
            
            #warning("This code (lines 32 - 47) will be changed to remove all hardcoded data and have better logic during refactoring")
            if viewModel.course.name == "SwiftUI Combine and Data " {
                NavigationLink {
                    ContentViewSwiftUICombineCourse()
                } label: {
                    ButtonLabelStyle(label: "Open")
                }

            } else if viewModel.course.name == "Build a SwiftUI app for iOS 15"{
                //working on refactoring course 1 to integrate into main app
               // Button {
                //    viewModel.goToSecondaryApp()
                NavigationLink {
                    ContentView()
                  //  ContentViewSwiftUICombineCourse()
                } label: {
                    ButtonLabelStyle(label: "Open")
                }
            }
            Spacer()
            
        }.onAppear(perform: {
            viewModel.getCourseInformation(courseID: courseID)
        })
        .navigationTitle("Course Information")

        .toolbar {
            Button {
                showingAddCourseSheet.toggle()
            } label: {
                Image(systemName: "square.and.pencil")
                    .font(.title2)

            }.sheet(isPresented: $showingAddCourseSheet, onDismiss: {
                viewModel.getCourseInformation(courseID: courseID)
            }) {
                AddOrEditCourseSheet(course: CourseInformation(id: viewModel.course.id, name: viewModel.course.name, url: viewModel.course.url, gitHubURL: viewModel.course.gitHubURL, status: viewModel.course.status, dateOfCompletion: viewModel.course.dateOfCompletion, comments: viewModel.course.comments))
            }
        }
    }
    
    var courseNameSection: some View {
        HStack {
            Text("Course Name")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            Spacer()
            Text(viewModel.course.name)
                .font(.body)
                .foregroundColor(.secondary)
        }
    }
    
    var courseLinkSection: some View {
        HStack {
            Text("Course Link")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            Spacer()
            if let url = URL(string: viewModel.course.url) {
                Link(viewModel.course.url, destination: url)
            }
        }
    }
    
    var gitHubLinkSection: some View {
        HStack {
            Text("GitHub Link")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            Spacer()
            if let gitHubURL = viewModel.course.gitHubURL,
               let url = URL(string: gitHubURL)
            {
                Link(gitHubURL, destination: url)
            }
        }
    }
    
    var statusSection: some View {
        HStack {
            Text("Status")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            Spacer()
            Text(viewModel.course.status.localizedName)
                .font(.body)
                .foregroundColor(.secondary)
        }
    }
    
    var dateCompletedSection: some View {
        HStack {
            Text("Date Completed")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Spacer()
            Text(viewModel.course.dateOfCompletion, style: .date)
                .foregroundColor(.secondary)
        }
    }
    
    var commentsSection: some View {
        HStack {
            Text("Comments")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                    
            Spacer()
            if let comments = viewModel.course.comments {
                Text(comments)
                    .foregroundColor(.secondary)
            }
        }
    }
}
