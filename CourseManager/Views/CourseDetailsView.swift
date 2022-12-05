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
    @AppStorage("isLogged") var isLogged = false
    var view = ContentView()

    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                LinearGradient(gradient: Gradient(colors: [MainColors.accent, .purple]), startPoint: .top, endPoint: .bottomLeading).ignoresSafeArea()
                ScrollView {
                    CourseDetailsRowView(course: viewModel.course)
                    
                    #warning("This code (lines 32 - 47) will be changed to remove all hardcoded data and have better logic during refactoring")
                    NavigationLink {
                        if viewModel.course.name == "SwiftUI Combine and Data" {
                            ContentViewSwiftUICombineCourse()
                        } else if viewModel.course.name == "Build a Swift UI app for iOS 15 parts 1-3" {
                            ContentView()
                        } else if viewModel.course.name == "UI and Animations in SwiftUI" {
                            ContentViewWeather()
                        }
                    } label: {
                        ButtonLabelStyle(label: "Open")
                            .padding()
                    }
                }
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
                .strokeStyle(cornerRadius: 30)
                .padding(20)
                .shadow(color: AppColors.shadow.opacity(0.4), radius: 5, x: 5, y: 5)
                .onAppear(perform: {
                    viewModel.getCourseInformation(courseID: courseID)
                    isLogged = false
                })
                
                .toolbar {
                    Button {
                        showingAddCourseSheet.toggle()
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .font(.title2)
                    }.sheet(isPresented: $showingAddCourseSheet, onDismiss: {
                        viewModel.getCourseInformation(courseID: courseID)
                    }) {
                        AddOrEditCourseSheet(course: CourseInformation(id: viewModel.course.id, name: viewModel.course.name, url: viewModel.course.url, imageName: viewModel.course.imageName, progressPercentage: 0.5, gitHubURL: viewModel.course.gitHubURL, status: viewModel.course.status, dateOfCompletion: viewModel.course.dateOfCompletion, comments: viewModel.course.comments))
                    }
                }
                .toolbar(.hidden, for: .tabBar)
            }
            .navigationTitle("Course Information")
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
