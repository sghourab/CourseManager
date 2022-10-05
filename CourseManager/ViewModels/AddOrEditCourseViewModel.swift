//
//  BookViewModel.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-09-30.
//

import Combine
import Firebase
import Foundation

class AddOrEditCourseViewModel: ObservableObject {
    @Published var course: CourseInformation = .init(id: "", name: "", url: "", gitHubURL: "", status: .todo, dateOfCompletion: Date(), comments: "")
    private var db = Firestore.firestore()
    private var cancellables = Set<AnyCancellable>()

    func addCourse(course: CourseInformation) {
        do {
            try db.collection("courses").addDocument(from: course)
        } catch {
            print(error)
        }
    }

    func edit() {
        let idRef = db.collection("courses").document(course.id!)

        idRef.updateData([
            "name": course.name,
            "url": course.url,
            "gitHubURL": course.gitHubURL,
            "status": course.status.rawValue,
            "dateOfCompletion": course.dateOfCompletion,
            "comments": course.comments
        ])
    }

    func save() {
        addCourse(course: course)
    }
}
