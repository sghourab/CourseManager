//
//  CourseDetailsViewModel.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-10-04.
//

import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift
import Foundation
import SwiftUI

class CourseDetailsViewModel: ObservableObject {
    @Published var course: CourseInformation = .init(id: "", name: "", url: "", gitHubURL: "", status: .todo, dateOfCompletion: Date(), comments: "")

    func getCourseInformation(courseID: String) {
        let courseRef = CourseRepository.collection.document(courseID)
        courseRef.getDocument(as: CourseInformation.self) { result in
            switch result {
            case .success(let course):
                self.course = course
            case .failure(let error):
                print("Error decoding document: \(error.localizedDescription)")
            }
        }
    }
}
