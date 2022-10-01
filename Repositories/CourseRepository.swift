//
//  CourseRepository.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-09-29.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseFirestoreCombineSwift
import Combine


class CourseRepository: ObservableObject {
    private let store = Firestore.firestore()
    private let path = "course"
    @Published var courses: [CourseInformation] = []
    
    init() {
        get()
    }
    
    func get() {
        store.collection(path)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print("Error getting course Information from FireStore: \(error.localizedDescription)")
                    return
                }
                self.courses = querySnapshot?.documents.compactMap { document in
                    try? document.data(as: CourseInformation.self)
                } ?? []
            }
    }
}
