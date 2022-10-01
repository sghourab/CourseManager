//
//  AddCourseSheet.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-09-29.
//

import FirebaseCore
import FirebaseFirestore
import SwiftUI

struct AddCourseSheet: View {
    @StateObject var viewModel = CourseViewModel()
    @State var courseName: String
    @State var courseURL: String
    @State var selection = "To Do"
    @State var date = Date()
    @State var comments: String
    @Environment(\.dismiss) var dismiss
    var status = ["To Do", "In progress", "Complete"]
    let db = Firestore.firestore()

    @State var ref: DocumentReference? = nil
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Course Name")) {
                    TextField("Enter course name", text: $viewModel.course.name)
                }.textFieldStyle(.roundedBorder)
                Section(header: Text("Course URL")) {
                    TextField("Enter course URL", text: $viewModel.course.url)
                }.textFieldStyle(.roundedBorder)
                Section {
                    Picker("Status", selection: $selection) {
                        ForEach(status, id: \.self) {
                            Text($0)
                        }
                    }
                }
                if selection == "Complete" {
                    Section(header: Text("Date completed")) {
                        DatePicker("Date completed", selection: $date, displayedComponents: .date)
                            .datePickerStyle(.compact)
                            .labelsHidden()
                    }
                }

                Section(header: Text("Comments")) {
                    TextEditor(text: $viewModel.course.comments)
                }
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
                        }.disabled(!viewModel.modified)
                    }
                }
            }
            .navigationTitle("Course Information")
            .toolbar {
                Button {
                    handleXMarkTapped()
                } label: {
                    Image(systemName: "xmark")
                        .font(.headline)
                }
            }
        }
    }

    func handleXMarkTapped() {
        dismiss()
    }

    func handleSumitTapped() {
        viewModel.save()
        dismiss()
    }
}

struct AddCourseSheet_Previews: PreviewProvider {
    static var previews: some View {
        AddCourseSheet(courseName: "", courseURL: "", comments: "")
    }
}
