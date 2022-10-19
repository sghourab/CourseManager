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
    private var cancellables = Set<AnyCancellable>()

    private func addCourse(course: CourseInformation) {
        do {
            try CourseRepository.collection.addDocument(from: course)
        } catch {
            print(error)
        }
    }

    func edit() {
        guard let courseID = course.id else {
            return
        }
        let idRef = CourseRepository.collection.document(courseID)

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
