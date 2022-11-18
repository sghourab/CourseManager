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
    @Published var course: CourseInformation = .init(id: "", name: "", url: "", imageName: "", progressPercentage: 0.5, gitHubURL: "", status: .todo, dateOfCompletion: Date(), comments: "")
    private var cancellables = Set<AnyCancellable>()

    private func addCourse(course: CourseInformation) {
        do {
            try Repository.courseCollection.addDocument(from: course)
        } catch {
            print(error)
        }
    }

    func edit() {
        guard let courseID = course.id else {
            return
        }
        let idRef = Repository.courseCollection.document(courseID)

        idRef.updateData([
            "name": course.name,
            "imageName": course.imageName,
            "url": course.url,
            "gitHubURL": course.gitHubURL,
            "status": course.status.rawValue,
            "progressPercentage": course.progressPercentage,
            "dateOfCompletion": course.dateOfCompletion,
            "comments": course.comments
        ])
    }

    func save() {
        addCourse(course: course)
    }
}
