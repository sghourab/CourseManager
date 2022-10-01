//
//  BookViewModel.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-09-30.
//

import Combine
import Firebase
import Foundation

class CourseViewModel: ObservableObject {
    @Published var course: CourseInformation
    @Published var modified = false
    private var db = Firestore.firestore()
    private var cancellables = Set<AnyCancellable>()

    init(course: CourseInformation = CourseInformation(id: "", name: "", url: "", dateOfCompletion: Date(), comments: "")) {
        self.course = course
        self.$course
            .dropFirst()
            .sink { [weak self] course in
                    self?.modified = true
            }
            .store(in: &cancellables)
    }

    func addCourse(course: CourseInformation) {
        do {
            try db.collection("courses").addDocument(from: course)
        } catch {
            print(error)
        }
    }

    func save() {
        addCourse(course: course)
    }
}
