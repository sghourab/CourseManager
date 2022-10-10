//
//  AddCourseSheet.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-09-29.
//

import SwiftUI

struct AddOrEditCourseSheet: View {
    @StateObject var viewModel = AddOrEditCourseViewModel()
    @State var courseInfoToEdit = false
    @Environment(\.dismiss) var dismiss
    var course: CourseInformation

    init(course: CourseInformation) {
        self.course = course
    }

    var body: some View {
        NavigationView {
            Form {
                courseNameSection
                courseURLSection
                gitHubURLSection
                statusPickerSection
                if viewModel.course.status == .complete {
                    dateCompletedCalendarSection
                }
                commentsSection
                submitButtonSection
                    .disabled(disableForm)
            }.onAppear(perform: {
                setUpViewModelCourseInformationToEdit()
            })

            .navigationTitle("Course Information")
            .toolbar {
                Button {
                    handleXMarkTapped()
                } label: {
                    Image(systemName: "xmark")
                        .font(.title2)
                }
            }
        }
    }

    var courseNameSection: some View {
        Section(header: Text("Course Name")) {
            TextField("Enter course name", text: $viewModel.course.name)
        }.textFieldStyle(.roundedBorder)
    }

    var courseURLSection: some View {
        Section(header: Text("Course URL")) {
            TextField("Enter course URL", text: $viewModel.course.url)
        }.textFieldStyle(.roundedBorder)
    }

    var gitHubURLSection: some View {
        Section(header: Text("GitHub URL")) {
            TextField("Enter GitHub URL", text: $viewModel.course.gitHubURL)
        }.textFieldStyle(.roundedBorder)
    }

    var statusPickerSection: some View {
        Section {
            Picker("Status", selection: $viewModel.course.status) {
                ForEach(Status.allCases, id: \.self) { status in
                    Text(status.localizedName)
                        .tag(status)
                }
            }
        }
    }

    var dateCompletedCalendarSection: some View {
        Section(header: Text("Date completed")) {
            DatePicker("Date completed", selection: $viewModel.course.dateOfCompletion, displayedComponents: .date)
                .datePickerStyle(.compact)
                .labelsHidden()
        }
    }

    var commentsSection: some View {
        Section(header: Text("Comments")) {
            TextEditor(text: $viewModel.course.comments)
        }
    }

    var submitButtonSection: some View {
        Section {
            Button {
                handleSumitTapped()
            } label: {
                HStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .overlay(alignment: .center) {
                            Text("Submit")
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                                .font(.title3)
                        }
                        .padding(.horizontal, 20)
                }
            }
        }
    }

    var disableForm: Bool {
        viewModel.course.name.count < 5 || viewModel.course.url.count < 5
    }

    func setUpViewModelCourseInformationToEdit() {
        if course.name != "", course.url != "" {
            courseInfoToEdit = true
            viewModel.course = course
        }
    }

    func handleXMarkTapped() {
        dismiss()
    }

    func handleSumitTapped() {
        if courseInfoToEdit == true {
            viewModel.edit()
        }
        else {
            viewModel.save()
        }
        dismiss()
    }
}

struct AddCourseSheet_Previews: PreviewProvider {
    static var previews: some View {
        AddOrEditCourseSheet(course: CourseInformation(id: "abcd", name: "biology", url: "biology.com", gitHubURL: "github.com/biology", status: .todo, dateOfCompletion: Date(), comments: "will do this in a week"))
    }
}
