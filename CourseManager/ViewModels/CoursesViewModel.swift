//
//  CoursesViewModel.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-09-30.
//

import Foundation

import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift
import SwiftUI
// import CoreMIDI

class CoursesViewModel: ObservableObject {
    @Published var courses = [CourseInformation]()

    private var db = Firestore.firestore()

    func fetchData() {
        db.collection("courses").addSnapshotListener { querySnapshot, error in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                guard let documents = querySnapshot?.documents else {
                    print("no documents")
                    return
                }
                self.courses = documents.compactMap { queryDocumentSnapshot -> CourseInformation? in
                    try? queryDocumentSnapshot.data(as: CourseInformation.self)
                }
            }
        }
    }
}
