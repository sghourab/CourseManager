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
    
    func goToSecondaryApp() {
        //hardcoded values to be replaced soon
        let application = UIApplication.shared
        let secondAppPath = "BuildASwiftUIAppforiOS15://"
        guard let websiteURL = URL(string: "https://github.com/sghourab/SwiftUIPractice1") else {
            return
        }
        if let appUrl = URL(string: secondAppPath) {
            if application.canOpenURL(appUrl) {
                application.open(appUrl)
            } else {
                application.open(websiteURL)
            }
        }
    }
    
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
