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

class CoursesViewModel: ObservableObject {
    @Published var courses = [CourseInformation]()

    var db = Firestore.firestore()

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

    func deleteCourseFromFirestore(id: String) {
        db.collection("courses").document(id).delete { error in
            if let error = error {
                print("Error removing document: \(error)")
            } else {
                print("Course successfully removed")
            }
        }
    }

    func handleOnDeleteSwipeAction(offSets: IndexSet) {
        let index = offSets[offSets.startIndex]
        let selectedID = courses[index].id

        deleteCourseFromFirestore(id: selectedID ?? "")

        courses.remove(atOffsets: offSets)
    }
}
