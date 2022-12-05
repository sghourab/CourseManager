//
//  AddCourseSheet.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-09-29.
//

import SwiftUI

struct AddOrEditCourseSheet: View {
    @StateObject var viewModel = AddOrEditCourseViewModel()
    @State private var courseInfoToEdit = false
    @Environment(\.dismiss) var dismiss
    @State private var editViewIsOpened = false
    @State private var progressPercentage: Double = 0
    private var course: CourseInformation

    init(course: CourseInformation) {
        self.course = course
    }

    var body: some View {
        NavigationView {
            ZStack {
                MainColors.accent.ignoresSafeArea()
                Form {
                    courseNameSection
                    courseImageNameSection
                    courseURLSection
                    gitHubURLSection
                    percentageProgressSection
                    statusPickerSection
                    if viewModel.course.status == .complete {
                        dateCompletedCalendarSection
                    }
                    commentsSection
                    submitButtonSection
                        .disabled(isFormDisabled)
                }
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottomLeading), in: RoundedRectangle(cornerRadius: 30, style: .continuous))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: AppColors.shadow.opacity(0.4), radius: 5, x: 5, y: 5)
                .scrollContentBackground(.hidden)
                .padding(20)
                .onAppear(perform: {
                    if !editViewIsOpened {
                        setUpViewModelCourseInformationToEdit()
                    }
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
                .toolbar(.hidden, for: .tabBar)
            }
        }
    }

    var courseNameSection: some View {
        Section(header: Text("Course Name")) {
            TextField("Enter course name", text: $viewModel.course.name)
        }
        .textFieldStyle(.plain)
        .textFieldStyle(.roundedBorder)
        .listRowBackground(MainColors.accent.opacity(0.7))
    }

    var courseImageNameSection: some View {
        Section(header: Text("Course Image Name")) {
            TextField("Enter course image name", text: $viewModel.course.imageName)
        }
        .textFieldStyle(.plain)
        .textFieldStyle(.roundedBorder)
        .listRowBackground(MainColors.accent.opacity(0.7))
    }

    var courseURLSection: some View {
        Section(header: Text("Course URL")) {
            TextField("Enter course URL", text: $viewModel.course.url)
        }
        .textFieldStyle(.plain)
        .textFieldStyle(.roundedBorder)
        .listRowBackground(MainColors.accent.opacity(0.7))
    }

    var gitHubURLSection: some View {
        Section(header: Text("GitHub URL")) {
            TextField("Enter GitHub URL", text: $viewModel.course.gitHubURL)
        }
        .textFieldStyle(.plain)
        .textFieldStyle(.roundedBorder)
        .listRowBackground(MainColors.accent.opacity(0.7))
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
        .listRowBackground(MainColors.accent.opacity(0.7))
    }

    var percentageProgressSection: some View {
        Section(header: Text("Progress")) {
            Text("\(viewModel.course.progressPercentage * 100, specifier: "%.0f")% Complete")

            Slider(value: $viewModel.course.progressPercentage, in: 0 ... 1, step: 0.2) {
                Text("whatever")
            } minimumValueLabel: {
                Text("0")
            } maximumValueLabel: {
                Text("100")
            }

        }.listRowSeparator(.hidden)
            .listRowBackground(MainColors.accent.opacity(0.7))
    }

    var dateCompletedCalendarSection: some View {
        Section(header: Text("Date completed")) {
            DatePicker("Date completed", selection: $viewModel.course.dateOfCompletion, displayedComponents: .date)
                .datePickerStyle(.compact)
                .labelsHidden()
        }
        .listRowBackground(MainColors.accent.opacity(0.7))
    }

    var commentsSection: some View {
        Section(header: Text("Comments")) {
            TextEditor(text: $viewModel.course.comments)
        }
        .listRowBackground(MainColors.accent.opacity(0.7))
    }

    var submitButtonSection: some View {
        Section {
            Button {
                handleSubmitTapped()
            } label: {
                ButtonLabelStyle(label: "Submit")
            }
        }
        .listRowBackground(MainColors.accent.opacity(0.7))
    }

    var isFormDisabled: Bool {
        viewModel.course.name.count < 5 || viewModel.course.url.count < 5
    }

    func setUpViewModelCourseInformationToEdit() {
        editViewIsOpened = true
        if course.name != "", course.url != "" {
            courseInfoToEdit = true
            viewModel.course = course
        }
    }

    func handleXMarkTapped() {
        dismiss()
    }

    func handleSubmitTapped() {
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
        AddOrEditCourseSheet(course: CourseInformation(name: "biology", url: "biology.com", imageName: "Course1CoverImage", progressPercentage: 0.7, gitHubURL: "github.com/biology", status: .todo, dateOfCompletion: Date(), comments: "will do this in a week"))
    }
}
