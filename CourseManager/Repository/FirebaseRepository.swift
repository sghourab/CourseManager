//
//  FirebaseRepository.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-10-10.
//

import FirebaseFirestore
import FirebaseFirestoreSwift
import Foundation

class CourseRepository: ObservableObject {
    static let db = Firestore.firestore()
    static let collection = db.collection("courses")
}
